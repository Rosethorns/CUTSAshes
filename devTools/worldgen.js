const csv = require('csv-parser');
const fs = require('fs');
const _ = require('lodash');

const oreDictionary = require('./oreDictionary');
const contentTweaker = require('./contentTweaker');
const oreParser = require('./oreParser');
const util = require('./util');

const nodeChance = 0.0625

const dims = {
    'nether': {
        'id': -1,
        'meta': 6,
        'filler': {
            'minecraft:netherrack': 100,
            'minecraft:soul_sand': 15,
            'minecraft:gravel': 7,
            'minecraft:glowstone': 1,
            'minecraft:magma': 2
        },
        'orePredicates': [
            "ore_dict:netherrack"
        ],
        'predicate': ["is_nether"],
        'ubize': false
    },
    'overworld': {
        'id': 0,
        'meta': 0,
        'filler': {
            'minecraft:stone:0': 100,
            'minecraft:stone:1': 50,
            'minecraft:stone:3': 50,
            'minecraft:stone:5': 50,
            'minecraft:dirt:0': 20,
            'minecraft:gravel:0': 30,
            'minecraft:sand:0': 10,
            'minecraft:sand:1': 10,
            'minecraft:clay': 3
        },
        'orePredicates': [
            "ore_dict:sand",
            "ore_dict:sandstone",
            "block:undergroundbiomes:igneous_stone",
            "block:undergroundbiomes:metamorphic_stone",
            "block:undergroundbiomes:sedimentary_stone",
            "block:undergroundbiomes:igneous_gravel",
            "block:undergroundbiomes:metamorphic_gravel",
            "block:undergroundbiomes:sedimentary_gravel",
            "block:undergroundbiomes:igneous_sand",
            "block:undergroundbiomes:metamorphic_sand",
            "block:undergroundbiomes:sedimentary_sand"
        ],
        'ubize': true
    },
    'end': {
        'id': 1,
        'meta': 7,
        'filler': {
            'minecraft:end_stone': 100
        },
        'orePredicates': [
            "ore_dict:endstone"
        ],
        'predicate': ["name:the_end"],
        'ubize': false
    },
    'midnight': {
        'id': -23,
        'meta': 0,
        'filler': {
            'midnight:nightstone': 60,
            'midnight:trenchstone': 30,
            'midnight:deceitful_mud': 10
        },
        'orePredicates': [
            'ore_dict:midnightOreBase'
        ],
        'predicate': ['name:midnight'],
        'ubize': false
    }
};

const stoneClasses = {
    "igneous": ["red_granite", "black_granite", "rhyolite", "andesite", "gabbro", "basalt", "komatiite", "dacite"],
    "metamorphic": ["gneiss", "eclogite", "marble", "quartzite", "blueschist", "greenschist", "soapstone", "migmatite"],
    "sedimentary": ["limestone", "chalk", "shale", "siltstone", "lignite", "dolomite", "greywacke", "chert"]
};

const additionalReplacements = [
    {
        "predicate": "block:quark:elder_prismarine",
        "variant": "quark:elder_prismarine"
    },
    {
        "predicate": "block:earthworks:block_slate_green",
        "variant": "earthworks:slate_green"
    },
    {
        "predicate": "block:earthworks:block_slate",
        "variant": "earthworks:block_slate"
    },
    {
        "predicate": "block:earthworks:block_slate_purple",
        "variant": "earthworks:slate_purple"
    },
    {
        "predicate": "block:rustic:slate",
        "variant": "rustic:slate"
    },
    {
        "predicate": "ore_dict:stonePermafrost",
        "variant": "quark:icy_stone"
    },
    {
        "predicate": "ore_dict:stoneBrimstone",
        "variant": "quark:fire_stone"
    }
];

/**
 * List of additional ores to generate variants for
 */
