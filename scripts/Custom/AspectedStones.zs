#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

#Blocks
var names = ["flame", "dusk", "light", "earth", "wind", "water"] as string[];

for name in names {
    var nightstone = VanillaFactory.createBlock(name + "_aspected_nightstone", <blockmaterial:rock>);
    nightstone.fullBlock = true;
    nightstone.blockHardness = 1.5;
    nightstone.blockResistance = 10;
    nightstone.toolClass = "pickaxe";
    nightstone.toolLevel = 0;
    nightstone.register();

    var trenchstone = VanillaFactory.createBlock(name + "_aspected_trenchstone", <blockmaterial:rock>);
    trenchstone.fullBlock = true;
    trenchstone.blockHardness = 1.5;
    trenchstone.blockResistance = 200;
    trenchstone.toolClass = "pickaxe";
    trenchstone.toolLevel = 2;
    trenchstone.register();
}