import crafttweaker.oredict.IOreDictEntry;


// Ore dicts
oreDict.oreGtExcavatorBandedIronNether.add(<gregtech:ore_banded_iron_0:6>);
oreDict.oreGtExcavatorBrownLimoniteNether.add(<gregtech:ore_brown_limonite_0:6>);
oreDict.oreGtExcavatorChalcopyriteNether.add(<gregtech:ore_chalcopyrite_0:6>);
oreDict.oreGtExcavatorChromiteNether.add(<gregtech:ore_chromite_0:6>);
oreDict.oreGtExcavatorCinnabarNether.add(<gregtech:ore_cinnabar_0:6>);
oreDict.oreGtExcavatorCobaltiteNether.add(<gregtech:ore_cobaltite_0:6>);
oreDict.oreGtExcavatorCopperNether.add(<gregtech:ore_copper_0:6>);
oreDict.oreGtExcavatorGarnieriteNether.add(<gregtech:ore_garnierite_0:6>);
oreDict.oreGtExcavatorGoldNether.add(<gregtech:ore_gold_0:6>);
oreDict.oreGtExcavatorIronNether.add(<gregtech:ore_iron_0:6>);
oreDict.oreGtExcavatorMagnetiteNether.add(<gregtech:ore_magnetite_0:6>);
oreDict.oreGtExcavatorMalachiteNether.add(<gregtech:ore_malachite_0:6>);
oreDict.oreGtExcavatorNetherQuartzNether.add(<gregtech:ore_nether_quartz_0:6>);
oreDict.oreGtExcavatorNickelNether.add(<gregtech:ore_nickel_0:6>);
oreDict.oreGtExcavatorPentlanditeNether.add(<gregtech:ore_pentlandite_0:6>);
oreDict.oreGtExcavatorPyriteNether.add(<gregtech:ore_pyrite_0:6>);
oreDict.oreGtExcavatorRedstoneNether.add(<gregtech:ore_redstone_0:6>);
oreDict.oreGtExcavatorRubyNether.add(<gregtech:ore_ruby_0:6>);
oreDict.oreGtExcavatorSphaleriteNether.add(<gregtech:ore_sphalerite_0:6>);
oreDict.oreGtExcavatorStibniteNether.add(<gregtech:ore_stibnite_0:6>);
oreDict.oreGtExcavatorSulfurNether.add(<gregtech:ore_sulfur_0:6>);
oreDict.oreGtExcavatorTennantiteNether.add(<gregtech:ore_tennantite_0:6>);
oreDict.oreGtExcavatorTetrahedriteNether.add(<gregtech:ore_tetrahedrite_0:6>);
oreDict.oreGtExcavatorVanadiumMagnetiteNether.add(<gregtech:ore_vanadium_magnetite_0:6>);
oreDict.oreGtExcavatorYellowLimoniteNether.add(<gregtech:ore_yellow_limonite_0:6>);
oreDict.oreGtExcavatorCincinnasiteNether.addAll(<ore:oreCincinnasite>);


// Filler ore dicts
oreDict.oreGtExcavatorFillernether0.add(<minecraft:netherrack>);
oreDict.oreGtExcavatorFillernether1.add(<minecraft:soul_sand>);
oreDict.oreGtExcavatorFillernether2.add(<minecraft:gravel>);
oreDict.oreGtExcavatorFillernether3.add(<minecraft:glowstone>);
oreDict.oreGtExcavatorFillernether4.add(<minecraft:magma>);


