/**
 * Script to generate recycling recipes for Gregtech machines
 * 
 * Excpects three files:
 * - recipes.txt: Generated by /ct recipes, copied from crafttweaker.log
 * - oredictionary.csv: Generated by /tellme dump-csv oredictionary-by-key
 * - items.csv: Generated by /tellme dump-csv
 * 
 * Produces:
 * - GregtechRecycling.zs - should be placed in 'scripts'
 * - scrap/*.json - should be placed in 'config/scrap/'
 * - projectTable/*.json - should be placed in 'config/projectTable/'
 */

/**
 * Config:
 */

// Any mods whose recipes should be added to the project table
const modsToTableify = ["gregtech", "gtadditions", "nuclearcraft"];
const durabilityCost = 1;

// List out any tool oredicts here; tools should never be consumed by project table
const oreTools = [
    "craftingToolAxe",
    "craftingToolBendingCylinder",
    "craftingToolBendingCylinderSmall",
    "craftingToolBlade",
    "craftingToolBranchCutter",
    "craftingToolCrowbar",
    "craftingToolFile",
    "craftingToolHardHammer",
    "craftingToolHoe",
    "craftingToolJackHammer",
    "craftingToolKnife",
    "craftingToolMagnifyingGlass",
    "craftingToolMiningDrill",
    "craftingToolMortar",
    "craftingToolPickaxe",
    "craftingToolPlunger",
    "craftingToolSaw",
    "craftingToolScoop",
    "craftingToolScrewdriver",
    "craftingToolShovel",
    "craftingToolSoftHammer",
    "craftingToolWireCutter",
    "craftingToolWrench",
    "toolBakeware",
    "toolCrowbar",
    "toolCuttingboard",
    "toolJuicer",
    "toolMixingbowl",
    "toolMortarandpestle",
    "toolPot",
    "toolSaucepan",
    "toolSkillet",
    "toolSpikeMaul"
];

/**
 * Script variables
 */

// Imports
const csv = require('csv-parser');
const readline = require('readline');
const fs = require('fs');
const _ = require('lodash');
const crypto = require('crypto');

