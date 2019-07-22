const fs = require('fs');
const _ = require('lodash');
const csv = require('csv-parser');

const processors = require('./processors');
const book = require('./book');
const util = require('./util');
const oreDictionary = require('./oreDictionary');
const worldgen = require('./worldgen');
const contentTweaker = require('./contentTweaker');
const oreParser = require('./oreParser');

const oreOredicts = {
    'ore': {'scannable': true},
    'oreGravel': {'scannable': true},
    'oreNetherrack': {'scannable': true},
    'oreEndstone': {'scannable': true},
    'oreSand': {'scannable': true},
    'oreBlackgranite': {'scannable': true},
    'oreRedgranite': {'scannable': true},
    'oreMarble': {'scannable': true},
    'oreBasalt': {'scannable': true},
    'dustTiny': {},
    'dustSmall': {},
    'dust': {},
    'dustImpure': {},
    'dustPure': {},
    'crushed': {},
    'crushedPurified': {},
    'crushedCentrifuged': {}
};

const tiers = { // chem reactor is on tier 1 because I couldn't fit it anywhere except in the bottom left of the page
    1: ["forgeHammer", "macerator", "smelter", "fluidExtractor", "blastFurnace", "purified.chemicalReactor"],
    2: ["crushed.chemicalBath", "crushed.oreWasher", "crushed.macerator", "crushed.forgeHammer", "crushed.hammer"],
    3: [
        "crushed.thermalCentrifuge", "purified.thermalCentrifuge", "purified.sifter",
        "purified.macerator", "purified.hammer", "purified.forgeHammer",
        "impureDust.smelter"
    ],
    4: [
        "centrifuged.macerator", "centrifuged.hammer", "centrifuged.forgeHammer",
        "pureDust.electromagneticSeparator", "pureDust.smelter",
        "pureDust.centrifuge", "impureDust.centrifuge"
    ]
};

let oreCache = [];

/**
 * Keys the process item per the page structure
 * @param {int} i The current key
 * @param {string} prefix The prefix for the key
 */
function keyProcess(item, i, prefix) {
    return _
        .chain(item)
        .mapKeys((value, key) => {
            switch (key) {
                case 'item':
                    return `${prefix}${i}`;
                case 'qty':
                    return `${prefix}Amount${i}`;
                case 'chance':
                    return `${prefix}Chance${i}`;
            }
        })
        .toPairs()
        .value();
}

/**
 * Builds out the pages for the individaul processes
 * @param {array} processes The list of processes
 * @param {object} row The ore row being processed
 * @param {object} entry The book entry
 */
function buildProcessPages(processes, row, entry) {
    _
        .chain(processes)
        .map((p) => {
            // Remap keys for our inputs and outputs
            let i = 1;
            const inputs = _.chain(p.inputs || [{
                'item': `ore:ore${row.Ore}`
            }])
                .union(p.extraInputs)
                .flatMap((item) => keyProcess(item, i++, 'input'))
                .fromPairs()
                .value();
            i = 1;
            const outputs = _.chain(p.outputs)
                .flatMap((item) => keyProcess(item, i++, 'output'))
                .fromPairs()
                .value();
            const res = {
                'title': p.title,
                'machine': p.machine,
                'processLink': p.processLink
            };
            _.merge(res, inputs, outputs);
            return res;
        })
        .chunk(2)
        .map((p) => {
            // Finally, create the pairs on each page
            const output = {
                'type': 'ore_processing'
            };
            _.merge(output, _.mapKeys(p[0], (v, k) => `${k}_p1`), p[1] && _.mapKeys(p[1], (v, k) => `${k}_p2`) || {});
            return output;
        })
        .each((page) => {
            entry.pages.push(page);
        })
        .commit();
}

/**
 * Returns the item's string version or undefined
 * @param {object} item The item to stringify
 */
function stringifyItem(item) {
    if (!item) return;

    let output = _.cloneDeep(item);

    if(output.item.startsWith('ore')) {
        output.item = oreDictionary.resolveOredict(output.item);
    }

    if (output.item && output.qty && 1 < parseInt(output.qty)) {
        if (output.item.endsWith('}')) output.item.replace('{', `#${output.qty}{`);
        else output.item += `#${output.qty}`;
    }

    return output.item || item.item;
}

/**
 * Generates the precaution list for this row
 * @param {object} row The data to process
 */
