import crafttweaker.item.IItemStack;
import mods.chisel.Carving;

function addVariations(items as IItemStack[], category as string) {
    for item in items {
        Carving.addVariation(category, item);
    }
}

// Marble
var ubMarble = <undergroundbiomes:metamorphic_stone:2>;
addVariations([
    ubMarble,
    <gregtech:mineral:0>,
    <gregtech:mineral:12>,
    <gregtech:mineral:1>,
    <gregtech:mineral:5>,
    <gregtech:mineral:9>,
    <gregtech:mineral:13>,
    <undergroundbiomes:metamorphic_brick:2>
] as IItemStack[], "marble");


<ore:stoneMarble>.add(ubMarble);
<ore:blockMarble>.add(ubMarble);

recipes.replaceAllOccurences(<chisel:marble2:7>, <ore:stoneMarble>, <*>);
recipes.replaceAllOccurences(<astralsorcery:blockmarble>, <ore:stoneMarble>, <*>);



// Limestone
var ubLimestone = <undergroundbiomes:sedimentary_stone:0>;
addVariations([
    ubLimestone
] as IItemStack[], "limestone");

<ore:stoneLimestone>.add(ubLimestone);
recipes.replaceAllOccurences(<chisel:limestone2:7>, <ore:stoneLimestone>, <*>);



// Chalk
Carving.addGroup("chalk");

addVariations([
    <earthworks:block_chalk>,
    <undergroundbiomes:sedimentary_stone:1>
] as IItemStack[], "chalk");



// Black Granite
Carving.addGroup("blackGranite");

addVariations([
    <gregtech:granite:0>,
    <gregtech:granite:12>,
    <gregtech:granite:2>,
    <gregtech:granite:6>,
    <gregtech:granite:10>,
    <gregtech:granite:14>,
    // Skip block of black granite, as that has other uses
    <undergroundbiomes:igneous_stone:1>,
    <undergroundbiomes:igneous_brick:1>
] as IItemStack[], "blackGranite");

// Black Granite Cobble
Carving.addGroup("blackGraniteCobble");

addVariations([
    <gregtech:granite:4>,
    <gregtech:granite:8>,
    <undergroundbiomes:igneous_cobble:1>,
    <undergroundbiomes:igneous_cobble_mossy:1>
] as IItemStack[], "blackGraniteCobble");



// Red Granite
Carving.addGroup("redGranite");

addVariations([
    <gregtech:granite:1>,
    <gregtech:granite:13>,
    <gregtech:granite:3>,
    <gregtech:granite:7>,
    <gregtech:granite:11>,
    <gregtech:granite:15>,
    <undergroundbiomes:igneous_stone:0>,
    <undergroundbiomes:igneous_brick:0>
] as IItemStack[], "redGranite");



// Red Granite Cobble
Carving.addGroup("redGraniteCobble");

addVariations([
    <gregtech:granite:5>,
    <gregtech:granite:9>,
    <undergroundbiomes:igneous_cobble:0>,
    <undergroundbiomes:igneous_cobble_mossy:0>
] as IItemStack[], "redGraniteCobble");



// Basalt
addVariations([
    <gregtech:mineral:2>,
    <gregtech:mineral:14>,
    <gregtech:mineral:3>,
    <gregtech:mineral:7>,
    <gregtech:mineral:11>,
    <gregtech:mineral:15>,
    <quark:world_stone_pavement:3>,
    <undergroundbiomes:igneous_stone:5>
] as IItemStack[], "basalt");

<ore:stoneBasalt>.add(<undergroundbiomes:igneous_stone:5>);



// Basalt Cobble
Carving.addGroup("basaltCobble");
addVariations([
    <gregtech:mineral:6>,
    <gregtech:mineral:10>,
    <undergroundbiomes:igneous_cobble:5>,
    <undergroundbiomes:igneous_cobble_mossy:5>
] as IItemStack[], "basaltCobble");

<chisel:basalt2:7>.displayName = "Lava Heated Basalt";