import mods.inspirations.Cauldron;
import mods.jei.JEI;

// Stock
Cauldron.addFluidTransform(<liquid:soupstock>, <ore:bone>, <liquid:water>);
Cauldron.addFluidTransform(<liquid:soupstock>, <ore:listAllveggie>, <liquid:water>);
Cauldron.addFluidTransform(<liquid:soupstock>, <ore:listAllmeatraw>, <liquid:water>);
Cauldron.addFluidRecipe(<harvestcraft:stockitem>, <minecraft:bowl>, <liquid:soupstock>);



// Salty Rabbit Stew
Cauldron.addFluidTransform(<liquid:salty_rabbit_stew>, <ore:dustSalt>, <liquid:rabbit_stew>);
Cauldron.addFluidRecipe(<saltmod:salt_rabbit_stew>, <minecraft:bowl>, <liquid:salty_rabbit_stew>);



// Salty Musrhoom Stew
Cauldron.addFluidTransform(<liquid:salty_mushroom_stew>, <ore:dustSalt>, <liquid:mushroom_stew>);
Cauldron.addFluidRecipe(<saltmod:salt_mushroom_stew>, <minecraft:bowl>, <liquid:salty_mushroom_stew>);



// Salty Beetroot Stew
Cauldron.addFluidTransform(<liquid:salty_beetroot_soup>, <ore:dustSalt>, <liquid:beetroot_soup>);
Cauldron.addFluidRecipe(<saltmod:salt_beetroot_soup>, <minecraft:bowl>, <liquid:salty_beetroot_soup>);



// Pumpkin Porridge
Cauldron.addFluidTransform(<liquid:pumpkin_soup>, <ore:cropPumpkin>, <liquid:soupstock>);
Cauldron.addFluidRecipe(<harvestcraft:pumpkinsoupitem>, <minecraft:bowl>, <liquid:pumpkin_soup>);

recipes.replaceAllOccurences(<saltmod:pumpkin_porridge>, <harvestcraft:pumpkinsoupitem>);
JEI.removeAndHide(<saltmod:pumpkin_porridge>);



// Potato Soup
Cauldron.addFluidTransform(<liquid:potato_soup>, <ore:cropPotato>, <liquid:soupstock>);
Cauldron.addFluidRecipe(<harvestcraft:potatosoupitem>, <minecraft:bowl>, <liquid:potato_soup>);



// Carrot Soup
Cauldron.addFluidTransform(<liquid:carrot_soup>, <ore:cropCarrot>, <liquid:soupstock>);
Cauldron.addFluidRecipe(<harvestcraft:carrotsoupitem>, <minecraft:bowl>, <liquid:carrot_soup>);



// Potato/Carrot Mixture
Cauldron.addFluidTransform(<liquid:potato_carrot_mixture>, <ore:cropCarrot>, <liquid:potato_soup>);
Cauldron.addFluidTransform(<liquid:potato_carrot_mixture>, <ore:cropPotato>, <liquid:carrot_soup>);



// Veggie Stew
Cauldron.addFluidTransform(<liquid:vegetable_soup>, <ore:mushroomAny>, <liquid:potato_carrot_mixture>);
Cauldron.addFluidRecipe(<harvestcraft:vegetablesoupitem>, <minecraft:bowl>, <liquid:vegetable_soup>);

recipes.replaceAllOccurences(<saltmod:vegetable_stew>, <harvestcraft:vegetablesoupitem>);
JEI.removeAndHide(<saltmod:vegetable_stew>);



// Salty Stewed Vegetables
Cauldron.addFluidTransform(<liquid:salty_vegetable_soup>, <ore:dustSalt>, <liquid:vegetable_soup>);
Cauldron.addFluidRecipe(<saltmod:salt_vegetable_stew>, <minecraft:bowl>, <liquid:vegetable_soup>);

recipes.removeByRecipeName("saltmod:salt_vegetable_stew");
recipes.addShapeless(<saltmod:fish_soup>, [<ore:mushroomAny>, <ore:cropCarrot>, <ore:cropPotato>, <ore:toolPot>, <ore:foodStock>]);



// Fish soup
Cauldron.addFluidTransform(<liquid:fish_soup>, <ore:salmonRaw>, <liquid:potato_carrot_mixture>);
Cauldron.addFluidRecipe(<saltmod:fish_soup>, <minecraft:bowl>, <liquid:fish_soup>);

recipes.removeByRecipeName("saltmod:fish_soup");
recipes.addShapeless(<saltmod:fish_soup>, [<ore:salmonRaw>, <ore:cropCarrot>, <ore:cropPotato>, <ore:toolPot>, <ore:foodStock>]);



// Salty Fish Soup
Cauldron.addFluidTransform(<liquid:salty_fish_soup>, <ore:dustSalt>, <liquid:fish_soup>);
Cauldron.addFluidRecipe(<saltmod:salt_fish_soup>, <minecraft:bowl>, <liquid:salty_fish_soup>);

recipes.removeByRecipeName("saltmod:salt_fish_soup");
recipes.addShapeless(<saltmod:salt_fish_soup>, [<ore:salmonRaw>, <ore:cropCarrot>, <ore:cropPotato>, <ore:toolPot>, <ore:foodStock>, <ore:dustSalt>]);



// Salmon soup
Cauldron.addFluidTransform(<liquid:salmon_soup>, <minecraft:fish:1>, <liquid:potato_carrot_mixture>);
Cauldron.addFluidRecipe(<saltmod:fish_salmon_soup>, <minecraft:bowl>, <liquid:salmon_soup>);

recipes.removeByRecipeName("saltmod:fish_salmon_soup");
recipes.addShapeless(<saltmod:fish_salmon_soup>, [<minecraft:fish:1>, <ore:cropCarrot>, <ore:cropPotato>, <ore:toolPot>, <ore:foodStock>]);



// Salty Salmon Soup
Cauldron.addFluidTransform(<liquid:salty_salmon_soup>, <ore:dustSalt>, <liquid:salmon_soup>);
Cauldron.addFluidRecipe(<saltmod:salt_fish_salmon_soup>, <minecraft:bowl>, <liquid:salty_salmon_soup>);

recipes.removeByRecipeName("saltmod:salt_fish_salmon_soup");
recipes.addShapeless(<saltmod:salt_fish_salmon_soup>, [<minecraft:fish:1>, <ore:cropCarrot>, <ore:cropPotato>, <ore:toolPot>, <ore:foodStock>, <ore:dustSalt>]);
