import mods.gregtech.recipe.RecipeMap;
//gregtech
val assembler = mods.gregtech.recipe.RecipeMap.getByName("assembler");
val laser_engraver = mods.gregtech.recipe.RecipeMap.getByName("laser_engraver");
val autoclave = mods.gregtech.recipe.RecipeMap.getByName("autoclave");
val compressor = mods.gregtech.recipe.RecipeMap.getByName("compressor");
val mixer = mods.gregtech.recipe.RecipeMap.getByName("mixer");
val extruder = mods.gregtech.recipe.RecipeMap.getByName("extruder");
val wiremill = mods.gregtech.recipe.RecipeMap.getByName("wiremill");
val metal_bender = mods.gregtech.recipe.RecipeMap.getByName("metal_bender");
val forming_press = mods.gregtech.recipe.RecipeMap.getByName("forming_press");
val lathe = mods.gregtech.recipe.RecipeMap.getByName("lathe");
val chemical_bath = mods.gregtech.recipe.RecipeMap.getByName("chemical_bath");

//remove
recipes.remove(<nuclearcraft:solar_panel_basic>);
recipes.remove(<nuclearcraft:solar_panel_advanced>);
recipes.remove(<nuclearcraft:solar_panel_du>);
recipes.remove(<nuclearcraft:solar_panel_elite>);
recipes.remove(<nuclearcraft:turbine_rotor_blade_sic_sic_cmc>);
recipes.remove(<nuclearcraft:part:8>);
recipes.remove(<nuclearcraft:part:9>);
recipes.remove(<nuclearcraft:portable_ender_chest>);

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
mods.jei.JEI.hide(<nuclearcraft:turbine_rotor_blade_sic_sic_cmc>);
mods.jei.JEI.hide(<nuclearcraft:part:6>);
mods.jei.JEI.hide(<nuclearcraft:part:8>);
mods.jei.JEI.hide(<nuclearcraft:part:9>);
mods.jei.JEI.hide(<nuclearcraft:portable_ender_chest>);

//adjust
//Tough Alloy Plate
extruder.recipeBuilder()
	.inputs(<nuclearcraft:alloy:1> * 2)
	.notConsumable(<gregtech:meta_item_1:32350>)
	.outputs(<contenttweaker:plate_tough_alloy>)
	.duration(190)
	.EUt(256)
	.buildAndRegister();

//Hard Carbon Plate
extruder.recipeBuilder()
	.inputs(<nuclearcraft:alloy:2> * 2)
	.notConsumable(<gregtech:meta_item_1:32350>)
	.outputs(<contenttweaker:plate_hard_carbon>)
	.duration(190)
	.EUt(256)
	.buildAndRegister();

//Extreme Alloy Plate
extruder.recipeBuilder()
	.inputs(<nuclearcraft:alloy:10> * 2)
	.notConsumable(<gregtech:meta_item_1:32350>)
	.outputs(<contenttweaker:plate_extreme_alloy>)
	.duration(190)
	.EUt(256)
	.buildAndRegister();

//Thermoconducting Alloy Plate
extruder.recipeBuilder()
	.inputs(<nuclearcraft:alloy:11> * 2)
	.notConsumable(<gregtech:meta_item_1:32350>)
	.outputs(<contenttweaker:plate_thermo_alloy>)
	.duration(190)
	.EUt(256)
	.buildAndRegister();

//Curved Hard Carbon Plate
metal_bender.recipeBuilder()
	.inputs(<contenttweaker:plate_hard_carbon>)
	.notConsumable(<gregtech:meta_item_1:32766>.withTag({Configuration: 0}))
	.outputs(<contenttweaker:plate_curved_hard_carbon>)
	.duration(58)
	.EUt(24)
	.buildAndRegister();
recipes.addShaped(<contenttweaker:plate_curved_hard_carbon>,
		[[<ore:craftingToolHardHammer>.transformDamage(2)],
		[<contenttweaker:plate_hard_carbon>],
		[<ore:craftingToolBendingCylinder>.transformDamage(5)]]
	);

//Curved Thermoconducting Alloy Plate
metal_bender.recipeBuilder()
	.inputs(<contenttweaker:plate_thermo_alloy>)
	.notConsumable(<gregtech:meta_item_1:32766>.withTag({Configuration: 0}))
	.outputs(<contenttweaker:plate_curved_thermo_alloy>)
	.duration(58)
	.EUt(24)
	.buildAndRegister();
