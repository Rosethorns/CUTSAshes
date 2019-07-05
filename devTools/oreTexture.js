const _ = require('lodash');
const Jimp = require('jimp');
const sharp = require('sharp');

const worldgen = require('./worldgen');

function getBase(block) {
    console.log(`Downloading ${block}.png...`);
    return Jimp
        .read({
            url: `https://raw.githubusercontent.com/Aang23/UndergroundBiomesConstructs/master/src/main/resources/assets/undergroundbiomes/textures/blocks/${block}.png`
        })
        .then((base) => base.getBufferAsync(Jimp.MIME_PNG))
        .then((base) => {
            console.log(`Done processing ${block}.png`);
            cache[block] = base;
        });
}

function getOverlay() {
    return Jimp.read('./ore_contrast1.png');
}

const cache = {};

function buildCache() {
    return new Promise((resolve) => {
        Promise.all(_
            .chain(worldgen.stoneClasses)
            .flatMap((types) => types)
            .flatMap((type) => [type, type + '_gravel', type + '_sand'])
            .map((type) => {
                return getBase(type);
            })
            .value()
        ).then(() => resolve());
    });
}

/**
 * Generates and outputs a PNG texture file for the ore
 * @param {string} baseBlock The base block, e.g. 'andesite', 'andesite_gravel'
 * @param {string} oreColor The hex color to tint the overlay
 * @param {string} name The name to use as the output filename
 */
function genOreTexture(baseBlock, oreColor, name) {
    return getOverlay()
        .then((overlay) => overlay.getBufferAsync(Jimp.MIME_PNG))
        .then((overlay) => sharp(overlay)
            .tint(oreColor)
            .toBuffer()
        )
    .then((overlay) => {
        return sharp(Buffer.from(cache[baseBlock]))
            .composite([ { input: overlay }])
            .toFile(`textures/${name}.png`);
    });
}

module.exports = {
    buildCache: buildCache,
    genOreTexture: genOreTexture
}