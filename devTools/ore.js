const fs = require('fs');
const _ = require('lodash');
const csv = require('csv-parser');

const processors = require('./processors');
const book = require('./book');
const util = require('./util');
const oreDictionary = require('./oreDictionary');
const worldgen = require('./worldgen');
const oreTexture = require('./oreTexture');
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

function parse(file) {
    let output = [];
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

        let ores = [];
        const colorblind = [];

        const conTweaker = {
            'ore': {
                "ores": {},
                "hardness": "10",
                "resistance": "10",
                "material": "rock",
                "sound": "stone",
                "tool": "pickaxe"
            },
            'oreGravel': {
                "ores": {},
                "hardness": "1",
                "resistance": "1",
                "material": "sand",
                "sound": "sand",
                "tool": "shovel"
            },
            'oreSand': {
                "ores": {},
                "hardness": "2.5",
                "resistance": "2.5",
                "material": "ground",
                "sound": "ground",
                "tool": "shovel"
            }
        };

        // Adjust so veins are listed overworld -> nether -> end
        const dimAdjusts = {
            "overworld": 0.3,
            "nether": 0.2,
            "end": 0.1
        }

        // Quick parse of worlden ores for the second page:
        let worldgenNodesByOre = {};
        _.each(worldgen.oreNodes, (node) => {
            let n = _.cloneDeep(node);
            _
                .chain(n.filler)
                .filter((f) => f.ore)
                .each((f) => f.ore = f.ore.substr(4))
                .each((f) => f.weight = parseInt(f.weight))
                .each((f) => {
                    id = util.pascalCase(f.ore);
                    if (!worldgenNodesByOre[id]) worldgenNodesByOre[id] = [];
                    worldgenNodesByOre[id].push(_.cloneDeep(n));
                })
                .commit();
        });

        worldgenNodesByOre = _.mapValues(worldgenNodesByOre, (node, ore) => {
            _.each(node, (n) => n.filler = _.sortBy(n.filler, (f) => f.weight).reverse());
            return _.sortBy(node, (n) => n.weight + dimAdjusts[n.dimension]).reverse();
        });

        let oreIdx = 0;
        for (row of rawOres) {
            if(!row.Ore) continue;
            ores.push(row);

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
                                : `Above ${node.min_height}`

                    const dimOre = 
                        node.dimension === 'end' 
                            ? 7
                            : node.dimension === 'nether'
                                ? 6
                                : 0;
                    const weightTotal = _.sumBy(node.filler, (n) => n.weight);
                    for (oreIdx = 0; oreIdx < 6; oreIdx++) {
                        if (!node.filler[oreIdx]) {
                            oreNodeEntry[`ore${oreIdx+1}None_p${entryIdx}`] = true;
                            continue;
                        }

                        oreNodeEntry[`ore${oreIdx+1}_p${entryIdx}`] = `gregtech:ore_${node.filler[oreIdx].ore}_0:${dimOre}`;
                        oreNodeEntry[`ore${oreIdx+1}Pct_p${entryIdx}`] = `${_.round((node.filler[oreIdx].weight/weightTotal)*100)}%`;
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
                    if (!subprocess[idx]) return;

                    const process = {
                        'title': idx,
                        'machine': p.machine,
                        'processLink': `processes/${idx}`
                    };

                    subprocess[_.camelCase(idx)]
                        = subprocess.processes[_.camelCase(idx)]
                        = _.defaults(process, p.processor(subprocess[idx], row.Ore, dict+row.Ore));
                });
            });

            const leftPage = {
                "type": "ore_process_overview_left",
                "input": `ore:ore${row.Ore}`
            };

            const rightPage = {
                "type": "ore_process_overview_right"
            }

            const extraKeys = {
                '_fluid': ['fluid[0]', 'inputFluid[0]'],
                '_outputFluid': ['outputFluid[0]'],
                '_input': ['extraInputs[0]']
            }

            _.each(tiers, (machines, tier) => {
                const page = tier <= 2 ? leftPage : rightPage;

                _.each(machines, (machine) => {
                    const data = _.get(row, machine);
                    if (!data) return;

                    const keyBase = `tier${tier}_${machine.replace('.','_')}`;
                    page[keyBase] = data.machine;

                    // Add all the outputs:
                    _.each(data.outputs, (o, i) => page[`${keyBase}_${i+1}`] = stringifyItem(o));
                    if (data.voltage) page[`${keyBase}_voltage`] = data.voltage;

                    // Add in extra keys:
                    _.each(extraKeys, (keys, suffix) => {
                        const item = _.find(keys, (k) => _.get(data, k));
                        if (!item) return;
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

            leftPage[`chemreactor_30v`] = leftPage['tier1_purified_chemicalReactor_voltage'] == '30'
            leftPage[`chemreactor_150v`] = leftPage['tier1_purified_chemicalReactor_voltage'] == '150'

            entry.pages.push(leftPage);
            entry.pages.push(rightPage);

            buildProcessPages( _.values(row.processes), row, entry);
            book.paginateDescription(row.Desc || 'TBD', entry);

            book.ores[row.Ore] = entry;
            _.each(names, (n) => book.crossReference.ores[n] = row.Ore);
        };

        const stoneVariants = _.flatMap(worldgen.stoneClasses, (types) => 
            _.flatMap(types, (t) => [
                `undergroundbiomes:${t}`,
                `undergroundbiomes:${t}_sand`,
                `undergroundbiomes:${t}_gravel`
            ])
        ).join(',');

        fs.writeFileSync(
            `scripts/ContentTweakerGregtechOreMaterials.zs`,
            _.flatten(
                [
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
                        _.map(ores, (ore) => {
                            return `    "${ore.Ore}": MaterialSystem.getMaterialBuilder().setName("${_.first(ore.Names.split(','))}")` +
                                `.setColor(${parseInt(ore.Color)}).build()`
                        }).join(',\n'),
                    '};',
                    '',
                    'function addMaterialOre (mat as Material, key as string) {',
                    `    var ore_types = ["ore"] as string[];`,
                    `    var ores = mat.registerParts(ore_types);`,
                    '',
                    _.map([conTweaker.ore], (props) => { //conTweaker, (props, type) => {
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
                    `    var sample as MaterialPartData = mat.registerPart("ore_sample").getData();`,
                    `    sample.addDataValue("drops", "oredict:crushed"~key);`,
                    '}',
                    '',
                    'for key, material in OREDEFS {',
                    '    addMaterialOre(material, key);',
                    '}'
                ]
            ).join('\n')
        );

        fs.writeFileSync(
            'contentTweaker_lang.txt',
            _.map(conTweaker, (v, k) => `tile.contenttweaker.${k}.name=${v.name}`).join('\n')
        );

        return {
            ores: ores,
            scannable: scannable,
            colorblind: colorblind
        };
    });
}

module.exports = {
    parse: parse
};