const additionalOres = [
    {
        name: "Aquamarine",
        color: 0x4E78A0,
        variants: _.flatMapDeep(stoneClasses, (types, stone) => _.map(types, 
            (t) => _.map(['sand','gravel'], (dict) => ({
                block: `undergroundbiomes:${t}_${dict}`,
                predicate: `ore_dict:${dict}${_.upperFirst(stone)}${_.upperFirst(t)}`
            }))
        )),
        def: {
            "name": "Aquamarine",
            "density": 1,
            "max_height": 64,
            "min_height": 50,
            "generator": {
                "type": "ellipsoid",
                "radius": [3,9]
            },
            "generation_predicate": [
                "ore_dict:sand",
                "block:undergroundbiomes:igneous_sand",
                "block:undergroundbiomes:metamorphic_sand",
                "block:undergroundbiomes:sedimentary_sand",
                "block:undergroundbiomes:igneous_gravel",
                "block:undergroundbiomes:metamorphic_gravel",
                "block:undergroundbiomes:sedimentary_gravel"
            ],
            "dimension": "overworld",
            "biome_modifier": {
                "type": "biome_dictionary",
                "WATER": 500,
                "BEACH": 500,
                "MESA": -10000
            }
        },
        drops: {
            blocks: _.flatMapDeep(stoneClasses, (types, stone) => _.map(types, 
                (t, idx) => _.map(['sand','gravel'], (dict) => ({
                    subtype: t,
                    variety: dict,
                    base: `undergroundbiomes:${stone}_${dict}:${idx}`
                }))
            )),
            drop: "astralsorcery:itemcraftingcomponent:0"
        }
    }
];

const specialOres = {};

const items = [];

// Mutate dim filler first:
_.each(dims, (dim) => {
    const totalWeight = _.sum(_.values(dim.filler));
    dim.filler = _.map(dim.filler, (w, f) => {
        return {
            'block': f,
            'weight': w / totalWeight
        }
    });
});

// Build up custom ore lists:
_.each(['Light', 'Dusk', 'Flame', 'Water', 'Wind', 'Earth'], (aspect) => {
    const blocks = [];
    _.each(['nightstone', 'trenchstone'], (base) => {
        blocks.push({
            'predicate': `block:midnight:${base}`,
            'value': `block:contenttweaker:${_.toLower(aspect)}_aspected_${base}`
        });
    });
    specialOres[`ore${aspect}AspectedStone`] = {
        'default': null, // Because oh no, why would Arch CODE ANYTHING USEFUL
        'values': blocks
    };
});

const oreNodes = [];
const worldgenNodesByOre = {};

function parse() {
    return Promise.all([
        contentTweaker.parse(),
        new Promise((resolve) => {
            fs
                .createReadStream('oregen.csv')
                .pipe(csv())
                .on('data', (data) => {
                    data = _.mapKeys(data, (v, k) => _.snakeCase(k));
                    oreNodes.push({
                        "name": data.name,
                        "weight": parseInt(data.weight) || 1,
                        "density": parseFloat(data.density) || 1,
                        "max_height": parseInt(data.max_height) || 256,
                        "min_height": parseInt(data.min_height || 0),
                        "surface_stone_material": data.surface_stone_material,
                        "generator": {
                            "type": data.generator_type,
                            "radius": JSON.parse(data.generator_radius)
                        },
                        "generation_predicate": _.union(
                            [
                                "ore_dict:stone",
                                "ore_dict:gravel"
                            ], 
                            _.clone(dims[data.dimension].orePredicates),
                            _.map(additionalReplacements, (o) => o.predicate)
                        ),
                        "filler": _
                            .chain(data.filler)
                            .split(',')
                            .map((f) => {
                                const [itemString, weight] = f.split('@');

                                if (itemString.includes('#')) {
                                    let [block, variant, chisel] = itemString.split('#');

                                    return {
                                        "weight": weight,
                                        "block": {
                                            "value": block,
                                            "variant": variant,
                                            "chiseling_variant": chisel
                                        }
                                    };
                                }

                                return {
                                    "weight": weight,
                                    "ore": itemString
                                };
                            })
                            .value(),
                        "dimension": data.dimension
                    })
                })
                .on('end', () => {
                    _.each(oreNodes, (node) => {
                        let n = _.cloneDeep(node);
                        _
                            .chain(n.filler)
                            .filter((f) => f.ore)
                            .each((f) => f.ore = util.gregOreToOreDict(f.ore))
                            .each((f) => f.weight = parseInt(f.weight))
                            .each((f) => {
                                if (!worldgenNodesByOre[f.ore]) worldgenNodesByOre[f.ore] = [];
                                worldgenNodesByOre[f.ore].push(_.cloneDeep(n));
                            })
                            .commit();
                    });
                    
                    resolve(oreNodes);
                });
        }),
        new Promise((resolve) => {
            fs
                .createReadStream('items.csv')
                .pipe(csv())
                .on('data', (data) => {
                    // Get display names for everything:
                    items[`${data["Registry name"]}:${data["Meta/dmg"]}`] = data["Display name"];
                })
                .on('end', () => {
                    resolve();
                });
        })
    ]
    );
}

