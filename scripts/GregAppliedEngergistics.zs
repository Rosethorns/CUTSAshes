import mods.gregtech.recipe.RecipeMap;
import mods.appliedenergistics2.Inscriber;
//gregtech
val assembler = mods.gregtech.recipe.RecipeMap.getByName("assembler");
val laser_engraver = mods.gregtech.recipe.RecipeMap.getByName("laser_engraver");
val autoclave = mods.gregtech.recipe.RecipeMap.getByName("autoclave");
val compressor = mods.gregtech.recipe.RecipeMap.getByName("compressor");
val mixer = mods.gregtech.recipe.RecipeMap.getByName("mixer");
val extruder = mods.gregtech.recipe.RecipeMap.getByName("extruder");
val wiremill = mods.gregtech.recipe.RecipeMap.getByName("wiremill");

//disable
recipes.remove(<appliedenergistics2:grindstone>);
recipes.remove(<appliedenergistics2:crank>);
recipes.remove(<appliedenergistics2:vibration_chamber>);
recipes.remove(<appliedenergistics2:certus_quartz_axe>);
recipes.remove(<appliedenergistics2:certus_quartz_hoe>);
recipes.remove(<appliedenergistics2:certus_quartz_spade>);
recipes.remove(<appliedenergistics2:certus_quartz_pickaxe>);
recipes.remove(<appliedenergistics2:certus_quartz_sword>);
recipes.remove(<appliedenergistics2:nether_quartz_axe>);
recipes.remove(<appliedenergistics2:nether_quartz_hoe>);
recipes.remove(<appliedenergistics2:nether_quartz_spade>);
recipes.remove(<appliedenergistics2:nether_quartz_pickaxe>);
recipes.remove(<appliedenergistics2:nether_quartz_sword>);
recipes.remove(<appliedenergistics2:certus_quartz_cutting_knife>);
recipes.remove(<appliedenergistics2:nether_quartz_cutting_knife>);
recipes.remove(<appliedenergistics2:entropy_manipulator>);
recipes.remove(<appliedenergistics2:charged_staff>);
recipes.remove(<appliedenergistics2:material:5>);
Inscriber.removeRecipe(<appliedenergistics2:material:20>);
Inscriber.removeRecipe(<appliedenergistics2:material:19>);


mods.jei.JEI.hide(<appliedenergistics2:grindstone>);
mods.jei.JEI.hide(<appliedenergistics2:crank>);
mods.jei.JEI.hide(<appliedenergistics2:vibration_chamber>);
mods.jei.JEI.hide(<appliedenergistics2:certus_quartz_axe>);
mods.jei.JEI.hide(<appliedenergistics2:certus_quartz_hoe>);
mods.jei.JEI.hide(<appliedenergistics2:certus_quartz_spade>);
mods.jei.JEI.hide(<appliedenergistics2:certus_quartz_pickaxe>);
mods.jei.JEI.hide(<appliedenergistics2:certus_quartz_sword>);
mods.jei.JEI.hide(<appliedenergistics2:nether_quartz_axe>);
mods.jei.JEI.hide(<appliedenergistics2:nether_quartz_hoe>);
mods.jei.JEI.hide(<appliedenergistics2:nether_quartz_spade>);
mods.jei.JEI.hide(<appliedenergistics2:nether_quartz_pickaxe>);
mods.jei.JEI.hide(<appliedenergistics2:nether_quartz_sword>);
mods.jei.JEI.hide(<appliedenergistics2:certus_quartz_cutting_knife>);
mods.jei.JEI.hide(<appliedenergistics2:nether_quartz_cutting_knife>);
mods.jei.JEI.hide(<appliedenergistics2:entropy_manipulator>);
mods.jei.JEI.hide(<appliedenergistics2:charged_staff>);
mods.jei.JEI.hide(<appliedenergistics2:material:5>);
mods.jei.JEI.hide(<appliedenergistics2:material:20>);
mods.jei.JEI.hide(<appliedenergistics2:material:19>);
mods.jei.JEI.hide(<appliedenergistics2:material:40>);


