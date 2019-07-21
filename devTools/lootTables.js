const _ = require('lodash');
const fs = require('fs').promises;

const util = require('./util');

const blockers = {
    'Just Enough Forestry': (mod, table, pool) => mod !== 'forestry' && pool.startsWith('forestry'),
    'Greg go away': (mod, table, pool, entry) => entry.entryName.startsWith('#gregtech'),
    'Cheaty ingots': (mod, table, pool, entry) => 
        entry.name && (
            entry.name !== 'minecraft:iron_ingot' && entry.name !== 'minecraft:gold_ingot'
        ) && (
            entry.name.includes('ingot') || entry.entryName.includes('ingot')
        ),
    'Cheaty Metals': (mod, table, pool, entry) => entry.entryName.includes('steel') || entry.entryName.includes('aluminium')
};

function cleanupLootTable(path, file) {
    if (_.trim(file) == '') return;

    const table = JSON.parse(file);
    const parts = path.replace('../dumps/loot_tables/','').split('/');
    const mod = parts.splice(0, 1)[0];
    const tableName = _.join(parts, '/').replace('.json','');

    // Skip scrap entries
    if (mod === 'scrap') return;

    return _.flatMap(table.pools, (pool) => {
        return _.map(pool.entries, (entry, idx) => {
            const blockedBy = _.findKey(blockers, (b) => {
                try {
                    return b(mod, tableName, pool.name, entry)
                } catch(err) {
                    console.warn(`Unable to parse ${mod}:${tableName}:${pool.name}#${idx}`, err);
                    return false;
                }
            });

            if (!blockedBy) return;

            // console.debug(`Removing ${mod}:${tableName}:${pool.name}#${idx}`);
            return {
                'table': `${mod}:${tableName}`,
                'pool': pool.name,
                'entry': entry.entryName,
                'reason': blockedBy
            };
        })
    })
}

function iterateTables(path) {
    path = path && path + '/' || '../dumps/loot_tables/';
    return util
        .getFilesIn(path)
        .then((contents) => Promise.all(
            contents.map((f) => fs
                .lstat(path + f)
                .then((stat) => ({
                    'path': path+ f,
                    'isDirectory': stat.isDirectory()
                }))
            )
        ))
        .then((stats) => Promise.all(
            stats.map((f) => {
                if (f.isDirectory) return iterateTables(f.path);
                if (!f.path.endsWith('.json')) return;

                return fs
                    .readFile(f.path)
                    .then((content) => {
                        try {
                            return cleanupLootTable(f.path, content);
                        } catch(err) {
                            console.warn(`Unable to parse ${f.path}:`, err);
                        }
                    });
            })
        ));
}

function cleanupLootTables() {
    return iterateTables()
        .then((output) => {
            return _
                .chain(output)
                .flattenDeep()
                .filter((o) => o)
                .sortBy((o) => o.table + ":" + o.pool)
                .value();
        })
        .then((ret) => {
            return fs.writeFile('../scripts/LootTableTweaking.zs', _.flattenDeep([
                '// This script generated by a tool',
                'import loottweaker.vanilla.loot.LootTables;',
                'import loottweaker.vanilla.loot.LootTable;',
                'import loottweaker.vanilla.loot.LootPool;',
                '',
                _
                    .chain(ret)
                    .groupBy('table')
                    .map((r, table) => {
                        const tableName = _.camelCase(table);
                        let pidx = 1;
                        return [
                            '/*',
                            ` * ${_.startCase(table)}`,
                            '*/',
                            `var ${tableName} = LootTables.getTable("${table}");`,
                            '',
                            _
                                .chain(r)
                                .groupBy('pool')
                                .map((p, pool) => {
                                    const poolName = `${tableName}${pidx++}`;
                                    return [
                                        `var ${poolName} = ${tableName}.getPool("${pool}");`,
                                        _
                                            .chain(p)
                                            .sortBy('reason')
                                            .map((e) => _.padEnd(`${poolName}.removeEntry("${e.entry}");`, 150) + `// ${e.reason}`)
                                            .value(),
                                        ''
                                    ]
                                })
                                .value()
                        ]
                    })
                    .value()
            ]).join('\n'));
        });
}

module.exports = {
    cleanupLootTables: cleanupLootTables
}