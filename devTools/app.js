const csv = require('csv-parser');
const fs = require('fs');
const _ = require('lodash');

const oreDictionaryParser = require('./oreDictionary');
const oreParser = require('./ore');
const materialParser = require('./material');
const worldgenParser = require('./worldgen');
const book = require('./book');

// Data storage
const colorblind = [];
let scannable = '';
let ores = [];

oreDictionaryParser.parse('oredictionary.csv').then((data) => {
    oredicts = data;
}).then(() => {
    return Promise.all([
        materialParser.parse('materials.csv').then((data) => {
            _.merge(colorblind, data.colorblind);
        }),
        oreParser.parse('ores.csv').then((data) => {
            scannable = data.scannable;
            _.merge(colorblind, data.colorblind);
            ores = data.ores;
        }),
        worldgenParser.parse()
    ])
}).then(() => {
    worldgenParser.genUndergroundBiomesDefs(ores);
    worldgenParser.genGregtechOregen();
    worldgenParser.genZenScripts();

    fs.writeFileSync('output.json', JSON.stringify(colorblind, null, 2));
    fs.writeFileSync('scannableColors.txt', scannable)
    book.create();

    return worldgenParser.updateBiomeDefs();
});

