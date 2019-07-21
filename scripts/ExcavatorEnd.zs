import crafttweaker.oredict.IOreDictEntry;


// Ore dicts
oreDict.oreGtExcavatorBentoniteEnd.add(<gregtech:ore_bentonite_0:7>);
oreDict.oreGtExcavatorBerylliumEnd.add(<gregtech:ore_beryllium_0:7>);
oreDict.oreGtExcavatorCalciteEnd.add(<gregtech:ore_calcite_0:7>);
oreDict.oreGtExcavatorChromiteEnd.add(<gregtech:ore_chromite_0:7>);
oreDict.oreGtExcavatorCobaltiteEnd.add(<gregtech:ore_cobaltite_0:7>);
oreDict.oreGtExcavatorCooperiteEnd.add(<gregtech:ore_cooperite_0:7>);
oreDict.oreGtExcavatorEmeraldEnd.add(<gregtech:ore_emerald_0:7>);
oreDict.oreGtExcavatorGarnieriteEnd.add(<gregtech:ore_garnierite_0:7>);
oreDict.oreGtExcavatorGlauconiteEnd.add(<gregtech:ore_glauconite_0:7>);
oreDict.oreGtExcavatorGrossularEnd.add(<gregtech:ore_grossular_0:7>);
oreDict.oreGtExcavatorIridiumEnd.add(<gregtech:ore_iridium_0:7>);
oreDict.oreGtExcavatorLapisEnd.add(<gregtech:ore_lapis_0:7>);
oreDict.oreGtExcavatorLazuriteEnd.add(<gregtech:ore_lazurite_0:7>);
oreDict.oreGtExcavatorLithiumEnd.add(<gregtech:ore_lithium_0:7>);
oreDict.oreGtExcavatorMagnesiteEnd.add(<gregtech:ore_magnesite_0:7>);
oreDict.oreGtExcavatorMolybdeniteEnd.add(<gregtech:ore_molybdenite_0:7>);
oreDict.oreGtExcavatorNaquadahEnd.add(<gregtech:ore_naquadah_0:7>);
oreDict.oreGtExcavatorNaquadahEnrichedEnd.add(<gregtech:ore_naquadah_enriched_0:7>);
oreDict.oreGtExcavatorNickelEnd.add(<gregtech:ore_nickel_0:7>);
oreDict.oreGtExcavatorOlivineEnd.add(<gregtech:ore_olivine_0:7>);
oreDict.oreGtExcavatorPalladiumEnd.add(<gregtech:ore_palladium_0:7>);
oreDict.oreGtExcavatorPentlanditeEnd.add(<gregtech:ore_pentlandite_0:7>);
oreDict.oreGtExcavatorPowelliteEnd.add(<gregtech:ore_powellite_0:7>);
oreDict.oreGtExcavatorPyrolusiteEnd.add(<gregtech:ore_pyrolusite_0:7>);
oreDict.oreGtExcavatorScheeliteEnd.add(<gregtech:ore_scheelite_0:7>);
oreDict.oreGtExcavatorSodaliteEnd.add(<gregtech:ore_sodalite_0:7>);
oreDict.oreGtExcavatorSpessartineEnd.add(<gregtech:ore_spessartine_0:7>);
oreDict.oreGtExcavatorTantaliteEnd.add(<gregtech:ore_tantalite_0:7>);
oreDict.oreGtExcavatorThoriumEnd.add(<gregtech:ore_thorium_0:7>);
oreDict.oreGtExcavatorTungstateEnd.add(<gregtech:ore_tungstate_0:7>);
oreDict.oreGtExcavatorWulfeniteEnd.add(<gregtech:ore_wulfenite_0:7>);


// Filler ore dicts
oreDict.oreGtExcavatorFillerend0.add(<minecraft:end_stone>);


// Dig that hole
mods.immersiveengineering.Excavator.addMineral("Beryllium", 30, 0.005, ["oreGtExcavatorBerylliumEnd", "oreGtExcavatorEmeraldEnd", "oreGtExcavatorThoriumEnd", "oreGtExcavatorFillerend0"], [0.15,0.09,0.06,0.7], [1]);
mods.immersiveengineering.Excavator.addMineral("Lapis", 50, 0.005, ["oreGtExcavatorLazuriteEnd", "oreGtExcavatorSodaliteEnd", "oreGtExcavatorLapisEnd", "oreGtExcavatorCalciteEnd", "oreGtExcavatorFillerend0"], [0.15,0.1,0.175,0.075,0.5], [1]);
mods.immersiveengineering.Excavator.addMineral("Grossular", 25, 0.005, ["oreGtExcavatorGrossularEnd", "oreGtExcavatorSpessartineEnd", "oreGtExcavatorPyrolusiteEnd", "oreGtExcavatorTantaliteEnd", "oreGtExcavatorFillerend0"], [0.09,0.09,0.09,0.03,0.7], [1]);
mods.immersiveengineering.Excavator.addMineral("Wulfenite", 15, 0.005, ["oreGtExcavatorWulfeniteEnd", "oreGtExcavatorMolybdeniteEnd", "oreGtExcavatorPowelliteEnd", "oreGtExcavatorFillerend0"], [0.2,0.2,0.1,0.5], [1]);
mods.immersiveengineering.Excavator.addMineral("Naquadah", 8, 0.005, ["oreGtExcavatorNaquadahEnd", "oreGtExcavatorNaquadahEnrichedEnd", "oreGtExcavatorFillerend0"], [0.45,0.05,0.5], [1]);
mods.immersiveengineering.Excavator.addMineral("Garnierite", 50, 0.005, ["oreGtExcavatorGarnieriteEnd", "oreGtExcavatorNickelEnd", "oreGtExcavatorCobaltiteEnd", "oreGtExcavatorPentlanditeEnd", "oreGtExcavatorFillerend0"], [0.12,0.12,0.12,0.04,0.6], [1]);
mods.immersiveengineering.Excavator.addMineral("Bentonite", 60, 0.005, ["oreGtExcavatorBentoniteEnd", "oreGtExcavatorMagnesiteEnd", "oreGtExcavatorOlivineEnd", "oreGtExcavatorGlauconiteEnd", "oreGtExcavatorChromiteEnd", "oreGtExcavatorFillerend0"], [0.0818,0.0818,0.0818,0.0273,0.0273,0.7], [1]);
mods.immersiveengineering.Excavator.addMineral("Sheldonite", 20, 0.005, ["oreGtExcavatorCooperiteEnd", "oreGtExcavatorPalladiumEnd", "oreGtExcavatorIridiumEnd", "oreGtExcavatorFillerend0"], [0.27,0.21,0.12,0.4], [1]);
mods.immersiveengineering.Excavator.addMineral("Scheelite", 10, 0.005, ["oreGtExcavatorScheeliteEnd", "oreGtExcavatorTungstateEnd", "oreGtExcavatorLithiumEnd", "oreGtExcavatorFillerend0"], [0.24,0.08,0.08,0.6], [1]);