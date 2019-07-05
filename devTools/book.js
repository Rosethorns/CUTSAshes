const _ = require('lodash');
const fs = require('fs');

const oreDictionary = require('./oreDictionary');

// Patchouli constants
const maxCharsPerLine = 31;
const maxLinesPerPage = 16;
const paragraphPlaceholder = 'Ᵽ';

/**
 * Splits up the description as close as possible to how
 * Patchouli will do it to fit as much per page as possible
 * @param {string} input The description to paginate
 * @param {object} entry The entry to add pages to
 */
function paginateDescription(input, entry) {
    const desc = _.chain(input
        .replace(/\[[\w ]+\]/gi, '')
        .replace('–', '-')
        .split('\n'))
        .map(_.trim)
        .filter((t) => t && 0 < t.length)
        .value()
        .join(paragraphPlaceholder) // this is used as a placeholder
        .split(/(?<=[^a-z0-9])/gi); // Split words, keeping boundary characters
    const descPages = [];
    let page = [];
    let line = '';
    let i = 0;
    _.each(desc, (word) => {
        // If we're at a new paragraph:
        if (word.startsWith(paragraphPlaceholder)) {
            if (page.length <= 0) {
                word = word.replace(paragraphPlaceholder, '');
            }
            else {
                page.push(line);
                page.push('');
                i = 0;
                line = '';
                word = word.replace(paragraphPlaceholder, '$(p)');
            }
        }
        // Add and check character count:
        i += word.length;
        if (maxCharsPerLine < i) {
            page.push(line);
            i = word.length;
            line = '';
        }
        // If we're at the end of the page:
        if (maxLinesPerPage <= page.length) {
            descPages.push(page);
            page = [];
        }
        line += word;
        //console.log(word, line, page);
    });
    page.push(line);
    descPages.push(page);

    // Add them to the entry
    _.each(descPages, (p) => entry.pages.push({
        'type': 'text',
        'text': p.join('').replace(/^\$\(p\)/,'')
    }));
}


/**
 * Generates links for each section
 * @param {string} id The current page ID
 * @param {object} data The entry data
 */
function generateCrossRefs(id, data) {
    _.each(book.crossReference, (refs, section) => {
        _.each(refs, (link, ref) => {
            // Don't cross-reference ourselves:
            if (link === id) return;

            let rep = new RegExp(`(^|[\- (])(${ref})(?=$|[^a-z0-9])`, "gi");
            _.each(data.pages, (page, idx) => {
                if (idx <= 0 || page.type !== 'text') return;
                page.text = page.text.replace(rep, (m, p1, p2, o, s) => `${p1 || ''}$(l:${section}/${link})${p2}$(/l)`);
            });
        });
    });
}


function create() {
    const entryDecorators = {
        'materials': (data, id) => {
            data.icon = data.pages[0].ingot = oreDictionary.getOredictItem('ingot', id);
            data.pages[0].gear = oreDictionary.getOredictItem('gear', id);
            data.pages[0].plate = oreDictionary.getOredictItem('plate', id);
        },
        'ores': (data, id) => {
            data.icon = data.pages[0].ore = oreDictionary.getOredictItem('ore', id);
            data.pages[0].crushed = oreDictionary.getOredictItem('crushed', id);
            data.pages[0].dust = oreDictionary.getOredictItem('dust', id);
        }
    };

    // Generate pages:
    _.each(['materials','ores'], (section) => {
        _.each(book[section], (data, id) => {
            console.log(`Generating book data for ${section}/${id}...`)

            entryDecorators[section](data, id);
            generateCrossRefs(id, data);

            fs.writeFileSync(`./patchouli/${section}/${id}.json`, JSON.stringify(data, null, 2));
        });
    });
}

const book = {
    "materials": {},
    "ores": {},
    "crossReference": {
        "materials": {},
        "ores": {}
    },
    paginateDescription: paginateDescription,
    create: create
};


module.exports = book;