function listPrecautions(row) {
    const precautions = [];

    if (row.Rads) {
        // TODO: probably just read in the NC configs
        const [match, rads, mult] = row.Rads.match(/([0-9]+)([a-z]+)?/i);
        if (match) {
            let radiationLevel = parseFloat(rads);
            if (mult)
                radiationLevel *= util.metricConvs[mult] || 1.0;
            let color = '000';
            if (radiationLevel <= Math.pow(10, -4))
                color = 'FCD116';
            else if (radiationLevel <= Math.pow(10, -2))
                color = 'FF8600';
            else
                color = 'FF2400';
            precautions.push(` - Radiation: $(#${color})${rads} ${mult}Rads/t$()`);
        }
    }

    return precautions;
}

function parseCrushed() {
    let ores = [];
    return new Promise((resolve) => {
        fs
            .createReadStream('./ores-crushed.csv')
            .pipe(csv())
            .on('data', (data) => ores.push(data))
            .on('end', () => {
                resolve(ores);
            });
    });
}

function parsePurified() {
    let ores = [];
    return new Promise((resolve) => {
        fs
            .createReadStream('./ores-purified.csv')
            .pipe(csv())
            .on('data', (data) => ores.push(data))
            .on('end', () => {
                resolve(ores);
            });
    });
}

function parseImpureDusts() {
    let ores = [];
    return new Promise((resolve) => {
        fs
            .createReadStream('./dust-impure.csv')
            .pipe(csv())
            .on('data', (data) => ores.push(data))
            .on('end', () => {
                resolve(ores);
            });
    });
}

function parsePureDusts() {
    let ores = [];
    return new Promise((resolve) => {
        fs
            .createReadStream('./dust-pure.csv')
            .pipe(csv())
            .on('data', (data) => ores.push(data))
            .on('end', () => {
                resolve(ores);
            });
    });
}
function parseCentrifuged() {
    let ores = [];
    return new Promise((resolve) => {
        fs
            .createReadStream('./centrifuged.csv')
            .pipe(csv())
            .on('data', (data) => ores.push(data))
            .on('end', () => {
                resolve(ores);
            });
    });
}


/**
 * Generates the content tweaker script
 * to create all the ore materials and
 * ore drops
 */
function genContentTweakerScripts() {
    const stoneVariants = _
        .chain(worldgen.stoneClasses)
        .flatMap((types) => _.flatMap(types, (t) => [
            `undergroundbiomes:${t}`,
            `undergroundbiomes:${t}_sand`,
            `undergroundbiomes:${t}_gravel`
        ]))
        .union(_.map(worldgen.additionalOre, (t) => t.variant))
        .join(',')
        .value();
    fs.writeFileSync(`../scripts/ContentTweakerGregtechOreMaterials.zs`, _.flatten([
        '#priorty 9999',
        '#loader contenttweaker',
        '',
        'import crafttweaker.item.IItemStack;',
        'import mods.contenttweaker.Color;',
        'import mods.contenttweaker.Material;',
        'import mods.contenttweaker.MaterialPartData;',
        'import mods.contenttweaker.MaterialSystem;',
        '',
        'global OREDEFS as Material[string] = {',
        _.map(oreCache, (ore) => {
            return `    "${ore.Ore}": MaterialSystem.getMaterialBuilder().setName("${_.first(ore.Names.split(','))}")` +
                `.setColor(${parseInt(ore.Color)}).build()`;
        }).join(',\n'),
        '};',
        '',
        'function addMaterialOre (mat as Material, key as string) {',
        `    var ore_types = ["ore"] as string[];`,
        `    var ores = mat.registerParts(ore_types);`,
        '',
        _.map([contentTweaker.typeDefs.ore], (props) => {
            return [
                `    for i, ore in ores {`,
                `        var oreData = ore.getData();`,
                `        oreData.addDataValue("variants", "${stoneVariants}");`,
                `        oreData.addDataValue("hardness", "${props.hardness}");`,
                `        oreData.addDataValue("resistance", "${props.resistance}");`,
                `        oreData.addDataValue("harvestTool", "${props.tool}");`,
                `        oreData.addDataValue("harvestLevel", "1");`,
                `    }`,
                ''
            ].join('\n');
        }),
        `    mat.registerPart("clump");`,
        '}',
        '',
        'for key, material in OREDEFS {',
        '    addMaterialOre(material, key);',
        '}'
    ]).join('\n'));
}

