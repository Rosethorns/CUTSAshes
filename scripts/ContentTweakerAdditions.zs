#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Item;

#Blocks

var oilyMud = VanillaFactory.createBlock("oily_mud", <blockmaterial:ground>);
oilyMud.fullBlock = true;
oilyMud.blockHardness = 0.5;
oilyMud.blockResistance = 2.5;
oilyMud.toolClass = "shovel";
oilyMud.toolLevel = 2;
oilyMud.register();

#Items

var dustNetherCertus = VanillaFactory.createItem("dust_nether_certus_mix");
dustNetherCertus.register();

var plateCertusQuartz = VanillaFactory.createItem("plate_certus_quartz");
plateCertusQuartz.register();

var plateFluix = VanillaFactory.createItem("plate_fluix");
plateFluix.register();

var plateNetherCertus = VanillaFactory.createItem("plate_nether_certus_mix");
plateNetherCertus.register();

var plateNetherQuartz = VanillaFactory.createItem("plate_nether_quartz");
plateNetherQuartz.register();

var wireQuartzFiber = VanillaFactory.createItem("wire_quartz_fiber");
wireQuartzFiber.register();

var plateToughAlloy = VanillaFactory.createItem("plate_tough_alloy");
plateToughAlloy.register();