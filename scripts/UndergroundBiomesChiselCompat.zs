import mods.chisel.Carving;

// Marble
var ubMarble = <undergroundbiomes:metamorphic_stone:2>;
Carving.addVariation("marble", ubMarble);

<ore:stoneMarble>.add(ubMarble);
<ore:blockMarble>.add(ubMarble);

recipes.replaceAllOccurences(<chisel:marble2>, <ore:stoneMarble>, <*>);
recipes.replaceAllOccurences(<astralsorcery:blockmarble>, <ore:stoneMarble>, <*>);


// Limestone
var ubLimestone = <undergroundbiomes:sedimentary_stone:0>;
Carving.addVariation("limestone", ubLimestone);

<ore:stoneLimestone>.add(ubLimestone);
recipes.replaceAllOccurences(<chisel:limestone2>, <ore:stoneLimestone>, <*>);