// Recipe parsing
const lineRegex = /recipes.add(Shaped|Shapeless)\("(.+)", <([a-zA-Z:_0-9]+)>(?:\.withTag\(([A-Za-z:0-9*_{}, ."]+)\))?(?:[ *]+)?([0-9]+)?, \[(.*)/mi
const ingredGroupRegex = /,(?=[ \]\[]+<)/;
const ingredRegex = /<([A-Za-z:0-9*_]+)>(?:\.withTag\(([A-Za-z:0-9*_{}, ."]+)\))?([ *]+)?([0-9]+)?/i;
const itemRegex = /([A-Za-z_0-9]+):([A-Za-z_0-9]+):?([0-9]*)/i;

// Oredict parsing
const oreItemsRegex = /[A-Za-z:0-9*_]+@[0-9]+/gmi;
const oreItemRegex = /([A-Za-z0-9_]+):([A-Za-z0-9_]+)@([0-9]+)/i;

// Data storage
let results = [];
const oredicts = {};
const items = {};

// File header:
let zenscript = 
`// This code generated by a tool. And is also the output of a script.
import crafttweaker.item.IItemStack;

mods.jei.JEI.addItem(<scrap:scrap>);
mods.jei.JEI.addDescription(<scrap:scrap>, "May contain some recoverable parts from a machine.");

// Recipes:
`;

/**
 * Handles producing the recycling loot tables and scrap bags
 * @param {*} res The input recipe array
 */
function extractGregtechRecycling(res) {
    res = _.chain(res)
        .filter((r) => r.output.startsWith("gregtech:machine"))
        .uniqBy('output')
        .value();

    // Deal with the loot tables:
    res.forEach((r) => {
        if (!items[r.output]) return;

        const table = {
            "pools": _
                .chain(r.ingredients)
                .map((i) => {
                    if (i.or) return; // This is like a bad oredict

                    let data = i.id.match(itemRegex);
                    // Translate oredicts
                    if (data[1] === 'ore') {
                        let dict = oredicts[data[2]];
                        if (!dict)
                            return;
                        if (_.size(dict) !== 1
                            && !data[2].startsWith("ingot")
                            && !data[2].startsWith("plate")) {
                            return; // You don't get returns on oredicts larger than 1
                        }
                        const oreItem = _.first(dict);
                        if (!oreItem)
                            return;
                        data = [, oreItem.mod, oreItem.id, oreItem.meta];
                    }
                    // Populate the item
                    const item = {
                        "type": "item",
                        "name": `${data[1]}:${data[2]}`,
                        "weight": 1
                    };
                    // Set metadata
                    if (data[3]) {
                        let meta = parseInt(data[3]);
                        if (!_.isFinite(meta) || meta == 32767)
                            return; // No way of handling a wildcard meta
                        item.functions = [{ "function": "set_data", "data": parseInt(data[3]) }];
                    }
                    return {
                        "rolls": { "min": 1, "max": i.qty },
                        "entries": [item],
                        "conditions": [
                            { "condition": "random_chance", "chance": 0.8 }
                        ]
                    };
                })
                .filter((i) => i)
                .value()
        };
        // If we produced an empty table:
        if (table.pools.length <= 0)
            return;

        // Produce the scrap portions:
        r.displayName = items[r.output] || 'Random parts';
        fs.writeFileSync(`../config/scrap/${r.tablename}.json`, JSON.stringify(table, null, 2));
    });
    zenscript += `val tablenames = ["${_.map(res, (r) => r.tablename).join('", "')}"] as string[];\n` +
        `val names = ["${_.map(res, (r) => r.displayName).join('", "')}"] as string[];\n` +
        `val items = [<${_.map(res, (r) => r.output).join('>, <')}>] as IItemStack[];\n\n` +
        `for i, item in items {\n` +
        `   recipes.addShapeless(tablenames[i] + "Recycling", \n` +
        `       <scrap:scrap>.withTag({NAME: names[i],TABLE:"scrap:"+tablenames[i],GEAR:"AB948B",PLATE:"7C7C7C",XP:"0"}), \n` +
        `       [item, <immersiveengineering:tool:0>.reuse()]);\n` +
        // Using IE hammer because CT gets along _so great_ with GTCE tools https://github.com/CraftTweaker/CraftTweaker/issues/723
        `}`;
    fs.writeFileSync('../scripts/GregtechRecycling.zs', zenscript);
}

/**
 * Parses an ingredient into parts for later processing
 * @param {*} ingredient The raw ingredient line to parse
 */
function parseIngredient(ingredient) {
    const parts = ingredient.match(ingredRegex);

    if(!parts) return null;
    const hash = crypto.createHash('md5').update(parts[0]).digest('hex');

    return {
        'hash': hash,
        'id': parts[1],
        'nbt': parts[2],
        'qty': parseInt(parts[3] || '') || 1,
        'raw': ingredient
    }
}

/**
 * Takes the ZenScript tag, and produces JSON, so
 * it can later be converted from JSON into NBT...
 * @param {*} tag The uncompressed NBT tag
 */
function zenScriptToJson(tag) {
    if (!tag) return undefined;
    tag = tag
        .replace(/ as [a-z]+(?=,|})/gi,'')
        .replace(/(?<!")([a-z._\-0-9]+)(?=:)/gi,'"$1"')

    try {
        return JSON.parse(tag);
    } catch(e) {
        console.log(`Error parsing ${tag}`,e);
        return undefined;
    }
}

/**
 * Does all the heavy lifting of file handling
 */
Promise.all([
    new Promise((resolve) => {
        readline
            .createInterface({
                input: fs.createReadStream('recipes.txt')
            })
            .on('line', (line) => {
                // Break up our recipe line into its parts
                const [, type, name, output, tag, qty, ingredients] = line.match(lineRegex) || [];
                if (!output) return;

                // console.log(`${output}: ${ingredients.match(ingredRegexp)}`);
                const ingredientList = _.chain(ingredients)
                    .trimEnd(']);')
                    .split(ingredGroupRegex)
                    .map((o) => {
                        // This whole mess deals with getting parsed out ingredients,
                        // including ingredient lists
                        o = _.trim(o, '[] ');
                        if (0 <= o.indexOf('|')) {
                            const ingredients = o.split('|').map(parseIngredient);
                            return {
                                'or': true,
                                'hash': crypto.createHash('md5').update(o).digest('hex'),
                                'ingredients': ingredients,
                                'raw': o,
                                'qty': _.maxBy(ingredients, 'qty').qty
                            }
                        }

                        return parseIngredient(o);
                    })
                    .reject((o) => !o) // only non-null ingredients
                    .groupBy('hash')
                    .mapValues((g) => {
                        // Condense down the hashes into a single item
                        const item = _.first(g);
                        item.qty = _.sumBy(g, 'qty');
                        return item;
                    })
                    .value();

                // Finally, send it off to our output
                results.push({
                    type: type,
                    name: name,
                    output: output,
                    tag: tag,
                    quantity: qty && parseInt(qty) || 1,
                    ingredients: ingredientList,
                    // Recycling loot specific:
                    tablename: output.replace(/:/g,'_')
                });
            }).on('close', () => {
                resolve();
            });
    }),
    new Promise((resolve) => {
        fs
            .createReadStream('oredictionary.csv')
            .pipe(csv())
            .on('data', (data) => {
                if (!data.ItemStacks) return;

                const matches = data.ItemStacks.match(oreItemsRegex);
                if (!matches) return;

                // Handle compiling oredicts for the recycling generator
                oredicts[data["OreDict Key"]] = _
                    .chain(matches)
                    .map((i) => {
                        const item = i.match(oreItemRegex);
                        if (!item) return null;
                        return {
                            mod: item[1],
                            id: item[2],
                            meta: item[3]
                        }
                    })
                    .filter((i) => i)
                    .value();
            })
            .on('end', () => {
                resolve();
            });
    }),
    new Promise((resolve) => {
        fs
            .createReadStream('items.csv')
            .pipe(csv())
            .on('data', (data) => {
                // Get display names for everything:
                items[`${data["Registry name"]}:${data["Meta/dmg"]}`] = data["Display name"];
            })
            .on('end', () => {
                resolve();
            });
    })
]).then(() => {
    // Get the GTCE recyclables
    extractGregtechRecycling(_.cloneDeep(results));

    results.forEach((r,i) => {
        if ((i % 250) == 0) console.log(`Outputting recipe JSON ${i}/${results.length}...`);
        
        // Ensure that the output and recipe are both from the mods we care about:
        if(!_.some(modsToTableify, (m) => r.output.startsWith(m)) ||
            !_.some(modsToTableify, (m) => r.name.startsWith(m))) return;

        // Form up the recipe JSON:
        const output = r.output.match(itemRegex);
        if(!output) return;

        let badOredict = '';
        if (_.some(r.ingredients, (i) => {
            if (i.or || !i.id.startsWith('ore')) return;
            let od = oredicts[i.id.substr(4)];
            badOredict = i.id;
            return !od || od.length <= 0;
        })) {
            console.log(`Skipping recipe ${r.name} with bad oredict ${badOredict}`);
            return;
        }

        const outputItem = `${output[1]}:${output[2]}`;
        if (_.some(oreTools, (t) => _.some(oredicts[t], (oi) => oi.mod === output[1] && oi.id === output[2]))) {
            console.log(`Skipping recipe ${r.name} with tool output: ${outputItem}`);
            return;
        }

        const project = {
            "$schema": "https://raw.githubusercontent.com/AtomicBlom/ProjectTable/cb2067db150c5a7a56b4122e671f6d3f28e3c43e/src/main/resources/projectTableRecipe.schema.json",
            "crafts": [{
                "id": outputItem,
                "Count": r.quantity,
                "Damage": output[3] && parseInt(output[3]) || undefined,
                "tag": zenScriptToJson(r.tag)
            }],
            "ingredients": _.map(r.ingredients, (item) => {
                if(item.or) {
                    // Attempt to find a matching oredict:
                    if (_.every(item.ingredients, (oi) => !oi.nbt)) {
                        let allItems = _.sortBy(item.ingredients.map((oi) => oi.id));
                        let oredict = _.findIndex(oredicts, (od) => 
                            od.length === item.ingredients.length &&
                            _.isEqual(_.sortBy(od), allItems)
                        );

                        if (oredict !== -1) {
                            console.log(`Using ${oredict} instead of ${item.raw}`);
                            item = {
                                "id": oredict,
                                "qty": item.qty,
                                "raw": item.raw
                            };
                        }
                    }

                    if (item.or) {
                        console.log(`Unable to find oredict for ${r.name}'s ${item.raw}`);
                        let qty = item.qty;
                        item = _.first(item.ingredients);
                        item.qty = qty;
                    }
                }

                const ingred = item.id.match(itemRegex);
                const isTool = _.some(oreTools, (t) => t === ingred[2]);

                // This is just an awkward mess, but gets the job done:
                return ingred[1] === 'ore' ? {
                    "oredict": ingred[2], // ids shouldn't have oredicts
                    "Count": isTool ? undefined : item.qty, // tools don't need quantity
                    "tool": isTool,
                    "durabilityCost": isTool ? durabilityCost : undefined
                } : {
                    "id": `${ingred[1]}:${ingred[2]}`, // oredicts shouldn't have ids
                    "Count": isTool ? undefined : item.qty, // tools don't need quantity
                    "Damage": ingred[3] && ingred[3] !== '' && parseInt(ingred[3]) || undefined, // damage value?
                    "tag": zenScriptToJson(item.nbt),
                    "tool": isTool,
                    "durabilityCost": isTool ? durabilityCost : undefined
                }
            })
        };

        // Write however many files...
        fs.writeFileSync(`projectTable/${r.name.replace(/[^A-Z0-9_]/gi,'_')}.json`, JSON.stringify(project, null, 2));
    });
})