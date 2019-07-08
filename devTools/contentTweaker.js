const fs = require('fs');
const _ = require('lodash');
const oreParser = require('./oreParser');

const mappings = {};
let cachedOres;

function parse() {
    return Promise.all([
        new Promise((resolve, reject) => {
            fs.readFile('../config/acronym/saved/saved_sub_blocks_contenttweaker.json', (err, data) => {
                if (err) {
                    console.log(`Unable to read ${saved_sub_blocks_contenttweaker.json}`, err);
                    reject(err);
                    return;
                }

                resolve(JSON.parse(data.toString()));
            })
        }),
        oreParser.parseOres('ores.csv')
    ]).then(([data, ores]) => {
        cachedOres = ores;
        _.each(data.savedSubBlockNames, (blocks, block) => {
            _.each(blocks, (id, sub) => {
                mappings[id.replace(/-/m,'')] = {
                    'block': block,
                    'sub': parseInt(sub)
                };
            });
        });
    });
}

function getGregtechOreMapping(oreName, stoneName, variety, mod) {
    variety = variety ? '_' + variety : '';
    mod = mod || 'undergroundbiomes';

    let name = _.snakeCase(_.find(cachedOres, (o) => o.Ore === oreName).Names.split(',')[0].replace(/-/m,'')).replace(/_(?=[0-9])/,'');

    return mappings[`${name}_ore_${mod}_${stoneName}${variety}`];
}

module.exports = {
    parse: parse,
    getGregtechOreMapping: getGregtechOreMapping
};