recipes.addShaped(<contenttweaker:plate_curved_thermo_alloy>,
		[[<ore:craftingToolHardHammer>.transformDamage(2)],
		[<contenttweaker:plate_thermo_alloy>],
		[<ore:craftingToolBendingCylinder>.transformDamage(5)]]
	);

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

//Molten Salt Fission Controller
recipes.remove(<nuclearcraft:salt_fission_controller>);
recipes.addShaped(<nuclearcraft:salt_fission_controller>,
		[[<nuclearcraft:part:3>,<contenttweaker:plate_extreme_alloy>,<nuclearcraft:part:3>],
		[<contenttweaker:plate_hard_carbon>,<nuclearcraft:part:12>,<contenttweaker:plate_hard_carbon>],
		[<nuclearcraft:part:3>,<contenttweaker:plate_extreme_alloy>,<nuclearcraft:part:3>]]
	);

//Molten Salt Reactor Wall
recipes.remove(<nuclearcraft:salt_fission_wall>);
recipes.addShaped(<nuclearcraft:salt_fission_wall> * 4,
		[[<ore:plateSteel>,<contenttweaker:plate_tough_alloy>,<ore:plateSteel>],
		[<contenttweaker:plate_hard_carbon>,<nuclearcraft:part:12>,<contenttweaker:plate_hard_carbon>],
		[<ore:plateSteel>,<contenttweaker:plate_tough_alloy>,<ore:plateSteel>]]
	);

//Molten Salt Reactor Frame
recipes.remove(<nuclearcraft:salt_fission_frame>);
recipes.addShaped(<nuclearcraft:salt_fission_frame> * 4,
		[[<gregtech:meta_item_1:17184>,<nuclearcraft:salt_fission_wall>,<gregtech:meta_item_1:17184>],
		[<nuclearcraft:salt_fission_wall>,null,<nuclearcraft:salt_fission_wall>],
		[<gregtech:meta_item_1:17184>,<nuclearcraft:salt_fission_wall>,<gregtech:meta_item_1:17184>]]
	);

//Molten Salt Reactor Vent
recipes.remove(<nuclearcraft:salt_fission_vent>);
recipes.addShaped(<nuclearcraft:salt_fission_vent> * 4,
		[[<ore:plateSteel>,<contenttweaker:plate_tough_alloy>,<ore:plateSteel>],
		[<nuclearcraft:part:7>,<nuclearcraft:part:12>,<nuclearcraft:part:7>],
		[<ore:plateSteel>,<contenttweaker:plate_tough_alloy>,<ore:plateSteel>]]
	);

//Molten Salt Fission Vessel
recipes.remove(<nuclearcraft:salt_fission_vessel>);
recipes.addShaped(<nuclearcraft:salt_fission_vessel>,
		[[<nuclearcraft:part:3>,<contenttweaker:plate_tough_alloy>,<nuclearcraft:part:3>],
		[<nuclearcraft:alloy:12>,<nuclearcraft:part:12>,<nuclearcraft:alloy:12>],
		[<nuclearcraft:part:3>,<nuclearcraft:part:7>,<nuclearcraft:part:3>]]
	);

//Molten Salt Coolant Heater
recipes.remove(<nuclearcraft:salt_fission_heater>);
recipes.addShaped(<nuclearcraft:salt_fission_heater>,
		[[<nuclearcraft:part:3>,<contenttweaker:plate_extreme_alloy>,<nuclearcraft:part:3>],
		[<nuclearcraft:alloy:11>,<nuclearcraft:part:12>,<nuclearcraft:alloy:11>],
		[<nuclearcraft:part:3>,<nuclearcraft:part:7>,<nuclearcraft:part:3>]]
	);

//Molten Salt Reactor Moderator Housing #1
recipes.remove(<nuclearcraft:salt_fission_moderator>);
recipes.addShaped(<nuclearcraft:salt_fission_moderator>,
		[[<nuclearcraft:part:3>,<ore:plateSteel>,<nuclearcraft:part:3>],
		[<ore:plateSteel>,<ore:blockGraphite>,<ore:plateSteel>],
		[<nuclearcraft:part:3>,<ore:plateSteel>,<nuclearcraft:part:3>]]
	);