function genUndergroundBiomesDefs(ores) {
    const ubdefs = _
        .chain(ores)
        .map((ore) => {
            const oreItem = oreDictionary.resolveOredict(`ore${ore.Ore}`);
            if (!oreItem) return;

            const [mod, id, meta] = oreItem.split(':');

            return {
                "internalOreName": `${mod}:${id}`,
                "meta": _.isUndefined(meta) ? -1 : parseInt(meta || ''),
                "overlay": "undergroundbiomes:blocks/overlays/custom/ore_contrast1",
                "oreDirectories": [`ore${ore.Ore}`],
                "alphaOverlay": false,
                "color": `#${ore.Color.substr(2)}`,
                "lightValue": -1
            }
        })
        .filter((o) => o)
        .value();

    fs.writeFileSync('ubGregtech.json', JSON.stringify(ubdefs, null, 2));
}

/**
 * Adds ore variant to GTCE oregen structure
 * @param {string} oreName The ore to add
 * @param {string} idx The texture variant
 * @param {string} variety Anything to append to the texture string
 * @param {string} predicate The block predicate to use
 * @param {string} mod Optional mod identifier
 */
function addOreVariant(oreName, idx, variety, predicate, mod) {
    const mapping = contentTweaker.getGregtechOreMapping(oreName, idx, variety, mod);

    if (!mapping) {
        console.warn(`Missing Content Tweaker mapping for ${oreName} in ${idx}${variety}.`);
        return;
    }

    return {
        'predicate': predicate,
        'value': {
            'block': `contenttweaker:sub_block_holder_${mapping.block}`,
            'sub_block_number': mapping.sub
        }
    };
}

function genGregtechOregen() {
    const processor = (node, fn) => {
        const output = _.cloneDeep(node);
        delete output.name;
        delete output.dimension;

        // This will blow things up otherwise:
        if (output.surface_stone_material === '') delete output.surface_stone_material;
        if (dims[node.dimension].predicate) output.dimension_filter = dims[node.dimension].predicate;

        fn(output, node);

        fs.writeFileSync(`../config/gregtech/worldgen/${node.dimension}/${node.name}.json`, JSON.stringify(output, null, 2));
    };

    // Deal with the standard ore nodes
    _.each(oreNodes, (node) => processor(node, generateGregOreFiller));

    _.each(dims, (data, dim) => {
        const fillerWeight = _.ceil(
            (
                _
                    .chain(oreNodes)
                    .filter((n) => n.dimension == dim)
                    .sumBy((n) => n.weight)
                    .value()
                / (nodeChance * 2)
                // Multiply by 2 because it's a 50/50 chance to gen a node
            ) / (_.filter(additionalOres, (o) => o.def.dimension == dim).length + 1)
        );

        // Add in the additional ores:
        _
            .chain(additionalOres)
            .filter((o) => o.def.dimension == dim)
            .each((ore) =>
                processor(ore.def,
                    (output) => generateAdditionalOreFiller(output, fillerWeight, ore)
                )
            )
            .commit();

        const output = {
            "weight": fillerWeight,
            "density": 1.0,
            "min_height": 1,
            "max_height": 3,
            "generator": {
                "type": "single",
                "blocks_count": [0,0]
            },
            "filler": {
                "type": "ignore_bedrock",
                "value": {
                "type": "weight_random",
                    "values": [
                        {
                            "weight": 100,
                            "value": "block:minecraft:bedrock"
                        }
                    ]
                }
            },
            "dimension_filter": data.predicate || undefined
        };
        fs.writeFileSync(`../config/gregtech/worldgen/${dim}/whyyousodumbgtce.json`, JSON.stringify(output, null, 2));
    });
}

/**
 * Generates an entry for the filler ores
 * @param {object} output The output object to populate
 * @param {number} fillerWeight The per-object filler
 * @param {object} ore The ore being handled
 */