/**
 * Generates later scripts after all parsing is complete
 */
function generatePostScripts() {
    _.each(oreCache, (ore) => {
        const oreName = util.gregOreToOreDict(ore.Ore);
        const material = contentTweaker.getGregtechMaterialName(oreName);
        const smelterOutput = ore.Smelter && oreDictionary.resolveOredict(ore.Smelter);
        const materialPart = contentTweaker.getMaterialPartMapping(`${material}_clump`);

        const blocks = _
            .chain({'cobblestone': null, 'gravel': 'gravel', 'sand': 'sand'})
            .map((variety, dict) => {
                return _.map(worldgen.stoneClasses, (types, stone) => {
                    return _.map(types, (subtype, idx) => {
                        const mapping = contentTweaker.getGregtechOreMapping(oreName, subtype, variety);

                        if (!mapping) {
                            console.warn(`Missing Content Tweaker mapping for ${oreName} in ${subtype}${variety}.`);
                            return;
                        }

                        return {
                            name: `${_.startCase(subtype)} ${_.startCase(stone)} ${_.startCase(dict)}`,
                            blockstate: `contenttweaker:sub_block_holder_${mapping.block}:${mapping.sub}`,
                            baseBlock: `<undergroundbiomes:${stone}_${dict}:${idx}>`
                        };
                    });
                });
            })
            .flattenDeep()
            .filter((o) => o !== undefined)
            .value();

        _.each(worldgen.additionalOre, (add) => {
            const [mod,variant] = add.variant.split(':');
            const mapping = contentTweaker.getGregtechOreMapping(oreName, variant, '', mod);

            blocks.push({
                name: `${_.startCase(mod)} ${_.startCase(variant)}`,
                blockstate: `contenttweaker:sub_block_holder_${mapping.block}:${mapping.sub}`,
                baseBlock: `<${add.predicate.startsWith('ore_dict') ? oreDictionary.resolveOredict(add.predicate.substr(9)) : add.predicate.substr(6)}>`
            });
        });

        // TODO: make this more generic
        if(oreName !== 'Amber') {
            _.each({
                'minecraft:cobblestone:0': 0,
                'minecraft:stone:1': 1,
                'minecraft:stone:3': 2,
                'minecraft:stone:5': 3,
                'minecraft:gravel': 4,
                'minecraft:netherrack': 6,
                'minecraft:end_stone': 7,
                'minecraft:sand:0': 8,
                'minecraft:sand:1': 9
            }, (idx, base) => {
                blocks.push({
                    name: _.startCase(base.split(':')[1]),
                    blockstate: `gregtech:ore_${_.snakeCase(ore.Ore).replace('_235','235')}_0:${idx}`,
                    baseBlock: `<${base}>`
                });
            });
        }


        fs.writeFileSync(`../scripts/drops/Ore${util.pascalCase(oreName)}.zs`, _.flattenDeep([
            'import crafttweaker.item.IItemStack;',
            'import mods.dropt.Dropt;',
            '',
            'var clumps = Dropt.list("gtce_clumps").priority(1);',
            '',
            `var clump = <${materialPart}> as IItemStack;`,
            `<ore:ore${util.pascalCase(oreName)}>.add(clump);`,
            smelterOutput && `furnace.addRecipe(<${smelterOutput}>, clump);` || '// No smelter output',
            '',
            '',
            '',
            _.map(blocks, (block) => {
                const blockMatch = `    .matchBlocks(["${block.blockstate}"])`;
                    
                return [
                    '/*',
                    ` * ${block.name}`,
                    ' */',
                    'clumps.add(Dropt.rule()',
                    blockMatch,
                    '    .dropStrategy("UNIQUE")',
                    '    .dropCount(Dropt.range(5))',
                    '    .addDrop(Dropt.drop()',
                    '        .selector(Dropt.weight(1), "EXCLUDED", 0)',
                    `        .items([clump], Dropt.range(1))`,
                    '    )',
                    '    .addDrop(Dropt.drop()',
                    '        .selector(Dropt.weight(1), "EXCLUDED", 1)',
                    `        .items([clump], Dropt.range(0,1))`,
                    '    )',
                    '    .addDrop(Dropt.drop()',
                    '        .selector(Dropt.weight(1), "EXCLUDED", 2)',
                    `        .items([clump], Dropt.range(0,1))`,
                    '    )',
                    '    .addDrop(Dropt.drop()',
                    '        .selector(Dropt.weight(1), "EXCLUDED", 3)',
                    `        .items([clump], Dropt.range(0,1))`,
                    '    )',
                    '    .addDrop(Dropt.drop()',
                    '        .selector(Dropt.weight(1), "EXCLUDED", 0)',
                    `        .items([${block.baseBlock}])`,
                    '    )',
                    '    .addDrop(Dropt.drop()',
                    '        .selector(Dropt.weight(1), "REQUIRED")',
                    `        .items([<${block.blockstate}>])`,
                    '    )',
                    ');',
                    '',
                    ''
                ];
            })
        ]).join('\n'));
    });

}

