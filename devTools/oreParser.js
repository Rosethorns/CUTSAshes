const fs = require('fs');
const csv = require('csv-parser');

function parseOres(file) {
    file = file || 'ores.csv';
    const ores = [];
    return new Promise((resolve) => {
        fs
            .createReadStream(file)
            .pipe(csv())
            .on('data', (data) => ores.push(data))
            .on('end', () => {
                resolve(ores);
            });
    });
}

module.exports = {
    parseOres: parseOres
};