// Dig that hole
mods.immersiveengineering.Excavator.addMineral("Chalcopyrite", 80, 0.005, ["oreGtExcavatorChalcopyriteNether", "oreGtExcavatorIronNether", "oreGtExcavatorPyriteNether", "oreGtExcavatorCopperNether", "oreGtExcavatorCincinnasiteNether", "oreGtExcavatorFillernether0", "oreGtExcavatorFillernether1", "oreGtExcavatorFillernether2", "oreGtExcavatorFillernether3", "oreGtExcavatorFillernether4"], [0.1143,0.1143,0.1143,0.0381,0.019,0.48,0.072,0.0336,0.0048,0.0096], [-1]);
mods.immersiveengineering.Excavator.addMineral("Brown Limonite", 100, 0.005, ["oreGtExcavatorBrownLimoniteNether", "oreGtExcavatorYellowLimoniteNether", "oreGtExcavatorBandedIronNether", "oreGtExcavatorMalachiteNether", "oreGtExcavatorFillernether0", "oreGtExcavatorFillernether1", "oreGtExcavatorFillernether2", "oreGtExcavatorFillernether3", "oreGtExcavatorFillernether4"], [0.12,0.12,0.12,0.04,0.48,0.072,0.0336,0.0048,0.0096], [-1]);
mods.immersiveengineering.Excavator.addMineral("Magnetite", 160, 0.005, ["oreGtExcavatorMagnetiteNether", "oreGtExcavatorIronNether", "oreGtExcavatorVanadiumMagnetiteNether", "oreGtExcavatorGoldNether", "oreGtExcavatorFillernether0", "oreGtExcavatorFillernether1", "oreGtExcavatorFillernether2", "oreGtExcavatorFillernether3", "oreGtExcavatorFillernether4"], [0.18,0.045,0.045,0.03,0.56,0.084,0.0392,0.0056,0.0112], [-1]);
mods.immersiveengineering.Excavator.addMineral("Nether Quartz", 170, 0.005, ["oreGtExcavatorNetherQuartzNether", "oreGtExcavatorFillernether0", "oreGtExcavatorFillernether1", "oreGtExcavatorFillernether2", "oreGtExcavatorFillernether3", "oreGtExcavatorFillernether4"], [0.2,0.64,0.096,0.0448,0.0064,0.0128], [-1]);
mods.immersiveengineering.Excavator.addMineral("Garnierite", 50, 0.005, ["oreGtExcavatorGarnieriteNether", "oreGtExcavatorNickelNether", "oreGtExcavatorCobaltiteNether", "oreGtExcavatorPentlanditeNether", "oreGtExcavatorFillernether0", "oreGtExcavatorFillernether1", "oreGtExcavatorFillernether2", "oreGtExcavatorFillernether3", "oreGtExcavatorFillernether4"], [0.12,0.12,0.12,0.04,0.48,0.072,0.0336,0.0048,0.0096], [-1]);
mods.immersiveengineering.Excavator.addMineral("Redstone", 60, 0.005, ["oreGtExcavatorRedstoneNether", "oreGtExcavatorRubyNether", "oreGtExcavatorCinnabarNether", "oreGtExcavatorChromiteNether", "oreGtExcavatorFillernether0", "oreGtExcavatorFillernether1", "oreGtExcavatorFillernether2", "oreGtExcavatorFillernether3", "oreGtExcavatorFillernether4"], [0.2286,0.0762,0.0762,0.019,0.48,0.072,0.0336,0.0048,0.0096], [-1]);
mods.immersiveengineering.Excavator.addMineral("Sulfur", 130, 0.005, ["oreGtExcavatorSulfurNether", "oreGtExcavatorPyriteNether", "oreGtExcavatorSphaleriteNether", "oreGtExcavatorTennantiteNether", "oreGtExcavatorFillernether0", "oreGtExcavatorFillernether1", "oreGtExcavatorFillernether2", "oreGtExcavatorFillernether3", "oreGtExcavatorFillernether4"], [0.1385,0.0462,0.0462,0.0692,0.56,0.084,0.0392,0.0056,0.0112], [-1]);
mods.immersiveengineering.Excavator.addMineral("Tetrahedrite", 70, 0.005, ["oreGtExcavatorTetrahedriteNether", "oreGtExcavatorCopperNether", "oreGtExcavatorStibniteNether", "oreGtExcavatorFillernether0", "oreGtExcavatorFillernether1", "oreGtExcavatorFillernether2", "oreGtExcavatorFillernether3", "oreGtExcavatorFillernether4"], [0.18,0.06,0.06,0.56,0.084,0.0392,0.0056,0.0112], [-1]);