//Molten Salt Reactor Moderator Housing #2
recipes.addShaped(<nuclearcraft:salt_fission_moderator>,
		[[<nuclearcraft:part:3>,<ore:plateSteel>,<nuclearcraft:part:3>],
		[<ore:plateSteel>,<ore:blockBeryllium>,<ore:plateSteel>],
		[<nuclearcraft:part:3>,<ore:plateSteel>,<nuclearcraft:part:3>]]
	);

//Molten Salt Fuel Distributor
recipes.remove(<nuclearcraft:salt_fission_distributor>);
recipes.addShaped(<nuclearcraft:salt_fission_distributor>,
		[[<nuclearcraft:part:3>,<contenttweaker:plate_extreme_alloy>,<nuclearcraft:part:3>],
		[<gregtech:meta_item_2:32493>,<nuclearcraft:salt_fission_vent>,<gregtech:meta_item_2:32493>],
		[<nuclearcraft:part:3>,<contenttweaker:plate_extreme_alloy>,<nuclearcraft:part:3>]]
	);

//Molten Salt Fuel Retreiver
recipes.remove(<nuclearcraft:salt_fission_retriever>);
recipes.addShaped(<nuclearcraft:salt_fission_retriever>,
		[[<nuclearcraft:part:3>,<contenttweaker:plate_tough_alloy>,<nuclearcraft:part:3>],
		[<gregtech:meta_item_2:32493>,<nuclearcraft:salt_fission_vent>,<gregtech:meta_item_2:32493>],
		[<nuclearcraft:part:3>,<contenttweaker:plate_tough_alloy>,<nuclearcraft:part:3>]]
	);

//Molten Salt Reactor Redstone Port
recipes.remove(<nuclearcraft:salt_fission_redstone_port>);
recipes.addShaped(<nuclearcraft:salt_fission_redstone_port>,
		[[<ore:plateSteel>,<minecraft:comparator>,<ore:plateSteel>],
		[<minecraft:repeater>,<nuclearcraft:part:12>,<minecraft:repeater>],
		[<ore:plateSteel>,<minecraft:comparator>,<ore:plateSteel>]]
	);

//Heat Exchanger Controller
recipes.remove(<nuclearcraft:heat_exchanger_controller>);
recipes.addShaped(<nuclearcraft:heat_exchanger_controller>,
		[[<nuclearcraft:part:1>,<nuclearcraft:alloy:11>,<nuclearcraft:part:1>],
		[<ore:plateSteel>,<nuclearcraft:part:12>,<ore:plateSteel>],
		[<nuclearcraft:part:1>,<nuclearcraft:alloy:11>,<nuclearcraft:part:1>]]
	);

//Heat Exchanger Shell
recipes.remove(<nuclearcraft:heat_exchanger_wall>);
recipes.addShaped(<nuclearcraft:heat_exchanger_wall> * 4,
		[[<ore:plateSteel>,<ore:stone>,<ore:plateSteel>],
		[<ore:stone>,<nuclearcraft:part:12>,<ore:stone>],
		[<ore:plateSteel>,<ore:stone>,<ore:plateSteel>]]
	);

//Heat Exchanger Frame
recipes.remove(<nuclearcraft:heat_exchanger_frame>);
recipes.addShaped(<nuclearcraft:heat_exchanger_frame> * 4,
		[[<gregtech:meta_item_1:17184>,<nuclearcraft:heat_exchanger_wall>,<gregtech:meta_item_1:17184>],
		[<nuclearcraft:heat_exchanger_wall>,null,<nuclearcraft:heat_exchanger_wall>],
		[<gregtech:meta_item_1:17184>,<nuclearcraft:heat_exchanger_wall>,<gregtech:meta_item_1:17184>]]
	);

//Heat Exchanger Vent
recipes.remove(<nuclearcraft:heat_exchanger_vent>);
recipes.addShaped(<nuclearcraft:heat_exchanger_vent> * 4,
		[[<ore:plateSteel>,<ore:stone>,<ore:plateSteel>],
		[<nuclearcraft:part:7>,<nuclearcraft:part:12>,<nuclearcraft:part:7>],
		[<ore:plateSteel>,<ore:stone>,<ore:plateSteel>]]
	);

