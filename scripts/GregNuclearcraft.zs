import mods.gregtech.recipe.RecipeMap;
//gregtech
val assembler = mods.gregtech.recipe.RecipeMap.getByName("assembler");
val laser_engraver = mods.gregtech.recipe.RecipeMap.getByName("laser_engraver");
val autoclave = mods.gregtech.recipe.RecipeMap.getByName("autoclave");
val compressor = mods.gregtech.recipe.RecipeMap.getByName("compressor");
val mixer = mods.gregtech.recipe.RecipeMap.getByName("mixer");
val extruder = mods.gregtech.recipe.RecipeMap.getByName("extruder");
val wiremill = mods.gregtech.recipe.RecipeMap.getByName("wiremill");

//remove
recipes.remove(<nuclearcraft:solar_panel_basic>);
recipes.remove(<nuclearcraft:solar_panel_advanced>);
recipes.remove(<nuclearcraft:solar_panel_du>);
recipes.remove(<nuclearcraft:solar_panel_elite>);

//Hide from JEI
mods.jei.JEI.hide(<nuclearcraft:cooler:9>);
mods.jei.JEI.hide(<nuclearcraft:cooler:10>);
mods.jei.JEI.hide(<fluid:cryotheum>);
mods.jei.JEI.hide(<fluid:cryotheum_nak>);
mods.jei.JEI.hide(<fluid:cryotheum_nak_hot>);
mods.jei.JEI.hide(<nuclearcraft:solar_panel_basic>);
mods.jei.JEI.hide(<nuclearcraft:solar_panel_advanced>);
mods.jei.JEI.hide(<nuclearcraft:solar_panel_du>);
mods.jei.JEI.hide(<nuclearcraft:solar_panel_elite>);

//adjust
//Quartz Fiber Wire
extruder.recipeBuilder()
	.inputs(<nuclearcraft:alloy:1>)
	.notConsumable(<gregtech:meta_item_1:32350>)
	.outputs(<contenttweaker:plate_tough_alloy>)
	.duration(190)
	.EUt(256)
	.buildAndRegister();

//Empty Cooler
recipes.remove(<nuclearcraft:cooler:0>);
recipes.addShaped(<nuclearcraft:cooler:0>,
		[[<contenttweaker:plate_tough_alloy>,<gregtech:meta_item_1:12184>,<contenttweaker:plate_tough_alloy>],
		[<gregtech:meta_item_1:12184>,null,<gregtech:meta_item_1:12184>],
		[<contenttweaker:plate_tough_alloy>,<gregtech:meta_item_1:12184>,<contenttweaker:plate_tough_alloy>]]
	);

//Fission Controller
recipes.remove(<nuclearcraft:fission_controller_new_fixed>);
recipes.addShaped(<nuclearcraft:fission_controller_new_fixed>,
		[[<nuclearcraft:part:3>,<nuclearcraft:part:5>,<nuclearcraft:part:3>],
		[<nuclearcraft:part:5>,<gregtech:meta_item_2:32493>,<nuclearcraft:part:5>],
		[<nuclearcraft:part:3>,<nuclearcraft:part:5>,<nuclearcraft:part:3>]]
	);

//Fission Reactor Port
recipes.remove(<nuclearcraft:fission_port>);
recipes.addShaped(<nuclearcraft:fission_port>,
		[[<nuclearcraft:fission_block:0>,<gregtech:meta_item_1:32603>],
		[null,<gregtech:cable:9001>]]
	);

//Fusion Core
assembler.recipeBuilder()
	.inputs([<gregtech:meta_item_1:32673>,<gregtech:machine:193>,<nuclearcraft:part:10>])
	.fluidInputs([<liquid:boron10> * 1000])
	.notConsumable(<gregtech:meta_item_1:32766>.withTag({Configuration: 30}))
	.outputs(<nuclearcraft:fusion_core>)
	.duration(600)
	.EUt(1920)
	.buildAndRegister();

//Fusion Connector
recipes.remove(<nuclearcraft:fusion_connector>);
recipes.addShaped(<nuclearcraft:fusion_connector>,
		[[<contenttweaker:plate_tough_alloy>,<nuclearcraft:part:0>,<contenttweaker:plate_tough_alloy>],
		[<nuclearcraft:part:0>,<gregtech:meta_item_2:19087>,<nuclearcraft:part:0>],
		[<contenttweaker:plate_tough_alloy>,<nuclearcraft:part:0>,<contenttweaker:plate_tough_alloy>]]
	);

//Uranium RTG
recipes.remove(<nuclearcraft:rtg_uranium>);
recipes.addShaped(<nuclearcraft:rtg_uranium>,
		[[<nuclearcraft:part:3>,<ore:ingotGraphite>,<nuclearcraft:part:3>],
		[<ore:ingotGraphite>,<ore:blockUranium238>,<ore:ingotGraphite>],
		[<nuclearcraft:part:3>,<ore:ingotGraphite>,<nuclearcraft:part:3>]]
	);

//Plutonium RTG
recipes.remove(<nuclearcraft:rtg_plutonium>);
recipes.addShaped(<nuclearcraft:rtg_plutonium>,
		[[<nuclearcraft:part:3>,<ore:ingotGraphite>,<nuclearcraft:part:3>],
		[<ore:ingotGraphite>,<ore:ingotPlutonium238>,<ore:ingotGraphite>],
		[<nuclearcraft:part:3>,<ore:ingotGraphite>,<nuclearcraft:part:3>]]
	);

//Americium RTG
recipes.remove(<nuclearcraft:rtg_americium>);
recipes.addShaped(<nuclearcraft:rtg_americium>,
		[[<nuclearcraft:part:3>,<ore:ingotGraphite>,<nuclearcraft:part:3>],
		[<ore:ingotGraphite>,<ore:ingotAmericium241>,<ore:ingotGraphite>],
		[<nuclearcraft:part:3>,<ore:ingotGraphite>,<nuclearcraft:part:3>]]
	);

//Californium RTG
recipes.remove(<nuclearcraft:rtg_californium>);
recipes.addShaped(<nuclearcraft:rtg_californium>,
		[[<nuclearcraft:part:3>,<ore:ingotGraphite>,<nuclearcraft:part:3>],
		[<ore:ingotGraphite>,<ore:ingotCalifornium250>,<ore:ingotGraphite>],
		[<nuclearcraft:part:3>,<ore:ingotGraphite>,<nuclearcraft:part:3>]]
	);

//Buffer
recipes.remove(<nuclearcraft:buffer>);
recipes.addShaped(<nuclearcraft:buffer>,
		[[<nuclearcraft:fission_block:0>,<gregtech:meta_item_1:32613>],
		[<gregtech:meta_item_1:32633>,<gregtech:cable:8001>]]
	);

//Active Fluid Cooler
recipes.remove(<nuclearcraft:active_cooler>);
recipes.addShaped(<nuclearcraft:active_cooler>,
		[[<nuclearcraft:part:0>,<ore:plateTin>,<nuclearcraft:part:0>],
		[<ore:plateCopper>,<gregtech:meta_item_1:32613>,<ore:plateCopper>],
		[<nuclearcraft:part:0>,<ore:plateTin>,<nuclearcraft:part:0>]]
	);