//adjust
//Charger
recipes.remove(<appliedenergistics2:charger>);
recipes.addShaped(<appliedenergistics2:charger>,
		[[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:7> | <appliedenergistics2:material:12>,<gregtech:meta_item_1:12183>],
		[<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:32672>,null],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:7> | <appliedenergistics2:material:12>,<gregtech:meta_item_1:12183>]]
	);

//ME Security Terminal
recipes.remove(<appliedenergistics2:security_station>);
recipes.addShaped(<appliedenergistics2:security_station>,
		[[<gregtech:meta_item_1:12183>,<appliedenergistics2:chest>,<gregtech:meta_item_1:12183>],
		[<appliedenergistics2:part:16>,<appliedenergistics2:material:37>,<appliedenergistics2:part:16>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:24>,<gregtech:meta_item_1:12183>]]
	);

//ME Quantum Ring
recipes.remove(<appliedenergistics2:quantum_ring>);
recipes.addShaped(<appliedenergistics2:quantum_ring>,
		[[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:22>,<gregtech:meta_item_1:12183>],
		[<appliedenergistics2:material:24>,<appliedenergistics2:energy_cell>,<appliedenergistics2:part:76>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:22>,<gregtech:meta_item_1:12183>]]
	);

//Spatial IO Port
recipes.remove(<appliedenergistics2:spatial_io_port>);
recipes.addShaped(<appliedenergistics2:spatial_io_port>,
		[[<ore:blockGlass>,<ore:blockGlass>,<ore:blockGlass>],
		[<appliedenergistics2:part:16>,<appliedenergistics2:io_port>,<appliedenergistics2:part:16>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:24>,<gregtech:meta_item_1:12183>]]
	);

//ME Controller
recipes.remove(<appliedenergistics2:controller>);
recipes.addShaped(<appliedenergistics2:controller>,
		[[<gregtech:meta_item_2:32490>,<contenttweaker:plate_fluix>,<gregtech:meta_item_2:32490>],
		[<contenttweaker:plate_fluix>,<appliedenergistics2:material:24>,<contenttweaker:plate_fluix>],
		[<gregtech:meta_item_2:32490>,<contenttweaker:plate_fluix>,<gregtech:meta_item_2:32490>]]
	);

//ME Drive
recipes.remove(<appliedenergistics2:drive>);
recipes.addShaped(<appliedenergistics2:drive>,
		[[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:24>,<gregtech:meta_item_1:12183>],
		[<appliedenergistics2:part:16>,null,<appliedenergistics2:part:16>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:24>,<gregtech:meta_item_1:12183>]]
	);

//ME Chest
recipes.remove(<appliedenergistics2:chest>);
recipes.addShaped(<appliedenergistics2:chest>,
		[[<ore:blockGlass>,<appliedenergistics2:part:380>,<ore:blockGlass>],
		[<appliedenergistics2:part:16>,null,<appliedenergistics2:part:16>],
		[<gregtech:meta_item_1:12183>,<contenttweaker:plate_fluix>,<gregtech:meta_item_1:12183>]]
	);

//ME Interface
recipes.remove(<appliedenergistics2:interface>);
recipes.addShapeless(<appliedenergistics2:interface>,[<appliedenergistics2:part:440>]);
recipes.addShaped(<appliedenergistics2:interface>,
		[[<gregtech:meta_item_1:12183>,<ore:blockGlass>,<gregtech:meta_item_1:12183>],
		[<appliedenergistics2:material:44>,null,<appliedenergistics2:material:43>],
		[<gregtech:meta_item_1:12183>,<ore:blockGlass>,<gregtech:meta_item_1:12183>]]
	);

//ME Fluid Interface
recipes.remove(<appliedenergistics2:fluid_interface>);
recipes.addShapeless(<appliedenergistics2:fluid_interface>,[<appliedenergistics2:part:441>]);
recipes.addShaped(<appliedenergistics2:fluid_interface>,
		[[<gregtech:meta_item_1:12183>,<ore:dyeBlue>,<gregtech:meta_item_1:12183>],
		[<appliedenergistics2:material:44>,null,<appliedenergistics2:material:43>],
		[<gregtech:meta_item_1:12183>,<ore:dyeBlue>,<gregtech:meta_item_1:12183>]]
	);