//Copper Heat Exchanger Tube
recipes.remove(<nuclearcraft:heat_exchanger_tube_copper>);
recipes.addShaped(<nuclearcraft:heat_exchanger_tube_copper> * 4,
		[[<nuclearcraft:part:0>,<gtadditions:ga_meta_item:87>,<nuclearcraft:part:0>],
		[<gtadditions:ga_meta_item:87>,<nuclearcraft:part:12>,<gtadditions:ga_meta_item:87>],
		[<nuclearcraft:part:0>,<nuclearcraft:part:7>,<nuclearcraft:part:0>]]
	);

//Hard Carbon Heat Exchanger Tube
recipes.remove(<nuclearcraft:heat_exchanger_tube_hard_carbon>);
recipes.addShaped(<nuclearcraft:heat_exchanger_tube_hard_carbon> * 4,
		[[<nuclearcraft:part:1>,<contenttweaker:plate_curved_hard_carbon>,<nuclearcraft:part:1>],
		[<contenttweaker:plate_curved_hard_carbon>,<nuclearcraft:part:12>,<contenttweaker:plate_curved_hard_carbon>],
		[<nuclearcraft:part:1>,<nuclearcraft:part:7>,<nuclearcraft:part:1>]]
	);

//Thermoconducting Alloy Heat Exchanger Tube
recipes.remove(<nuclearcraft:heat_exchanger_tube_thermoconducting>);
recipes.addShaped(<nuclearcraft:heat_exchanger_tube_thermoconducting> * 4,
		[[<nuclearcraft:part:3>,<contenttweaker:plate_curved_thermo_alloy>,<nuclearcraft:part:3>],
		[<contenttweaker:plate_curved_thermo_alloy>,<nuclearcraft:part:12>,<contenttweaker:plate_curved_thermo_alloy>],
		[<nuclearcraft:part:3>,<nuclearcraft:part:7>,<nuclearcraft:part:3>]]
	);

//Turbine Controller
recipes.remove(<nuclearcraft:turbine_controller>);
recipes.addShaped(<nuclearcraft:turbine_controller>,
		[[<nuclearcraft:part:1>,<gregtech:meta_item_1:12235>,<nuclearcraft:part:1>],
		[<gregtech:meta_item_1:12235>,<nuclearcraft:part:12>,<gregtech:meta_item_1:12235>],
		[<nuclearcraft:part:1>,<gregtech:meta_item_1:12235>,<nuclearcraft:part:1>]]
	);

//Turbine Wall
recipes.remove(<nuclearcraft:turbine_wall>);
recipes.addShaped(<nuclearcraft:turbine_wall> * 4,
		[[<gregtech:meta_item_1:17235>,<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:17235>],
		[<gregtech:meta_item_1:12235>,<nuclearcraft:part:12>,<gregtech:meta_item_1:12235>],
		[<gregtech:meta_item_1:17235>,<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:17235>]]
	);

//Turbine Frame
recipes.remove(<nuclearcraft:turbine_frame>);
recipes.addShaped(<nuclearcraft:turbine_frame> * 4,
		[[<gregtech:meta_item_1:17235>,<nuclearcraft:turbine_wall>,<gregtech:meta_item_1:17235>],
		[<nuclearcraft:turbine_wall>,null,<nuclearcraft:turbine_wall>],
		[<gregtech:meta_item_1:17235>,<nuclearcraft:turbine_wall>,<gregtech:meta_item_1:17235>]]
	);

//Turbine Rotor Shaft
recipes.remove(<nuclearcraft:turbine_rotor_shaft>);
recipes.addShaped(<nuclearcraft:turbine_rotor_shaft> * 4,
		[[<gregtech:meta_item_1:12235>,<contenttweaker:plate_tough_alloy>,<gregtech:meta_item_1:12235>],
		[<gregtech:meta_item_1:12235>,<contenttweaker:plate_tough_alloy>,<gregtech:meta_item_1:12235>],
		[<gregtech:meta_item_1:12235>,<contenttweaker:plate_tough_alloy>,<gregtech:meta_item_1:12235>]]
	);

//Steel Turbine Rotor Blade
recipes.remove(<nuclearcraft:turbine_rotor_blade_steel>);
recipes.addShaped(<nuclearcraft:turbine_rotor_blade_steel> * 4,
		[[<ore:plateSteel>,<ore:plateSteel>,<ore:plateSteel>],
		[<gregtech:meta_item_1:14235>,<gregtech:meta_item_1:14235>,<gregtech:meta_item_1:14235>],
		[<ore:plateSteel>,<ore:plateSteel>,<ore:plateSteel>]]
	);

