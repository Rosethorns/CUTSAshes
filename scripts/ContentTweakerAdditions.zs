#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

#Blocks

var oilyMud = VanillaFactory.createBlock("oily_mud", <blockmaterial:ground>);
oilyMud.fullBlock = true;
oilyMud.blockHardness = 0.5;
oilyMud.blockResistance = 2.5;
oilyMud.toolClass = "shovel";
oilyMud.toolLevel = 2;
oilyMud.register();

#Items