//Cell Workbench
recipes.remove(<appliedenergistics2:cell_workbench>);
recipes.addShaped(<appliedenergistics2:cell_workbench>,
		[[<gregtech:meta_item_1:12141>,<appliedenergistics2:material:24>,<gregtech:meta_item_1:12141>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:drive>,<gregtech:meta_item_1:12183>],
		[<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:12183>]]
	);

//ME IO Port
recipes.remove(<appliedenergistics2:io_port>);
recipes.addShaped(<appliedenergistics2:io_port>,
		[[<ore:blockGlass>,<ore:blockGlass>,<ore:blockGlass>],
		[<appliedenergistics2:drive>,<appliedenergistics2:part:16>,<appliedenergistics2:drive>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:22>,<gregtech:meta_item_1:12183>]]
	);

//Matter Condenser
recipes.remove(<appliedenergistics2:condenser>);
recipes.addShaped(<appliedenergistics2:condenser>,
		[[<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:32672>,<gregtech:meta_item_1:12183>],
		[<gregtech:meta_item_1:32672>,<ore:dustFluix>,<gregtech:meta_item_1:32672>],
		[<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:32672>,<gregtech:meta_item_1:12183>]]
	);

//Energy Acceptor
recipes.remove(<appliedenergistics2:energy_acceptor>);
recipes.addShaped(<appliedenergistics2:energy_acceptor>,
		[[<gregtech:meta_item_1:12183>,<appliedenergistics2:quartz_glass>,<gregtech:meta_item_1:12183>],
		[<gregtech:meta_item_1:32602>,<ore:dustFluix>,<gregtech:meta_item_1:32538>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:quartz_glass>,<gregtech:meta_item_1:12183>]]
	);

//Crystal Growth Accelerator
recipes.remove(<appliedenergistics2:quartz_growth_accelerator>);
recipes.addShaped(<appliedenergistics2:quartz_growth_accelerator>,
		[[<gregtech:meta_item_1:12183>,<appliedenergistics2:part:16>,<gregtech:meta_item_1:12183>],
		[<gregtech:meta_item_1:32682>,<appliedenergistics2:fluix_block>,<gregtech:meta_item_1:32682>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:part:16>,<gregtech:meta_item_1:12183>]]
	);

//Crafting Unit
recipes.remove(<appliedenergistics2:crafting_unit>);
recipes.addShaped(<appliedenergistics2:crafting_unit>,
		[[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:24>,<gregtech:meta_item_1:12183>],
		[<appliedenergistics2:part:16>,<appliedenergistics2:material:22>,<appliedenergistics2:part:16>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:24>,<gregtech:meta_item_1:12183>]]
	);

//Molecular Assembler
recipes.remove(<appliedenergistics2:molecular_assembler>);
recipes.addShaped(<appliedenergistics2:molecular_assembler>,
		[[<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:32682>,<gregtech:meta_item_1:12183>],
		[<appliedenergistics2:material:44>,<appliedenergistics2:crafting_unit>,<appliedenergistics2:material:43>],
		[<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:32652>,<gregtech:meta_item_1:12183>]]
	);

//Charged Quartz Fixture
recipes.remove(<appliedenergistics2:quartz_fixture>);
recipes.addShaped(<appliedenergistics2:quartz_fixture>,
		[[<appliedenergistics2:material:1>,<appliedenergistics2:part:120>]]
	);

//Light Detecting Fixture
recipes.remove(<appliedenergistics2:light_detector>);
recipes.addShaped(<appliedenergistics2:light_detector>,
		[[<ore:gemQuartz> | <ore:crystalPureNetherQuartz>,<appliedenergistics2:part:120>]]
	);

//Cable Anchor
recipes.remove(<appliedenergistics2:part:120>);
recipes.addShapeless(<appliedenergistics2:part:120>,[<gregtech:meta_item_1:16184>]);

//Matter Cannon
recipes.remove(<appliedenergistics2:matter_cannon>);
recipes.addShaped(<appliedenergistics2:matter_cannon>,
		[[<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:12183>,<appliedenergistics2:material:43>],
		[<appliedenergistics2:material:36>,<appliedenergistics2:energy_cell>,null],
		[<gregtech:meta_item_1:12183>,null,null]]
	);