//Extreme Alloy Turbine Rotor Blade
recipes.remove(<nuclearcraft:turbine_rotor_blade_extreme>);
recipes.addShaped(<nuclearcraft:turbine_rotor_blade_extreme> * 4,
		[[<contenttweaker:plate_extreme_alloy>,<contenttweaker:plate_extreme_alloy>,<contenttweaker:plate_extreme_alloy>],
		[<gregtech:meta_item_1:14235>,<gregtech:meta_item_1:14235>,<gregtech:meta_item_1:14235>],
		[<contenttweaker:plate_extreme_alloy>,<contenttweaker:plate_extreme_alloy>,<contenttweaker:plate_extreme_alloy>]]
	);

//Turbine Rotor Stator
recipes.remove(<nuclearcraft:turbine_rotor_stator>);
recipes.addShaped(<nuclearcraft:turbine_rotor_stator> * 4,
		[[<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>],
		[<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>]]
	);

//Turbine Rotor Bearing
recipes.remove(<nuclearcraft:turbine_rotor_bearing>);
recipes.addShaped(<nuclearcraft:turbine_rotor_bearing>,
		[[<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:9235>,<gregtech:meta_item_1:12235>],
		[<gregtech:meta_item_1:9235>,<nuclearcraft:part:12>,<gregtech:meta_item_1:9235>],
		[<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:9235>,<gregtech:meta_item_1:12235>]]
	);

//Magnesium Turbine Dynamo Coil
recipes.remove(<nuclearcraft:turbine_dynamo_coil:0>);
recipes.addShaped(<nuclearcraft:turbine_dynamo_coil:0>,
		[[<ore:ingotMagnesium>,<ore:ingotMagnesium>,<ore:ingotMagnesium>],
		[<gregtech:meta_item_1:10235>,<nuclearcraft:alloy:1>,<gregtech:meta_item_1:10235>],
		[<ore:ingotMagnesium>,<ore:ingotMagnesium>,<ore:ingotMagnesium>]]
	);

//Beryllium Turbine Dynamo Coil
recipes.remove(<nuclearcraft:turbine_dynamo_coil:1>);
recipes.addShaped(<nuclearcraft:turbine_dynamo_coil:1>,
		[[<ore:ingotBeryllium>,<ore:ingotBeryllium>,<ore:ingotBeryllium>],
		[<gregtech:meta_item_1:10235>,<nuclearcraft:alloy:1>,<gregtech:meta_item_1:10235>],
		[<ore:ingotBeryllium>,<ore:ingotBeryllium>,<ore:ingotBeryllium>]]
	);

//Aluminum Turbine Dynamo Coil
recipes.remove(<nuclearcraft:turbine_dynamo_coil:2>);
recipes.addShaped(<nuclearcraft:turbine_dynamo_coil:2>,
		[[<ore:ingotAluminum>,<ore:ingotAluminum>,<ore:ingotAluminum>],
		[<gregtech:meta_item_1:10235>,<nuclearcraft:alloy:1>,<gregtech:meta_item_1:10235>],
		[<ore:ingotAluminum>,<ore:ingotAluminum>,<ore:ingotAluminum>]]
	);

//Gold Turbine Dynamo Coil
recipes.remove(<nuclearcraft:turbine_dynamo_coil:3>);
recipes.addShaped(<nuclearcraft:turbine_dynamo_coil:3>,
		[[<ore:ingotGold>,<ore:ingotGold>,<ore:ingotGold>],
		[<gregtech:meta_item_1:10235>,<nuclearcraft:alloy:1>,<gregtech:meta_item_1:10235>],
		[<ore:ingotGold>,<ore:ingotGold>,<ore:ingotGold>]]
	);

//Copper Turbine Dynamo Coil
recipes.remove(<nuclearcraft:turbine_dynamo_coil:4>);
recipes.addShaped(<nuclearcraft:turbine_dynamo_coil:4>,
		[[<gregtech:meta_item_1:10087>,<gregtech:meta_item_1:10087>,<gregtech:meta_item_1:10087>],
		[<gregtech:meta_item_1:10235>,<nuclearcraft:alloy:1>,<gregtech:meta_item_1:10235>],
		[<gregtech:meta_item_1:10087>,<gregtech:meta_item_1:10087>,<gregtech:meta_item_1:10087>]]
	);