function generateAdditionalOreFiller(output, fillerWeight, ore) {
    output.weight = fillerWeight;
    output.filler = {
        "type": "simple",
        "value": {
            "type": "weight_random",
            "values": [
                {
                    "weight": 1,
                    "value": {
                        "type": "state_match",
                        "default": `ore_dict:ore${ore.name}`,
                        "values": _
                            .chain(ore.variants)
                            .map((v) => {
                                const [mod, variant] = v.block.split(':');
                                return addOreVariant(ore.name, variant, '', v.predicate, mod);
                            })
                            .filter((o) => o)
                            .value()
                    }
                }
            ]
        }
    };
}

/**
 * Creates the filler entry for a GTCE ore
 * @param {object} output The output node
 * @param {object} node The original node
 */
function generateGregOreFiller(output, node) {
    output.filler = {
        "type": "simple",
        "value": {
            "type": "weight_random",
            "values": _
                .chain(node.filler)
                .map((f) => {
                    let block = {
                        "weight": f.weight,
                        "value": {
                            "type": "state_match",
                            "default": f.ore || null,
                            "values": []
                        }
                    };

                    // Special handling for things like midnight ores
                    if (f.ore.startsWith('special')) {
                        const [__, special] = f.ore.split(':');
                        delete block.value.default;
                        _.merge(block.value, specialOres[special]);
                        return block;
                    }

                    let oreName = util.gregOreToOreDict(f.ore);
                    let oreItem = oreDictionary.resolveOredict(`ore${oreName}`);
                    if (!oreItem) {
                        console.log(`Unable to determine item for oredict ${f.ore}`);
                        return block;
                    }

                    if (dims[node.dimension].ubize) {
                        _.each({ 'stone': null, 'gravel': 'gravel', 'sand': 'sand' }, (variety, dict) => {
                            _.each(stoneClasses, (types, stone) => {
                                _.each(types, (idx) => {
                                    block.value.values.push(
                                        addOreVariant(oreName, idx, variety, `ore_dict:${dict}${_.upperFirst(stone)}${_.upperFirst(idx)}`)
                                    );
                                });
                            });
                        });
                    }

                    _.each(additionalReplacements, (ore) => {
                        const [mod, variant] = ore.variant.split(':');
                        block.value.values.push(addOreVariant(oreName, variant, '', ore.predicate, mod));
                    });

                    return block;
                })
                .filter(o => o)
                .value()
        },
    };
}

function genZenScripts() {
    let script = '';
    _.each(stoneClasses, (types, stone) => {
        _.each(types, (type, idx) => {
            script += `// ${_.startCase(type)} ${_.startCase(stone)}:\n`;
            script += `<ore:stone${_.upperFirst(stone)}${_.upperFirst(type)}>.add(<undergroundbiomes:${stone}_stone:${idx}>);\n`;
            script += `<ore:sand${_.upperFirst(stone)}${_.upperFirst(type)}>.add(<undergroundbiomes:${stone}_sand:${idx}>);\n`;
            script += `<ore:gravel${_.upperFirst(stone)}${_.upperFirst(type)}>.add(<undergroundbiomes:${stone}_gravel:${idx}>);\n`;
            script += '\n';
        });
    });

    fs.writeFileSync(`../scripts/GregtechUndergroundBiomesCompat.zs`, script);

    genPostOreScripts();
}

/**
 * Adds ore variant to GTCE oregen structure
 * @param {string} oreName The ore to add
 * @param {string} idx The texture variant
 * @param {string} variety Anything to append to the texture string
 * @param {array} blocks The list of blocks to hide
 * @param {string} mod Optional mod identifier
 */
function hideOreBlockInJei(oreName, idx, variety, blocks, mod) {
    const mapping = contentTweaker.getGregtechOreMapping(oreName, idx, variety, mod);

    if (!mapping) {
        console.warn(`Missing Content Tweaker mapping for ${oreName} in ${idx}${variety}.`);
        return;
    }

    blocks.push(
        `    <contenttweaker:sub_block_holder_${mapping.block}:${mapping.sub}>`
    );
}

