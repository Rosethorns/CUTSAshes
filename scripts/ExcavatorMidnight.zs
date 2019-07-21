import crafttweaker.oredict.IOreDictEntry;


// Ore dicts
oreDict.oreDuskAspectedStone.add(<contenttweaker:dusk_aspected_nightstone>);
oreDict.oreEarthAspectedStone.add(<contenttweaker:earth_aspected_nightstone>);
oreDict.oreFlameAspectedStone.add(<contenttweaker:flame_aspected_nightstone>);
oreDict.oreLightAspectedStone.add(<contenttweaker:light_aspected_nightstone>);
oreDict.oreWaterAspectedStone.add(<contenttweaker:water_aspected_nightstone>);
oreDict.oreWindAspectedStone.add(<contenttweaker:wind_aspected_nightstone>);
oreDict.oreGtExcavatorAmberMidnight.addAll(<ore:oreAmber>);


// Filler ore dicts
oreDict.oreGtExcavatorFillermidnight0.add(<midnight:nightstone>);
oreDict.oreGtExcavatorFillermidnight1.add(<midnight:trenchstone>);
oreDict.oreGtExcavatorFillermidnight2.add(<midnight:deceitful_mud>);


// Dig that hole
mods.immersiveengineering.Excavator.addMineral("Amber", 15, 0.005, ["oreGtExcavatorAmberMidnight", "oreGtExcavatorFillermidnight0", "oreGtExcavatorFillermidnight1", "oreGtExcavatorFillermidnight2"], [0.4,0.36,0.18,0.06], [-23]);
mods.immersiveengineering.Excavator.addMineral("Light Aspected Nightstone", 25, 0.005, ["oreLightAspectedStone", "oreGtExcavatorFillermidnight0", "oreGtExcavatorFillermidnight1", "oreGtExcavatorFillermidnight2"], [0.6,0.24,0.12,0.04], [-23]);
mods.immersiveengineering.Excavator.addMineral("Dusk Aspected Nightstone", 25, 0.005, ["oreDuskAspectedStone", "oreGtExcavatorFillermidnight0", "oreGtExcavatorFillermidnight1", "oreGtExcavatorFillermidnight2"], [0.6,0.24,0.12,0.04], [-23]);
mods.immersiveengineering.Excavator.addMineral("Flame Aspected Nightstone", 25, 0.005, ["oreFlameAspectedStone", "oreGtExcavatorFillermidnight0", "oreGtExcavatorFillermidnight1", "oreGtExcavatorFillermidnight2"], [0.6,0.24,0.12,0.04], [-23]);
mods.immersiveengineering.Excavator.addMineral("Water Aspected Nightstone", 25, 0.005, ["oreWaterAspectedStone", "oreGtExcavatorFillermidnight0", "oreGtExcavatorFillermidnight1", "oreGtExcavatorFillermidnight2"], [0.6,0.24,0.12,0.04], [-23]);
mods.immersiveengineering.Excavator.addMineral("Wind Aspected Nightstone", 25, 0.005, ["oreWindAspectedStone", "oreGtExcavatorFillermidnight0", "oreGtExcavatorFillermidnight1", "oreGtExcavatorFillermidnight2"], [0.6,0.24,0.12,0.04], [-23]);
mods.immersiveengineering.Excavator.addMineral("Earth Aspected Nightstone", 25, 0.005, ["oreEarthAspectedStone", "oreGtExcavatorFillermidnight0", "oreGtExcavatorFillermidnight1", "oreGtExcavatorFillermidnight2"], [0.6,0.24,0.12,0.04], [-23]);