/**
 * Deals with the heavy lifting of generating the book
 * @param {object} row The row to process
 * @param {string} name Ore name
 * @param {object} worldgenNodesByOre List of worldgen ores
 * @param {object} pathmap The process map
 * @param {array} names Split list of names for the ore
 */
function generateBookEntry(row, name, worldgenNodesByOre, pathmap, names) {
    const entry = {
        "name": name,
        "category": "ores",
        "pages": [
            {
                "type": "ore_overview",
                "title": name,
                "abbreviation": row.Symbol,
                "link": row.Link,
                "source": row.Source || 'Wikipedia',
                "scan": `$(#${row.Color.substr(2)})█$() ${row.Rarity}`
            },
            {
                "type": "ore_found_in"
            }
        ]
    };

    entry.pages[0].precautions = listPrecautions(row).join('$(br)');

    // Prep the list of ore veins:
    let entryIdx = 1;
    _
        .chain(worldgenNodesByOre[row.Ore])
        .take(4)
        .each((node) => {
            const oreNodeEntry = {};
            oreNodeEntry[`title_p${entryIdx}`] = _.startCase(node.name);
            oreNodeEntry[`yRange_p${entryIdx}`] =
                (node.max_height && node.min_height)
                    ? `${node.min_height}-${node.max_height}`
                    : node.max_height
                        ? `Below ${node.max_height}`
                        : `Above ${node.min_height}`;

            const dimOre = node.dimension === 'end'
                ? 7
                : node.dimension === 'nether'
                    ? 6
                    : 0;

            const weightTotal = _.sumBy(node.filler, (n) => n.weight);
            for (let oreIdx = 0; oreIdx < 6; oreIdx++) {
                if (!node.filler[oreIdx]) {
                    oreNodeEntry[`ore${oreIdx + 1}None_p${entryIdx}`] = true;
                    continue;
                }
                let oreItem = oreDictionary.resolveOredict('ore' + node.filler[oreIdx].ore);
                if (!oreItem) oreItem = 'ore:ore' + node.filler[oreIdx].ore;
                else if (oreItem.startsWith('gregtech:')) oreItem = oreItem.replace(':0', ':' + dimOre);
                oreNodeEntry[`ore${oreIdx + 1}_p${entryIdx}`] = oreItem;
                oreNodeEntry[`ore${oreIdx + 1}Pct_p${entryIdx}`] = `${_.round((node.filler[oreIdx].weight / weightTotal) * 100)}%`;
            }

            _.merge(entry.pages[1], oreNodeEntry);
            entryIdx++;
        })
        .commit();

    // List out the various processes:
    _.each(pathmap, (dict, path) => {
        const subprocess = path === '' ? row : _.get(row, path);
        subprocess.processes = [];
        _.each(processors, (p, idx) => {
            if (!subprocess[idx])
                return;
            const process = {
                'title': idx,
                'machine': p.machine,
                'processLink': `processes/${idx}`
            };
            subprocess[_.camelCase(idx)]
                = subprocess.processes[_.camelCase(idx)]
                = _.defaults(process, p.processor(subprocess[idx], row.Ore, dict + row.Ore));
        });
    });

    const leftPage = {
        "type": "ore_process_overview_left",
        "input": `ore:ore${row.Ore}`
    };
    const rightPage = {
        "type": "ore_process_overview_right"
    };

    const extraKeys = {
        '_fluid': ['fluid[0]', 'inputFluid[0]'],
        '_outputFluid': ['outputFluid[0]'],
        '_input': ['extraInputs[0]']
    };

    _.each(tiers, (machines, tier) => {
        const page = tier <= 2 ? leftPage : rightPage;
        _.each(machines, (machine) => {
            const data = _.get(row, machine);
            if (!data)
                return;
            const keyBase = `tier${tier}_${machine.replace('.', '_')}`;
            page[keyBase] = data.machine;
            // Add all the outputs:
            _.each(data.outputs, (o, i) => page[`${keyBase}_${i + 1}`] = stringifyItem(o));
            if (data.voltage)
                page[`${keyBase}_voltage`] = data.voltage;
            // Add in extra keys:
            _.each(extraKeys, (keys, suffix) => {
                const item = _.find(keys, (k) => _.get(data, k));
                if (!item)
                    return;
                page[`${keyBase}${suffix}`] = stringifyItem(_.get(data, item));
            });
        });
    });

    // Copy these keys specifically for the background:
    _.each([
        'tier3_purified_sifter',
        'tier3_impureDust_smelter',
        'tier4_pureDust_electromagneticSeparator',
        'tier4_pureDust_smelter'
    ], (k) => leftPage[k] = rightPage[k]);

    leftPage[`chemreactor_30v`] = leftPage['tier1_purified_chemicalReactor_voltage'] == '30';
    leftPage[`chemreactor_150v`] = leftPage['tier1_purified_chemicalReactor_voltage'] == '150';

    entry.pages.push(leftPage);
    entry.pages.push(rightPage);

    buildProcessPages(_.values(row.processes), row, entry);

    book.paginateDescription(row.Desc || 'TBD', entry);
    book.ores[row.Ore] = entry;

    _.each(names, (n) => book.crossReference.ores[n] = row.Ore);
}

