#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Item;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;

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

var plateHardCarbon = VanillaFactory.createItem("plate_hard_carbon");
plateHardCarbon.register();

var plateExtremeAlloy = VanillaFactory.createItem("plate_extreme_alloy");
plateExtremeAlloy.register();

var plateThermoAlloy = VanillaFactory.createItem("plate_thermo_alloy");
plateThermoAlloy.register();

var plateCurvedHardCarbon = VanillaFactory.createItem("plate_curved_hard_carbon");
plateCurvedHardCarbon.register();

var plateCurvedThermoAlloy = VanillaFactory.createItem("plate_curved_thermo_alloy");
plateCurvedThermoAlloy.register();

var rodToughAlloy = VanillaFactory.createItem("rod_tough_alloy");
rodToughAlloy.register();

var wireMagnesiumDiboride = VanillaFactory.createItem("wire_magnesium_diboride");
wireMagnesiumDiboride.register();

var motorULV = VanillaFactory.createItem("motor_ulv");
motorULV.register();

var moltenThaumium = VanillaFactory.createFluid("fluid_thaumium", Color.fromHex("7C6AC4"));
moltenThaumium.stillLocation = "base:fluids/molten";
moltenThaumium.flowingLocation = "base:fluids/molten_flowing";
moltenThaumium.material = <blockmaterial:lava>;
moltenThaumium.luminosity = 14;
moltenThaumium.density = 500;
moltenThaumium.viscosity = 500;
moltenThaumium.register();
