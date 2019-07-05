const fs = require('fs');
const _ = require('lodash');
const csv = require('csv-parser');

const book = require('./book');
const util = require('./util');


// Define the cross-join table
const materialOreDicts = {
    'ingot': {},
    'ingotHot': {'overlayColor': '90D0323B', 'prefix': '~'},
    'ingotDouble': {},
    'nugget': {},
    'plate': {},
    'plateDense': {},
    'stick': {},
    'bolt': {},
    'screw': {},
    'ring': {},
    'foil': {},
    'toolHeadSword': {'overlayColor': '90662400', 'prefix': '/'},
    'toolHeadPickaxe': {'overlayColor': '905FB943', 'prefix': '{'},
    'toolHeadShovel': {'overlayColor': '90D35AC6', 'prefix': '^'},
    'toolHeadAxe': {'overlayColor': '90058312', 'prefix': '<'},
    'toolHeadHoe': {'overlayColor': '90BC004B', 'prefix': '_'},
    'toolHeadHammer': {'overlayColor': '9000A357', 'prefix': '='},
    'toolHeadFile': {'overlayColor': '90516800', 'prefix': '`'},
    'toolHeadSaw': {'overlayColor': '90FFACEF', 'prefix': '"'},
    'toolHeadDrill': {'overlayColor': '90BB6A00', 'prefix': '@'},
    'toolHeadChainsaw': {'overlayColor': '906F002F', 'prefix': ':'},
    'toolHeadWrench': {'overlayColor': '90FFB565', 'prefix': '%'},
    'toolHeadUniversalSpade': {'overlayColor': '90FF7996', 'prefix': 'u'},
    'toolHeadSense': {'overlayColor': '90A99D53', 'prefix': '>'},
    'toolHeadBuzzSaw': {'overlayColor': '90FFB687', 'prefix': '*'},
    'turbineBlade': {},
    'wireFine': {},
    'stickLong': {},
    'gear': {},
    'wireGtSingle': {},
    'wireGtDouble': {},
    'wireGtQuadruple': {},
    'wireGtOctal': {},
    'wireGtHex': {},
    'cableGtSingle': {},
    'cableGtDouble': {},
    'cableGtQuadruple': {},
    'cableGtOctal': {},
    'cableGtHex': {},
    'block': {},
    'frameGt': {},
    'plateCurved': {}
}

function parse(file) {
    let materials = [];
    let output = [];

    return new Promise((resolve) => {
        fs
            .createReadStream(file)
            .pipe(csv())
            .on('data', (data) => materials.push(data))
            .on('end', () => {
                Object.keys(materialOreDicts).forEach(idx => {
                    console.log(`Generating outputs for ${idx}`)
                    const dict = materialOreDicts[idx];
                    materials.forEach(row => {
                        if(!row.Element) return;
                        output.push(util.createColorblindConfig(`${idx}${row.Element}`, row.Symbol, dict));
                    });
                });

                // Generate book pages:
                materials.forEach(row => {
                    if(!row.Description || row.Description === '') return;

                    // Prep the description:
                    const names = _.map(row.Names.split(','), _.trim);
                    const name = _.first(names);

                    // Add the book entry:
                    const entry = {
                        "name": name,
                        "category": "materials",
                        "pages": [
                            {
                                "type": "material_overview",
                                "title": name,
                                "abbreviation": row.Symbol,
                                "link": row.Link,
                                "source": row.Source || 'Wikipedia'
                            }
                        ]
                    }

                    // Add all the description pages:
                    book.paginateDescription(row.Description, entry);

                    book.materials[row.Element] = entry;

                    _.each(names, (n) => book.crossReference.materials[n] = row.Element);
                });

                resolve({
                    materials: materials,
                    colorblind: output
                });
            });
    })
}

module.exports = {
    parse: parse
};