//Color Applicator
recipes.remove(<appliedenergistics2:color_applicator>);
recipes.addShaped(<appliedenergistics2:color_applicator>,
		[[<appliedenergistics2:material:43>,<gregtech:meta_item_1:12183>,null],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:36>,null],
		[null,null,<appliedenergistics2:energy_cell>]]
	);

//Biometric Card
recipes.remove(<appliedenergistics2:biometric_card>);
recipes.addShaped(<appliedenergistics2:biometric_card>,
		[[<appliedenergistics2:material:24>,<gregtech:meta_item_2:32490>,<gregtech:meta_item_2:16237>],
		[<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:12183>]]
	);

//Biometric Card
recipes.remove(<appliedenergistics2:biometric_card>);
recipes.addShaped(<appliedenergistics2:biometric_card>,
		[[<appliedenergistics2:material:24>,<gregtech:meta_item_2:32485>],
		[<gregtech:meta_item_1:12183>,<gregtech:meta_item_1:12183>]]
	);

//View Cell
recipes.remove(<appliedenergistics2:view_cell>);
recipes.addShapeless(<appliedenergistics2:view_cell>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:0> | <appliedenergistics2:material:1> | <appliedenergistics2:material:10>]);
recipes.addShaped(<appliedenergistics2:view_cell>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:0> | <appliedenergistics2:material:1> | <appliedenergistics2:material:10>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//ME Storage Housing
recipes.remove(<appliedenergistics2:material:39>);
recipes.addShapeless(<appliedenergistics2:material:39>,[<extracells:storage.casing:1>]);
recipes.addShaped(<appliedenergistics2:material:39>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,null,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//1k ME Storage Cell
recipes.remove(<appliedenergistics2:storage_cell_1k>);
recipes.addShapeless(<appliedenergistics2:storage_cell_1k>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:35>]);
recipes.addShaped(<appliedenergistics2:storage_cell_1k>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:35>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//4k ME Storage Cell
recipes.remove(<appliedenergistics2:storage_cell_4k>);
recipes.addShapeless(<appliedenergistics2:storage_cell_4k>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:36>]);
recipes.addShaped(<appliedenergistics2:storage_cell_4k>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:36>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//16k ME Storage Cell
recipes.remove(<appliedenergistics2:storage_cell_16k>);
recipes.addShapeless(<appliedenergistics2:storage_cell_16k>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:37>]);
recipes.addShaped(<appliedenergistics2:storage_cell_16k>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:37>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//64k ME Storage Cell
recipes.remove(<appliedenergistics2:storage_cell_64k>);
recipes.addShapeless(<appliedenergistics2:storage_cell_64k>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:38>]);
recipes.addShaped(<appliedenergistics2:storage_cell_64k>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:38>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//1k ME Fluid Storage Cell
recipes.remove(<appliedenergistics2:fluid_storage_cell_1k>);
recipes.addShapeless(<appliedenergistics2:fluid_storage_cell_1k>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:54>]);
recipes.addShaped(<appliedenergistics2:fluid_storage_cell_1k>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:54>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//4k ME Fluid Storage Cell
recipes.remove(<appliedenergistics2:fluid_storage_cell_4k>);
recipes.addShapeless(<appliedenergistics2:fluid_storage_cell_4k>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:55>]);
recipes.addShaped(<appliedenergistics2:fluid_storage_cell_4k>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:55>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//16k ME Fluid Storage Cell
recipes.remove(<appliedenergistics2:fluid_storage_cell_16k>);
recipes.addShapeless(<appliedenergistics2:fluid_storage_cell_16k>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:56>]);
recipes.addShaped(<appliedenergistics2:fluid_storage_cell_16k>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:56>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//64k ME Fluid Storage Cell
recipes.remove(<appliedenergistics2:fluid_storage_cell_64k>);
recipes.addShapeless(<appliedenergistics2:fluid_storage_cell_64k>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:57>]);
recipes.addShaped(<appliedenergistics2:fluid_storage_cell_64k>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:57>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//2^3 Spatial Storage Cell
recipes.remove(<appliedenergistics2:spatial_storage_cell_2_cubed>);
recipes.addShapeless(<appliedenergistics2:spatial_storage_cell_2_cubed>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:32>]);
recipes.addShaped(<appliedenergistics2:spatial_storage_cell_2_cubed>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:32>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//16^3 Spatial Storage Cell
recipes.remove(<appliedenergistics2:spatial_storage_cell_16_cubed>);
recipes.addShapeless(<appliedenergistics2:spatial_storage_cell_16_cubed>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:33>]);
recipes.addShaped(<appliedenergistics2:spatial_storage_cell_16_cubed>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:33>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//128^3 Spatial Storage Cell
recipes.remove(<appliedenergistics2:spatial_storage_cell_128_cubed>);
recipes.addShapeless(<appliedenergistics2:spatial_storage_cell_128_cubed>,[<appliedenergistics2:material:39>,<appliedenergistics2:material:34>]);
recipes.addShaped(<appliedenergistics2:spatial_storage_cell_128_cubed>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_2:32488>,<appliedenergistics2:material:34>,<gregtech:meta_item_2:32488>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//Advanced Card
recipes.remove(<appliedenergistics2:material:28>);
assembler.recipeBuilder()
	.inputs([<appliedenergistics2:material:23>,<gregtech:meta_item_2:32448>,<gregtech:meta_item_2:16049>])
	.fluidInputs([<liquid:soldering_alloy> * 144])
	.outputs(<appliedenergistics2:material:28> * 1)
	.duration(200)
	.EUt(60)
	.buildAndRegister();

//Basic Card
recipes.remove(<appliedenergistics2:material:25>);
assembler.recipeBuilder()
	.inputs([<appliedenergistics2:material:23>,<gregtech:meta_item_2:32448>,<gregtech:meta_item_2:16026>])
	.fluidInputs([<liquid:soldering_alloy> * 144])
	.outputs(<appliedenergistics2:material:25> * 1)
	.duration(200)
	.EUt(60)
	.buildAndRegister();

//Calculation Processor
Inscriber.removeRecipe(<appliedenergistics2:material:23>);
assembler.recipeBuilder()
	.inputs([<appliedenergistics2:material:16>,<gregtech:meta_item_2:32478>,<gregtech:meta_item_2:16237>])
	.fluidInputs([<liquid:soldering_alloy> * 144])
	.outputs(<appliedenergistics2:material:23> * 1)
	.duration(200)
	.EUt(60)
	.buildAndRegister();

//Engineering Processor
Inscriber.removeRecipe(<appliedenergistics2:material:24>);
assembler.recipeBuilder()
	.inputs([<appliedenergistics2:material:17>,<gregtech:meta_item_2:32478>,<gregtech:meta_item_2:16237>])
	.fluidInputs([<liquid:soldering_alloy> * 144])
	.outputs(<appliedenergistics2:material:24> * 1)
	.duration(200)
	.EUt(60)
	.buildAndRegister();

//Logic Processor
Inscriber.removeRecipe(<appliedenergistics2:material:22>);
assembler.recipeBuilder()
	.inputs([<appliedenergistics2:material:18>,<gregtech:meta_item_2:32478>,<gregtech:meta_item_2:16237>])
	.fluidInputs([<liquid:soldering_alloy> * 144])
	.outputs(<appliedenergistics2:material:22> * 1)
	.duration(200)
	.EUt(60)
	.buildAndRegister();

//Printed Calculation Circuit
Inscriber.removeRecipe(<appliedenergistics2:material:16>);
laser_engraver.recipeBuilder()
	.inputs([<gregtech:meta_item_1:12202>,<appliedenergistics2:material:13>])
	.outputs(<appliedenergistics2:material:16> * 1)
	.duration(100)
	.EUt(120)
	.buildAndRegister();

//Printed Engineering Circuit
Inscriber.removeRecipe(<appliedenergistics2:material:17>);
laser_engraver.recipeBuilder()
	.inputs([<gregtech:meta_item_1:12111>,<appliedenergistics2:material:14>])
	.outputs(<appliedenergistics2:material:17> * 1)
	.duration(100)
	.EUt(120)
	.buildAndRegister();

//Printed Logic Circuit
Inscriber.removeRecipe(<appliedenergistics2:material:18>);
laser_engraver.recipeBuilder()
	.inputs([<gregtech:meta_item_1:12026>,<appliedenergistics2:material:15>])
	.outputs(<appliedenergistics2:material:18> * 1)
	.duration(100)
	.EUt(120)
	.buildAndRegister();

//Wireless Booster
recipes.remove(<appliedenergistics2:material:42>);
assembler.recipeBuilder()
	.inputs([<appliedenergistics2:material:23>,<gregtech:meta_item_1:32692>,<gregtech:meta_item_2:32448>])
	.fluidInputs([<liquid:soldering_alloy> * 144])
	.outputs(<appliedenergistics2:material:42> * 1)
	.duration(200)
	.EUt(60)
	.buildAndRegister();

//Wireless Receiver
recipes.remove(<appliedenergistics2:material:41>);
assembler.recipeBuilder()
	.inputs([<appliedenergistics2:material:9>,<gregtech:meta_item_1:32692>])
	.fluidInputs([<liquid:soldering_alloy> * 144])
	.outputs(<appliedenergistics2:material:41> * 1)
	.duration(200)
	.EUt(60)
	.buildAndRegister();

//Blank Pattern
recipes.remove(<appliedenergistics2:material:52>);
recipes.addShaped(<appliedenergistics2:material:52>,
		[[<appliedenergistics2:quartz_glass>,<minecraft:glowstone_dust>,<appliedenergistics2:quartz_glass>],
		[<minecraft:glowstone_dust>,<appliedenergistics2:material:0> | <appliedenergistics2:material:1> | <appliedenergistics2:material:10>,<minecraft:glowstone_dust>],
		[<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>,<gregtech:meta_item_1:12141>]]
	);

//Certus Quartz
autoclave.recipeBuilder()
	.inputs(<gregtech:meta_item_1:8202>)
	.fluidInputs([<liquid:water> * 200])
	.outputs(<appliedenergistics2:material:0> * 1)
	.duration(800)
	.EUt(24)
	.buildAndRegister();

//ME Annihilation Plane
recipes.remove(<appliedenergistics2:part:300>);
recipes.addShaped(<appliedenergistics2:part:300>,
		[[<appliedenergistics2:quartz_glass>,<gregtech:meta_item_2:32488>,<appliedenergistics2:quartz_glass>],
		[<gregtech:meta_item_1:12183>,<appliedenergistics2:material:44>,<gregtech:meta_item_1:12183>]]
	);

//Certus Quartz Plate
compressor.recipeBuilder()
	.inputs(<appliedenergistics2:material:10> * 2)
	.outputs(<contenttweaker:plate_certus_quartz>)
	.duration(200)
	.EUt(8)
	.buildAndRegister();

//Nether Quartz Plate
compressor.recipeBuilder()
	.inputs(<appliedenergistics2:material:11> * 2)
	.outputs(<contenttweaker:plate_nether_quartz>)
	.duration(200)
	.EUt(8)
	.buildAndRegister();

//Fluix Plate
compressor.recipeBuilder()
	.inputs(<appliedenergistics2:material:12> * 2)
	.outputs(<contenttweaker:plate_fluix>)
	.duration(200)
	.EUt(8)
	.buildAndRegister();

//Nether-Certus Plate
compressor.recipeBuilder()
	.inputs(<contenttweaker:dust_nether_certus_mix> * 2)
	.outputs(<contenttweaker:plate_nether_certus_mix>)
	.duration(200)
	.EUt(8)
	.buildAndRegister();

//Nether-Certus Mix Dust
mixer.recipeBuilder()
	.inputs([<ore:dustNetherQuartz>,<ore:dustCertusQuartz>])
	.outputs(<contenttweaker:dust_nether_certus_mix> * 2)
	.duration(60)
	.EUt(30)
	.buildAndRegister();

//Quartz Fiber Wire
extruder.recipeBuilder()
	.inputs([<contenttweaker:plate_nether_certus_mix>,<gregtech:meta_item_1:32356>])
	.outputs(<contenttweaker:wire_quartz_fiber> * 6)
	.duration(160)
	.EUt(96)
	.buildAndRegister();

//Quart Fiber
recipes.remove(<appliedenergistics2:part:140>);
wiremill.recipeBuilder()
	.inputs(<contenttweaker:wire_quartz_fiber> * 3)
	.outputs(<appliedenergistics2:part:140> * 1)
	.duration(80)
	.EUt(8)
	.buildAndRegister();