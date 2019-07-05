const fs = require('fs');
const _ = require('lodash');
const csv = require('csv-parser');

// Oredict parsing
const oreItemsRegex = /[A-Za-z:0-9*_]+@[0-9]+/gmi;
const oreItemRegex = /([A-Za-z0-9_]+):([A-Za-z0-9_]+)@([0-9]+)/i;
const oredicts = {};

/**
 * Returns an item from the oredict, preferring gregtech
 * @param {string} type The first bit of the oredict
 * @param {string} id The id of the actual dict
 */
function getOredictItem(type, id) {
    return  resolveOredict(type + id);
}

/**
 * Resolves an oredictionary to a single item
 * @param {string} dict The oredict to resolve
 */
function resolveOredict(dict) {
    if (dict.startsWith('ore:')) dict = dict.substr(4);

    let oredict = oredicts[dict] || [];

    return  _.find(oredict, (od) => od.startsWith("gregtech")) ||
            _.first(oredict) ||
            undefined;
}

function parse(file) {

    return new Promise((resolve) => {
        fs
            .createReadStream(file)
            .pipe(csv())
            .on('data', (data) => {
                if (!data.ItemStacks) return;

                const matches = data.ItemStacks.match(oreItemsRegex);
                if (!matches) return;

                oredicts[data["OreDict Key"]] = _
                    .chain(matches)
                    .map((i) => {
                        const item = i.match(oreItemRegex);
                        if (!item) return null;
                        return `${item[1]}:${item[2]}:${item[3]}`;
                    })
                    .filter((i) => i)
                    .value();
            })
            .on('end', () => {
                resolve();
            });
    })
}

module.exports = {
    parse: parse,
    oredicts: oredicts,
    getOredictItem: getOredictItem,
    resolveOredict: resolveOredict
}