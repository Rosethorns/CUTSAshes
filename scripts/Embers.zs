//adjust
recipes.remove(<embers:blend_caminite>);
recipes.addShapeless(<embers:blend_caminite>,[<minecraft:clay_ball>,<minecraft:clay_ball>,<minecraft:clay_ball>,<minecraft:clay_ball>,<midnight:dewshroom_powder>]);

//Molten Thaumium
mods.embers.Mixer.add(<liquid:fluid_thaumium>, [<liquid:miasma>, <liquid:dawnstone>]);

//Thaumium Ingot
mods.embers.Stamper.add(<thaumcraft:ingot:0>, <liquid:fluid_thaumium> * 144, <embers:stamp_bar>);

//thaumium Plate
mods.embers.Stamper.add(<thaumcraft:plate:2>, <liquid:fluid_thaumium> * 144, <embers:stamp_plate>);

//thaumium Gear
mods.embers.Stamper.add(<mystgears:gear_thaumium>, <liquid:fluid_thaumium> * 288, <embers:stamp_gear>);