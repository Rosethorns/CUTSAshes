const _ = require('lodash');
const fs = require('fs');

function createColorblindConfig(name, symbol, dict) {
    const item = {
        "stack": name,
        "overlay": (dict.prefix || '') + symbol
    };

    if(dict.underlay) item.underlay = dict.underlay;
    if(dict.overlayColor) item.overlayColor = dict.overlayColor;

    return item;
}

const metricConvs = {
    'M': Math.pow(10,6),
    'k': Math.pow(10,3),
    'h': Math.pow(10,2),
    'da': Math.pow(10,1),
    'd': Math.pow(10,-1),
    'c': Math.pow(10,-2),
    'm': Math.pow(10,-3),
    'u': Math.pow(10,-6),
    'n': Math.pow(10,-9),
    'p': Math.pow(10,-12)
};

function getFilesIn(dir) {
    return new Promise((resolve, reject) => {
        fs.readdir(dir, (err, files) => {
            err && reject(err) || resolve(files);
          });
    });
}

function pascalCase(input) {
    return  _.upperFirst(_.camelCase(input));
}

function gregOreToOreDict(oreName) {
    if (oreName.startsWith("ore:")) oreName = pascalCase(oreName.substr(4));
    else if(oreName.startsWith("ore_dict:")) oreName = pascalCase(oreName.substr(12));

    return oreName;
}

module.exports = {
    createColorblindConfig: createColorblindConfig,
    metricConvs: metricConvs,
    pascalCase: pascalCase,
    getFilesIn: getFilesIn,
    gregOreToOreDict: gregOreToOreDict
};
