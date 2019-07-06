val blue_dye = <ore:dyeBlue>;
val dye = <ore:dye>;
val white_dye = <ore:dyeWhite>;

//remove lapis and bonemeal from dye dicts
blue_dye.remove(<minecraft:dye:4>);
white_dye.remove(<minecraft:dye:15>);
dye.remove(<minecraft:dye:4>);
dye.remove(<minecraft:dye:15>);

//blueDye
recipes.remove(<biomesoplenty:blue_dye>);
recipes.remove(<quark:root_dye:0>);
recipes.addShapeless(<minecraftfuture:dye:1>, [<biomesoplenty:mushroom:2>]);
recipes.addShapeless(<minecraftfuture:dye:1>, [<biomesoplenty:flower_1:2>]);
recipes.addShapeless(<minecraftfuture:dye:1>, [<quark:root_flower:0>]);
//brownDye
recipes.remove(<biomesoplenty:brown_dye>);
recipes.addShapeless(<minecraftfuture:dye:2>, [<biomesoplenty:plant_1:4>]);
recipes.addShapeless(<minecraftfuture:dye:2>, [<biomesoplenty:double_plant:1>]);
recipes.addShapeless(<minecraftfuture:dye:2>, [<biomesoplenty:mushroom:4>]);
//whiteDye
recipes.remove(<biomesoplenty:white_dye>);
recipes.remove(<quark:root_dye:2>);
recipes.addShapeless(<minecraftfuture:dye:0>, [<biomesoplenty:flower_0:9>]);
recipes.addShapeless(<minecraftfuture:dye:0>, [<biomesoplenty:flower_0:14>]);
recipes.addShapeless(<minecraftfuture:dye:0>, [<quark:root_flower:2>]);
//dyeBlack
recipes.remove(<biomesoplenty:black_dye>);
recipes.remove(<quark:root_dye:1>);
recipes.addShapeless(<minecraftfuture:dye:0>, [<biomesoplenty:flower_0:2>]);
recipes.addShapeless(<minecraftfuture:dye:0>, [<biomesoplenty:flower_0:10>]);
recipes.addShapeless(<minecraftfuture:dye:0>, [<quark:root_flower:1>]);
