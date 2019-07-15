const fs = require('fs');
const linereader = require('line-reader');
const _ = require('lodash');

const tokens = {};

new Promise((resolve, reject) => {
    linereader.eachLine('../logs/latest.log', (line, last) => {
        line = line.replace(/\[[0-9:]+\] \[[a-z \/]+\]: (\[[a-z\.: 0-9]+\]:)?/i, '');
        //if (!parts || parts.length <= 1) return;

        // Get our words
        const words = line.split(' ');
        _.each(words, (word, idx) => {
            const phrase = _.take(words, idx + 1).join(' ');

            if(!tokens[phrase]) tokens[phrase] = 1;
            else tokens[phrase]++;
        })

        if (last) resolve();
    })
}).then(() => {
    console.log(_
        .chain(tokens)
        .toPairs()
        .sortBy((t) => t[1])
        .reverse()
        .take(100)
        .fromPairs()
        .map((v, k) => `${_.padStart(v, 7, ' ')}: ${k}`)
        .value()
    );
});
