#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.AxisAlignedBB;

var halfSlabBB = AxisAlignedBB.create(0, 0, 0, 1, 0.9, 1);

#Blocks

var oilyMud = VanillaFactory.createBlock("oily_mud", <blockmaterial:ground>);
oilyMud.fullBlock = true;
oilyMud.lightValue = 0.0;
oilyMud.blockHardness = 0.5;
oilyMud.blockResistance = 2.5;
oilyMud.slipperiness = 1.2;
oilyMud.toolClass = "shovel";
oilyMud.axisAlignedBB = halfSlabBB;
oilyMud.toolLevel = 2;
oilyMud.register();

#Items