//Silver Turbine Dynamo Coil
recipes.remove(<nuclearcraft:turbine_dynamo_coil:5>);
recipes.addShaped(<nuclearcraft:turbine_dynamo_coil:5>,
		[[<ore:ingotSilver>,<ore:ingotSilver>,<ore:ingotSilver>],
		[<gregtech:meta_item_1:10235>,<nuclearcraft:alloy:1>,<gregtech:meta_item_1:10235>],
		[<ore:ingotSilver>,<ore:ingotSilver>,<ore:ingotSilver>]]
	);

//Turbine Fluid Inlet
recipes.remove(<nuclearcraft:turbine_inlet>);
recipes.addShaped(<nuclearcraft:turbine_inlet> * 4,
		[[<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>],
		[<contenttweaker:plate_tough_alloy>,<nuclearcraft:part:12>,<contenttweaker:plate_tough_alloy>],
		[<gregtech:meta_item_1:12235>,<nuclearcraft:part:7>,<gregtech:meta_item_1:12235>]]
	);

//Turbine Fluid Outlet
recipes.remove(<nuclearcraft:turbine_outlet>);
recipes.addShaped(<nuclearcraft:turbine_outlet> * 4,
		[[<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>],
		[<nuclearcraft:part:7>,<nuclearcraft:part:12>,<nuclearcraft:part:7>],
		[<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>,<gregtech:meta_item_1:12235>]]
	);

//Basic Plating
recipes.remove(<nuclearcraft:part:0>);
forming_press.recipeBuilder()
	.inputs(<ore:ingotLead> * 2, <ore:dustGraphite> * 2)
	.outputs(<nuclearcraft:part:0> * 2)
	.duration(400)
	.EUt(24)
	.buildAndRegister();

//Advanced Plating
recipes.remove(<nuclearcraft:part:1>);
forming_press.recipeBuilder()
	.inputs(<nuclearcraft:part:0>, <contenttweaker:plate_tough_alloy> * 4, <minecraft:redstone> * 4)
	.outputs(<nuclearcraft:part:1>)
	.duration(400)
	.EUt(48)
	.buildAndRegister();

//Advanced Plating
recipes.remove(<nuclearcraft:part:2>);
forming_press.recipeBuilder()
	.inputs(<nuclearcraft:part:1>, <ore:ingotUranium238> * 4, <ore:dustSulfur> * 4)
	.outputs(<nuclearcraft:part:2>)
	.duration(400)
	.EUt(96)
	.buildAndRegister();

//Elite Plating
recipes.remove(<nuclearcraft:part:3>);
forming_press.recipeBuilder()
	.inputs(<nuclearcraft:part:2>, <ore:ingotBoron> * 4, <ore:dustRhodochrosite> * 4)
	.outputs(<nuclearcraft:part:3>)
	.duration(400)
	.EUt(192)
	.buildAndRegister();

//Copper Solenoid
recipes.remove(<nuclearcraft:part:4>);
recipes.addShaped(<nuclearcraft:part:4> * 2,
		[[<gregtech:meta_item_2:16087>,<gregtech:meta_item_2:16087>],
		[<gregtech:meta_item_1:14033>,<gregtech:meta_item_1:14033>],
		[<gregtech:meta_item_2:16087>,<gregtech:meta_item_2:16087>]]
	);
assembler.recipeBuilder()
	.inputs(<gregtech:meta_item_1:14033> * 2, <gregtech:meta_item_2:16087> * 4)
	.outputs(<nuclearcraft:part:4> * 2)
	.duration(160)
	.EUt(6)
	.buildAndRegister();

//Magnesium Diboride Wire
wiremill.recipeBuilder()
	.inputs(<nuclearcraft:alloy:3>)
	.outputs(<contenttweaker:wire_magnesium_diboride> * 8)
	.duration(400)
	.EUt(8)
	.buildAndRegister();

//Tough Alloy Rod
lathe.recipeBuilder()
	.inputs(<nuclearcraft:alloy:1>)
	.outputs(<contenttweaker:rod_tough_alloy> * 2)
	.duration(238)
	.EUt(16)
	.buildAndRegister();

//Magnesium Diboride Solenoid
recipes.remove(<nuclearcraft:part:5>);
recipes.addShaped(<nuclearcraft:part:5> * 2,
		[[<contenttweaker:wire_magnesium_diboride>,<contenttweaker:wire_magnesium_diboride>],
		[<contenttweaker:rod_tough_alloy>,<contenttweaker:rod_tough_alloy>],
		[<contenttweaker:wire_magnesium_diboride>,<contenttweaker:wire_magnesium_diboride>]]
	);