function genPostOreScripts() {
    const script = {
        'header': 'import crafttweaker.item.IItemStack;\nvar ores = [\n',
        'footer': '\n] as IItemStack[];\n\n' +
            'for item in ores {\n' +
            '    mods.jei.JEI.hide(item);\n' +
            '}'
    }

    return oreParser
        .parseOres()
        .then((ores) => {
            _.each({'': null, ' Gravel': 'gravel', ' Sand': 'sand'}, (variety, varietyName) => {
                let blocks = [];

                _.each(ores, (ore) => {
                    if(!ore.Ore) return;

                    blocks.push(`    // ------- ${ore.Ore} -------`);
                    _.each(stoneClasses, (types) => {
                        _.each(types, (idx) => {
                            hideOreBlockInJei(ore.Ore, idx, variety, blocks);
                        });
                    });

                    _.each(additionalReplacements, (extra) => {
                        const [mod, variant] = extra.variant.split(':');
                        hideOreBlockInJei(ore.Ore, variant, '', blocks, mod);
                    })

                    _.each(_.range(1,14), (idx) => {
                        let itemId = `gregtech:ore_${_.snakeCase(ore.Ore).replace(/_(?=[0-9])/,'')}_0:${idx}`;

                        if (!items[itemId]) return;

                        blocks.push( 
                            `    <${itemId}>`
                        );
                    });
                });

                fs.writeFileSync(`../scripts/GregtechOreHidingJei${_.startCase(variety)}.zs`,
                    script.header + blocks.join(',\n') + script.footer
                );
            });
        });
}

function updateBiomeDefs() {
    const configRoot = "../config/biomesoplenty/biomes";
    const generators = {
        // Gems:
        "ruby": {'enable': false},
        "amber": {'enable': false},
        "tanzanite": {'enable': false},
        "peridot": {'enable': false},
        "topaz": {'enable': false},
        "sapphire": {'enable': false},
        "malachite": {'enable': false},
        "ruby": {'enable': false},
        "emeralds": {'enable': false},

        // Hazards:
        "poison_lakes": {},
        "poison_ivy": {},
        "quicksand": (biome, name) => (name.startsWith('desert') ? {'enable': false} : {}),
        "thorns": {},
        "bramble": {},

        // Features:
        "barley": {'enable': false},
        "berry_bushes": {'enable': false},
        "biome_essence": {'enable': false},
        "blue_milk_caps": {},
        "bushes": {},
        "cattail": {},
        "flax": {},
    };

    return Promise.all([
        util.getFilesIn(`${configRoot}/defaults/vanilla`),
        util.getFilesIn(`${configRoot}/defaults/biomesoplenty`)
    ]).then(([vanilla, bop]) => {
        const configs = {
            'vanilla': vanilla,
            'biomesoplenty': bop
        };

        _.each(configs, (files, dir) => {
            _.each(files, (file) => {
                const biomeDef = JSON.parse(fs.readFileSync(`${configRoot}/defaults/${dir}/${file}`));

                _.each(biomeDef.generators, (gen, name) => {
                    if (!generators[name]) return;

                    _.merge(gen,
                        _.isFunction(generators[name])
                            ? generators[name](biomeDef, file)
                            : generators[name]
                    );
                });

                console.log(`Updating biome definition for ${dir} biome: ${file}...`);
                fs.writeFileSync(`${configRoot}/${file}`, JSON.stringify(biomeDef, null, 2));
            })
        });
    });
}

function genAstralSorceryOreConfigs() {
    const ores = _
        .chain(worldgenNodesByOre)
        .mapValues((nodes, ore) => _
            .chain(nodes)
            .filter((node) => node.dimension === 'overworld')
            .sumBy((node) =>
                _.find(node.filler, (f) => f.ore === ore).weight /
                _.sumBy(node.filler, 'weight') * node.weight
            )
            .value()
        )
        .mapValues((weight) => _.round(weight * 100))
        .toPairs((weight, ore) => ({ 'ore': ore, 'weight': weight}))
        .filter((pair) => 0 < pair[1])
        .orderBy((pair) => pair[1])
        .reverse()
        .fromPairs()
        .value();

    const output = _.flatten([
        '# This file generated by a tool',
        'data {',
        '    S:data <',
        _.map(ores, (weight, ore) => `        ore${ore};${weight}`),
        '     >',
        '}'
    ]).join('\n');

    fs.writeFileSync('../config/astralsorcery/aevitas_ore_perk.cfg', output);
    fs.writeFileSync('../config/astralsorcery/mineralis_ritual.cfg', output);
    fs.writeFileSync('../config/astralsorcery/treasure_shrine.cfg', output);
}

