const csv = require('csv-parser');
const fs = require('fs');
const _ = require('lodash');

const oreDictionary = require('./oreDictionary');
const contentTweaker = require('./contentTweaker');
const oreParser = require('./oreParser');

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
        }
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
        }
    },
    'end': {
        'id': 1,
        'meta': 7,
        'filler': {
            'minecraft:end_stone': 100
        }
    }
};

const stoneClasses = {
    "igneous": ["red_granite", "black_granite", "rhyolite", "andesite", "gabbro", "basalt", "komatiite", "dacite"],
    "metamorphic": ["gneiss", "eclogite", "marble", "quartzite", "blueschist", "greenschist", "soapstone", "migmatite"],
    "sedimentary": ["limestone", "chalk", "shale", "siltstone", "lignite", "dolomite", "greywacke", "chert"]
};

const additionalOre = [
    {
        "predicate": "block:quark:elder_prismarine",
        "variant": "quark:elder_prismarine"
    },
    {
        "predicate": "block:earthworks:block_slate_green",
        "variant": "earthworks:block_slate_green"
    },
    {
        "predicate": "block:earthworks:block_slate",
        "variant": "earthworks:block_slate"
    },
    {
        "predicate": "block:earthworks:block_slate_purple",
        "variant": "earthworks:block_slate_purple"
    },
    {
        "predicate": "block:rustic:slate",
        "variant": "rustic:slate"
    }
]

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

const oreNodes = []

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
                .on('end', () => resolve(oreNodes));
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
 * @param {string} block The object to add it to
 * @param {string} predicate The block predicate to use
 * @param {string} mod Optional mod identifier
 */
function addOreVariant(oreName, idx, variety, block, predicate, mod) {
    const mapping = contentTweaker.getGregtechOreMapping(oreName, idx, variety, mod);

    if (!mapping) {
        console.warn(`Missing Content Tweaker mapping for ${oreName} in ${idx}${variety}.`);
        return;
    }

    block.value.values.push({
        'predicate': predicate,
        'value': {
            'block': `contenttweaker:sub_block_holder_${mapping.block}`,
            'sub_block_number': mapping.sub
        }
    });    
}

function genGregtechOregen() {
    _.each(oreNodes, (node) => {
        let output = _.cloneDeep(node);
        delete output.name;
        delete output.dimension;

        // This will blow things up otherwise:
        if (output.surface_stone_material === '') delete output.surface_stone_material;

        output.filler = {
            "type": "simple",
            "value": {
                "type": "weight_random",
                "values": _
                    .chain(node.filler)
                    .map((f) => {
                        if (f.block) {
                            // this is one of the granites, leave be
                            return {
                                "weight": f.weight,
                                "value": f.block
                            };
                        }

                        let block = {
                            "weight": f.weight,
                            "value": {
                                "type": "state_match",
                                "default": f.ore
                            }
                        }

                        const oreName = _.upperFirst(_.camelCase(f.ore.substr(4)));

                        let oreItem = oreDictionary.resolveOredict(`ore${oreName}`);
                        if (!oreItem) {
                            console.log(`Unable to determine item for oredict ${f.ore}`);
                            return block;
                        };

                        block.value.values = [];

                        oreItem = _.chain(oreItem).split(':').take(2).join('_').value();
                        _.each({'stone': null, 'gravel': 'gravel', 'sand': 'sand'}, (variety, dict) => {
                            _.each(stoneClasses, (types, stone) => {
                                _.each(types, (idx) => {
                                    addOreVariant(
                                        oreName, idx, variety, block, 
                                        `ore_dict:${dict}${_.upperFirst(stone)}${_.upperFirst(idx)}`
                                    );
                                });
                            });
                        });

                        _.each(additionalOre, (ore) => {
                            const [mod,variant] = ore.variant.split(':');
                            addOreVariant(oreName, variant, '', block, ore.predicate, mod);
                        });

                        return block;
                    })
                    .filter(o => o)
                    .value()
            },
        };

        fs.writeFileSync(`../config/gregtech/worldgen/${node.dimension}/${node.name}.json`, JSON.stringify(output, null, 2));
    });
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

                    _.each(additionalOre, (extra) => {
                        const [mod, variant] = extra.variant.split(':');
                        hideOreBlockInJei(ore.Ore, variant, '', blocks, mod);
                    })

                    _.each(_.range(1,14), (idx) => {
                        blocks.push( 
                            `    <gregtech:ore_${_.snakeCase(ore.Ore).replace(/_(?=[0-9])/,'')}_0:${idx}>`
                        );
                    });
                });

                fs.writeFileSync(`../scripts/GregtechOreHidingJei${_.startCase(variety)}.zs`,
                    script.header + blocks.join(',\n') + script.footer
                );
            });
        });
}

module.exports = {
    dimensionConfig: dims,
    parse: parse,
    oreNodes: oreNodes,
    genUndergroundBiomesDefs: genUndergroundBiomesDefs,
    genGregtechOregen: genGregtechOregen,
    genZenScripts: genZenScripts,
    genPostOreScripts: genPostOreScripts,
    stoneClasses: stoneClasses,
    additionalOre: additionalOre
}