assembler.recipeBuilder()
	.inputs(<contenttweaker:rod_tough_alloy> * 2, <contenttweaker:wire_magnesium_diboride> * 4)
	.outputs(<nuclearcraft:part:5> * 2)
	.duration(160)
	.EUt(6)
	.buildAndRegister();

//Electric Motor (ULV)
recipes.addShaped(<contenttweaker:motor_ulv>,
		[[<gregtech:cable:5237>,<gregtech:cable:35>,<gregtech:meta_item_1:14071>],
		[<gregtech:cable:35>,<gregtech:meta_item_1:14297>,<gregtech:cable:35>],
		[<gregtech:meta_item_1:14071>,<gregtech:cable:35>,<gregtech:cable:5237>]]
	);
assembler.recipeBuilder()
	.inputs(<gregtech:cable:5237> * 2, <gregtech:meta_item_1:14071> * 2, <gregtech:meta_item_1:14297>)
	.fluidInputs([<liquid:lead> * 288])
	.outputs(<contenttweaker:motor_ulv>)
	.duration(600)
	.EUt(10)
	.buildAndRegister();

//Servomechanism
recipes.remove(<nuclearcraft:part:7>);
recipes.addShaped(<nuclearcraft:part:7>,
		[[null,<gregtech:meta_item_1:14071>,null],
		[<ore:plateTin>,<contenttweaker:motor_ulv>,<ore:plateTin>]]
	);
assembler.recipeBuilder()
	.inputs(<contenttweaker:motor_ulv>, <ore:plateTin> * 2, <gregtech:meta_item_1:14071>)
	.outputs(<nuclearcraft:part:7>)
	.duration(200)
	.EUt(40)
	.buildAndRegister();

//Machine Chassis
recipes.remove(<nuclearcraft:part:10>);
recipes.addShaped(<nuclearcraft:part:10>,
		[[<gregtech:meta_item_1:17235>,<ore:plateSteel>,<gregtech:meta_item_1:17235>],
		[<ore:plateSteel>,<contenttweaker:rod_tough_alloy>,<ore:plateSteel>],
		[<gregtech:meta_item_1:17235>,<ore:plateSteel>,<gregtech:meta_item_1:17235>]]
	);
assembler.recipeBuilder()
	.inputs(<gregtech:meta_item_1:17235> * 4, <ore:plateSteel> * 4, <contenttweaker:rod_tough_alloy>)
	.outputs(<nuclearcraft:part:10>)
	.duration(400)
	.EUt(40)
	.buildAndRegister();

//Empty Frame
recipes.remove(<nuclearcraft:part:11>);
recipes.addShaped(<nuclearcraft:part:11>,
		[[<nuclearcraft:part:0>,<ore:plateTin>,<nuclearcraft:part:0>],
		[<gregtech:meta_item_1:17033>,<ore:craftingToolScrewdriver>.transformDamage(2),<gregtech:meta_item_1:17033>],
		[<nuclearcraft:part:0>,<ore:plateTin>,<nuclearcraft:part:0>]]
	);
assembler.recipeBuilder()
	.inputs(<nuclearcraft:part:0> * 4, <ore:plateTin> * 2, <gregtech:meta_item_1:17033> * 2)
	.outputs(<nuclearcraft:part:11>)
	.duration(400)
	.EUt(40)
	.buildAndRegister();

//Steel Frame
recipes.remove(<nuclearcraft:part:12>);
recipes.addShaped(<nuclearcraft:part:12>,
		[[<ore:plateSteel>,<gregtech:meta_item_1:17235>,<ore:plateSteel>],
		[<gregtech:meta_item_1:17235>,<gregtech:meta_item_1:14095>,<gregtech:meta_item_1:17235>],
		[<ore:plateSteel>,<gregtech:meta_item_1:17235>,<ore:plateSteel>]]
	);
assembler.recipeBuilder()
	.inputs(<ore:plateSteel> * 4, <gregtech:meta_item_1:17235> * 4, <gregtech:meta_item_1:14095>)
	.outputs(<nuclearcraft:part:12>)
	.duration(400)
	.EUt(40)
	.buildAndRegister();

