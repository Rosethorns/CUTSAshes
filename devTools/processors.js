const _ = require('lodash');

const processingItemRegex = /([A-Z&]+)\*?((?<=\*)[0-9]+)?@?((?<=@)[0-9]+)?/i;

/**
 * Takes a string representation of the items and converts
 * it into an array of item objects
 * @param {string} items The input item string
 * @param {string} input The input item
 */
function parseProcessingItems(items, input) {
    return _
        .chain(items)
        .split(',')
        .map((i) => i.match(processingItemRegex))
        .filter((i) => i)
        .map((i) => {
            if (i[1] === '%') i[1] = input;
            return {
                'item': (i[1].indexOf(':') ? 'ore:' : '') + i[1],
                'qty': parseInt(i[2] || '1'),
                'chance': i[3]
            }
        })
        .value();
}

/**
 * Parses fluid list into individual fluid buckets
 * @param {string} fluids The list of fluids
 */
function parseFluids(fluids) {
    return _
        .chain(fluids)
        .split(',')
        .map((f) => {
            const [fluid, amnt] = f.split('*')
            return {
                'item': bucketize(fluid),
                'qty': parseInt(amnt || '1000')
            }
        })
        .value();
}

/**
 * Produces a bucket of fluid
 * @param {string} fluid The fluid name
 */
function bucketize(fluid) {
    return `forge:bucketfilled{FluidName: ${fluid}, Amount: 1000}`;
}

function genericProcess(cell, ore, input) {
    return {
        'outputs': parseProcessingItems(cell.replace('&', 'dustStone'), input)
    };
}

function genericEuProcess(cell, ore, input) {
    const [eu, outputs] = cell.split(';');
    return {
        'voltage': eu,
        'outputs': parseProcessingItems(outputs.replace('&', 'dustStone'), input)
    };
}

const processors = {
    'Smelter': {
        'machine': 'minecraft:furnace',
        'processor': genericProcess
    },
    'Hammer': {
        'machine': 'ore:craftingToolHardHammer',
        'processor': genericProcess
    },
    'Macerator': {
        'machine': 'gregtech:machine:60',
        'processor': genericEuProcess
    },
    'Fluid Extractor': {
        'machine': 'gregtech:machine:300',
        'processor': (cell, ore) => {
            const [eu, amnt] = cell.split(';');
            return {
                'voltage': eu,
                'outputs': [{
                    'item': bucketize(_.snakeCase(ore)),
                    'qty': `${amnt}`
                }]
            };
        }
    },
    'Forge Hammer': {
        'machine': 'gregtech:machine:330',
        'processor': genericEuProcess
    },
    'Blast Furnace': {
        'machine': 'gregtech:machine:511',
        'processor': (cell) => {
            const [eu, kelvin, inputs, outputs] = cell.split(';');
            return {
                'voltage': eu,
                'kelvin': kelvin,
                'extraInputs': parseProcessingItems(inputs.replace(/\+/m,'')),
                'outputs': parseProcessingItems(outputs)
            };
        }
    },
    'Ore Washer': {
        // 16;crushedPurifiedAluminium,dustTinyBauxite*3,dustStone
        'machine': 'gregtech:machine:380',
        'processor': genericEuProcess
    },
    'Thermal Centrifuge': {
        // 60;crushedCentrifugedAluminium,dustTinyBauxite*3,dustStone
        'machine': 'gregtech:machine:460',
        'processor': genericEuProcess
    },
    'Chemical Bath': {
        // 8;sodium_persulfate*1000;crushedPurifiedCobalt,dustStone@40,dustCobaltite@70
        'machine': 'gregtech:machine:180',
        'processor': (cell) => {
            const [eu, fluid, outputs] = cell.split(';');
            return {
                'voltage': eu,
                'fluid': parseFluids(fluid),
                'outputs': parseProcessingItems(outputs)
            };
        }
    },
    'Sifter': {
        // 16;gemExquisiteAlmandine@1,gemFlawlessAlmandine@4,gemAlmandine@15,gemFlawedAlmandine@20,gemChippedAlmandine@40,dustPureAlmandine@50
        'machine': 'gregtech:machine:450',
        'processor': genericEuProcess
    },
    'Chemical Reactor': {
        // 30;%;nitric_acid*1000;dustTinyPlatinumGroupSludge;blue_vitriol_water_solution*9000
        'machine': 'gregtech:machine:190',
        'processor': (cell) => {
            const [eu, inputs, inputFluid, outputs, outputFluid] = cell.split(';');
            return {
                'voltage': eu,
                'inputs': inputs,
                'inputFluid': parseFluids(inputFluid),
                'outputs': parseProcessingItems(outputs),
                'outputFluid': parseFluids(outputFluid)
            };
        }
    },
    'Centrifuge': {
        // 24;dustAluminium,dustTinyBauxite*3
        'machine': 'gregtech:machine:150',
        'processor': genericEuProcess
    },
    'Electromagnetic Separator': {
        // 24;%;dustNickel,nuggetIron@20,dustSmallIron@40
        'machine': 'gregtech:machine:250',
        'processor': (cell) => {
            const [eu,inputs,outputs] = cell.split(';');
            return {
                'voltage': eu,
                'outputs': parseProcessingItems(outputs)
            };
        }
    },
    'Crusher (IE)': {
        'machine': 'immersiveengineering:metal_decoration0:4',
        'processor': genericProcess
    },
    'Arc Furnace (IE)': {
        'machine': 'immersiveengineering:metal_decoration0:5',
        'processor': genericProcess
    },
    'Hammer (IE)': {
        'machine': 'immersiveengineering:tool:0',
        'processor': genericProcess
    }
};

module.exports = processors;