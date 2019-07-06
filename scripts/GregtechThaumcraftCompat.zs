import mods.thaumcraft.Crucible;

/*
*   Cinnabar ore
*/
// Cinnabar ore -> Cinnabar gem so quicksilver can be obtained
furnace.remove(<gregtech:meta_item_1:8103>);

// Use the oredict, Luke.
furnace.remove(<thaumcraft:quicksilver>, <thaumcraft:ore_cinnabar>);
furnace.addRecipe(<thaumcraft:quicksilver>, <ore:oreCinnabar>, 1.0);

// Fix up the Crucible
Crucible.removeRecipe(<thaumcraft:cluster:6>);
Crucible.registerRecipe(
    "gtceCompatCinnabarCluster", 
    "METALPURIFICATION",
    <thaumcraft:cluster:6>,
    <ore:oreCinnabar>,
    [<aspect:metallum> * 5, <aspect:ordo> * 5]
);



/*
*   Amber ore
*/
furnace.remove(<thaumcraft:amber>);
furnace.addRecipe(<thaumcraft:amber>, <ore:oreAmber>, 1.0);
