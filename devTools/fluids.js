const fs = require('fs');
const _ = require('lodash');
const csv = require('csv-parser');

const ores = require('./ore');

const fluids = {};

function parse(file) {
    let rows = [];
    file = file || 'fluids.csv';

    return new Promise((resolve) => {
        fs
            .createReadStream(file)
            .pipe(csv())
            .on('data', (data) => rows.push(data))
            .on('end', () => {
                _.each(rows, (row) => {
                    row.hasBlock = row.Block !== "-";
                    fluids[row.Name] = row;
                });

                resolve();
            })
        });
}

function genScannableConfig() {
    const oreMap = _.keyBy(ores.ores, (o) => _.snakeCase(o.Ore));


    fs.writeFileSync('scannableFluids.txt', _.flatten([
        "        water=0x4275DC",
        "        lava=0xE26723",
        "        astralsorcery.liquidstarlight=0xE0EEEE",
        "        blood=0xBE2625",
        "        flux_goo=0x912CEE",
        "        for.honey=0xFFB90F",
        "        honey=0xFFB90F",
        "        hot_spring_water=0x37FDFC",
        "        natural_gas=0x00C78C",
        "        oil=0x3B3B3B",
        "        oil_heavy=0x1F1F1F",
        "        oil_light=0x303030",
        "        oil_medium=0x2B2B2B",
        "        plasma=0xEE00EE",
        "        purifying_fluid=0x1874CD",
        "        sand=0xEECFA1",
        _
            .chain(fluids)
            .each((f) => f.ore = oreMap[f.Name])
            .filter((f) => f.hasBlock && f.ore)
            .map((f) => `        ${f.Name}=${f.ore.Color}`)
            .value()
    ]).join('\n'));
}

module.exports = {
    parse: parse,
    fluids: fluids,
    genScannableConfig: genScannableConfig,
};