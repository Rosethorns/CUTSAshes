const csv = require('csv-parser');
const fs = require('fs');
const _ = require('lodash');

const oreDictionaryParser = require('./oreDictionary');
const oreParser = require('./ore');
const materialParser = require('./material');
const worldgenParser = require('./worldgen');
const fluids = require('./fluids');
const book = require('./book');
const excavator = require('./excavator');

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
        worldgenParser.parse(),
        fluids.parse()
    ])
}).then(() => {
    worldgenParser.genUndergroundBiomesDefs(ores);
    worldgenParser.genGregtechOregen();
    worldgenParser.genZenScripts();
    worldgenParser.genNuclearCraftRads(ores);

    fs.writeFileSync('output.json', JSON.stringify(colorblind, null, 2));
    fs.writeFileSync('scannableColors.txt', scannable)
    fluids.genScannableConfig();

    worldgenParser.genAstralSorceryOreConfigs();
    return worldgenParser.updateBiomeDefs();
})
    .then(excavator.create)
    .then(book.create);
