const fs = require('fs');
const _ = require('lodash');
const oreParser = require('./oreParser');

const mappings = {};
const partMappings = {};
let cachedOres;

const typedefs = {
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

function parse() {
    return Promise.all([
        new Promise((resolve, reject) => {
            fs.readFile('../config/acronym/saved/saved_sub_blocks_contenttweaker.json', (err, data) => {
                if (err) {
                    console.log(`Unable to read saved_sub_blocks_contenttweaker.json`, err);
                    reject(err);
                    return;
                }

                resolve(JSON.parse(data.toString()));
            })
        }),
        new Promise((resolve, reject) => {
            fs.readFile('../config/acronym/saved/material_parts_contenttweaker.json', (err, data) => {
                if (err) {
                    console.log(`Unable to read material_parts_contenttweaker.json`, err);
                    reject(err);
                    return;
                }

                resolve(JSON.parse(data.toString()));
            })
        }),
        oreParser.parseOres('ores.csv')
    ]).then(([data, parts, ores]) => {
        cachedOres = ores;
        _.each(data.savedSubBlockNames, (blocks, block) => {
            _.each(blocks, (id, sub) => {
                mappings[id.replace(/-/m,'')] = {
                    'block': block,
                    'sub': parseInt(sub)
                };
            });
        });

        _.each(parts.materialMappings, (meta, id) => {
            partMappings[id.replace(/-/m,'')] = meta;
        })
    });
}

function getGregtechMaterialName(oreName) {
    const oreEntry = _.find(cachedOres, (o) => o.Ore === oreName);
    return _.snakeCase((oreEntry && oreEntry.Names.split(',')[0] || oreName).replace(/-/m,'')).replace(/_(?=[0-9])/,'');
}

function getGregtechOreMapping(oreName, stoneName, variety, mod) {
    variety = variety ? '_' + variety : '';
    mod = mod || 'undergroundbiomes';

    let name = getGregtechMaterialName(oreName);

    return mappings[`${name}_ore_${mod}_${stoneName}${variety}`];
}

function getMaterialPartMapping(part) {
    return `contenttweaker:material_part:${partMappings[part]}`;
}

module.exports = {
    parse: parse,
    getGregtechOreMapping: getGregtechOreMapping,
    typeDefs: typedefs,
    getGregtechMaterialName: getGregtechMaterialName,
    getMaterialPartMapping: getMaterialPartMapping
};