//Geiger Counter
recipes.remove(<nuclearcraft:geiger_counter>);
recipes.addShaped(<nuclearcraft:geiger_counter>,
		[[<ore:plateSteel>,<nuclearcraft:alloy:6>,<nuclearcraft:alloy:6>],
		[<ore:plateCopper>,<minecraft:redstone>,<minecraft:redstone>],
		[<ore:platePlastic>,<nuclearcraft:alloy:6>,<nuclearcraft:alloy:6>]]
	);

//Medium Radiation Shielding
recipes.remove(<nuclearcraft:rad_shielding:1>);
recipes.addShaped(<nuclearcraft:rad_shielding:1>,
		[[<ore:platePlastic>,<ore:platePlastic>,<ore:platePlastic>],
		[<nuclearcraft:rad_shielding:0>,<nuclearcraft:alloy:6>,<nuclearcraft:rad_shielding:0>],
		[<nuclearcraft:part:0>,<nuclearcraft:part:0>,<nuclearcraft:part:0>]]
	);

//RadAway
chemical_bath.recipeBuilder()
	.fluidInputs([<liquid:radaway> * 250])
	.inputs(<ore:platePlastic> * 2)
	.outputs(<nuclearcraft:radaway>)
	.duration(200)
	.EUt(15)
	.buildAndRegister();

//Slow-Acting RadAway
chemical_bath.recipeBuilder()
	.fluidInputs([<liquid:radaway_slow> * 250])
	.inputs(<ore:platePlastic> * 2)
	.outputs(<nuclearcraft:radaway_slow>)
	.duration(200)
	.EUt(15)
	.buildAndRegister();

//Rad-X
recipes.remove(<nuclearcraft:rad_x>);
recipes.addShaped(<nuclearcraft:rad_x>,
		[[<nuclearcraft:compound:2>,<ore:platePlastic>,<nuclearcraft:compound:2>],
		[<ore:platePlastic>,<nuclearcraft:radaway>,<ore:platePlastic>],
		[<ore:platePlastic>,<minecraft:blaze_powder>,<ore:platePlastic>]]
	);

//Hazmat Suit Headwear
recipes.remove(<nuclearcraft:helm_hazmat>);
recipes.addShaped(<nuclearcraft:helm_hazmat>,
		[[<ore:dyeYellow>,<ore:wool>,<ore:dyeYellow>],
		[<nuclearcraft:rad_shielding:2>,<minecraft:leather_helmet>,<nuclearcraft:rad_shielding:2>],
		[<ore:platePlastic>,<ore:plateSteel>,<ore:platePlastic>]]
	);

//Hazmat Suit Leggings
recipes.remove(<nuclearcraft:legs_hazmat>);
recipes.addShaped(<nuclearcraft:legs_hazmat>,
		[[<ore:dyeYellow>,<ore:platePlastic>,<ore:dyeYellow>],
		[<nuclearcraft:rad_shielding:2>,<minecraft:leather_leggings>,<nuclearcraft:rad_shielding:2>],
		[<ore:wool>,null,<ore:wool>]]
	);

//Hazmat Suit Boots
recipes.remove(<nuclearcraft:boots_hazmat>);
recipes.addShaped(<nuclearcraft:boots_hazmat>,
		[[<nuclearcraft:rad_shielding:2>,<ore:dyeBlack>,<nuclearcraft:rad_shielding:2>],
		[<ore:platePlastic>,<minecraft:leather_boots>,<ore:platePlastic>]]
	);

//Rock Crusher
recipes.remove(<nuclearcraft:rock_crusher_idle>);
recipes.addShaped(<nuclearcraft:rock_crusher_idle>,
		[[<nuclearcraft:part:1>,<gregtech:meta_item_1:32603>,<nuclearcraft:part:1>],
		[<gregtech:meta_item_1:32643>,<nuclearcraft:part:10>,<gregtech:meta_item_1:32643>],
		[<nuclearcraft:part:1>,<contenttweaker:plate_tough_alloy>,<nuclearcraft:part:1>]]
	);

//Machine Interface
recipes.remove(<nuclearcraft:machine_interface>);
recipes.addShaped(<nuclearcraft:machine_interface>,
		[[null,<gregtech:meta_item_1:32643>,null],
		[<gregtech:meta_item_1:32603>,<nuclearcraft:part:10>,<gregtech:meta_item_1:32603>],
		[null,<nuclearcraft:part:7>,null]]
	);