function genNuclearCraftRads(oreCache) {
    const materials = {
        'Americium': util.getRadiationLevel('111u'),
        'Darmstadtium': util.getRadiationLevel('111u'),
        'Plutonium': util.getRadiationLevel('41u'),
        'Plutonium241': util.getRadiationLevel('71m'),
        'Thorium': util.getRadiationLevel('1u'),
        'Uranium': util.getRadiationLevel('385p'),
        'Uranium235': util.getRadiationLevel('1n')
    };

    const dicts = {
        'ingot': 1,
        'nugget': 1/9,
        'dustTiny': 1/9,
        'dustSmall': 4/9,
        'dust': 1,
        'dustImpure': 1,
        'dustPure': 1,
        'crushed': 1,
        'crushedPurified': 1,
        'crushedCentrifuged': 1,
        'plate': 1,
        'stick': 0.75,
        'block': 13,
        'plateCurved': 1,
        'ingotDouble': 2.25,
        'toolHeadSword': 2,
        'toolHeadPickaxe': 4,
        'toolHeadShovel': 1,
        'toolHeadAxe': 4,
        'toolHeadHoe': 2,
        'toolHeadHammer': 8,
        'toolHeadFile': 2,
        'toolHeadSaw': 2,
        'toolHeadDrill': 5,
        'toolHeadChainsaw': 2,
        'toolHeadWrench': 5,
        'toolHeadUniversalSpade': 8,
        'toolHeadSense': 4,
        'toolHeadBuzzSaw': 5,
        'turbineBlade': 7
    };

    fs.writeFileSync('nuclearCraftRads.txt', 
        _
            .chain(oreCache)
            .filter((ore) => ore.Ore && ore.Rads)
            .map((ore) => [`ore${ore.Ore}`, util.getRadiationLevel(ore.Rads)])
            .union(_.flatMap(materials, (level, material) => {
                return _.map(dicts, (mult, dict) => [`${dict}${material}`, util.roundRadiation(level * mult)]);
            }))
            // // Right. NC has oredict matching
            // .flatMap((ore) => {
            //     return _
            //         .chain([null, 'gravel', 'sand'])
            //         .flatMap((variety) => {
            //             let entries = [];
            //             _.each(stoneClasses, (types) => {
            //                 _.each(types, (idx) => {
            //                     const mapping = contentTweaker.getGregtechOreMapping(ore.Ore, idx, variety);
            //                     if(!mapping) return;
            //                     entries.push(`contenttweaker:sub_block_holder_${mapping.block}:${mapping.sub}`);
            //                 });
            //             });
    
            //             _.each(additionalOre, (extra) => {
            //                 const [mod, variant] = extra.variant.split(':');
            //                 const mapping = contentTweaker.getGregtechOreMapping(ore.Ore, variant, '', mod);
            //                 if(!mapping) return;
            //                 entries.push(`contenttweaker:sub_block_holder_${mapping.block}:${mapping.sub}`);
            //             })

            //             _.each(_.range(1,14), (idx) => {
            //                 let itemId = `gregtech:ore_${_.snakeCase(ore.Ore).replace(/_(?=[0-9])/,'')}_0:${idx}`;
    
            //                 if (!items[itemId]) return;
    
            //                 entries.push(itemId);
            //             });

            //             return entries;
            //         })
            //         .uniq()
            //         .map((entry) => ([entry, ore.RadLevel]))
            //         .value();
            // })
            .sortBy((pair) => pair[0])
            .fromPairs()
            .map((v, k) => `${k}_${v}`)
            .join('\n')
            .value()
    );
}

module.exports = {
    dimensionConfig: dims,
    parse: parse,
    oreNodes: oreNodes,
    oreNodesByOre: worldgenNodesByOre,
    genUndergroundBiomesDefs: genUndergroundBiomesDefs,
    genGregtechOregen: genGregtechOregen,
    genZenScripts: genZenScripts,
    genPostOreScripts: genPostOreScripts,
    stoneClasses: stoneClasses,
    additionalReplacements: additionalReplacements,
    specialOres: specialOres,
    additionalOres: additionalOres,
    updateBiomeDefs: updateBiomeDefs,
    genAstralSorceryOreConfigs: genAstralSorceryOreConfigs,
    genNuclearCraftRads: genNuclearCraftRads
}