function parse(file) {
    let scannable = '';

    const pathmap = {
        '': 'ore',
        'crushed': 'crushed',
        'purified': 'crushedPurified',
        'centrifuged': 'crushedCentrifuged',
        'impureDust': 'dustImpure',
        'pureDust': 'dustPure'
    };

    return Promise.all([
        oreParser.parseOres(file),
        parseCrushed(),
        parsePurified(),
        parseImpureDusts(),
        parsePureDusts(),
        parseCentrifuged(),
        //oreTexture.buildCache()
    ])
    .then(async(data) => {
        let [rawOres, crushedOres, purifiedOres, impureDusts, pureDusts, centrifuged] = data;

        const colorblind = [];

        // Adjust so veins are listed overworld -> nether -> end
        const dimAdjusts = {
            "overworld": 0.3,
            "nether": 0.2,
            "end": 0.1
        }

        // Quick parse of worlden ores for the second page:
        const worldgenNodesByOre = _.mapValues(worldgen.oreNodesByOre, (node, ore) => {
            _.each(node, (n) => n.filler = _.sortBy(n.filler, (f) => f.weight).reverse());
            return _.sortBy(node, (n) => n.weight + dimAdjusts[n.dimension]).reverse();
        });

        for (row of rawOres) {
            if(!row.Ore) continue;
            oreCache.push(row);

            // Link up the other tables:
            row.crushed = _.find(crushedOres, (o) => o.Ore == row.Ore);
            row.purified = _.find(purifiedOres, (o) => o.Ore == row.Ore);
            row.impureDust = _.find(impureDusts, (o) => o.Ore == row.Ore);
            row.pureDust = _.find(pureDusts, (o) => o.Ore == row.Ore);
            row.centrifuged = _.find(centrifuged, (o) => o.Ore == row.Ore);

            Object.keys(oreOredicts).forEach(idx => {
                const dict = oreOredicts[idx];

                const id = `${idx}${row.Ore}`;
                colorblind.push(util.createColorblindConfig(id, row.Symbol, dict));
                if (dict.scannable) scannable += `${id}=${row.Color}\n`;
            });

            // Prep the description:
            const names = _.map(row.Names.split(','), _.trim);
            const name = _.first(names);

            // Add the book entry:
            if (!row["Hide Entry"]) {
                generateBookEntry(row, name, worldgenNodesByOre, pathmap, names);
            }
        };

        // Create the new ConT ores
        genContentTweakerScripts();

        return {
            ores: oreCache,
            scannable: scannable,
            colorblind: colorblind
        };
    });
}

module.exports = {
    parse: parse,
    ores: oreCache,
    generatePostScripts: generatePostScripts
};
