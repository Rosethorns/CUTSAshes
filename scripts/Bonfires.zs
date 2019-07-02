//Pile of Bone and Ash
recipes.remove(<bonfires:ash_bone_pile>);
mods.thaumcraft.Infusion.registerRecipe("Pile of Bone and Ash", "", <bonfires:ash_bone_pile>, 0.5, [<aspect:ignis> * 10, <aspect:spiritus> * 20], <minecraft:skull:0>, [<bonfires:ash_pile>, <bonfires:ash_pile>, <bonfires:ash_pile>, <bonfires:homeward_bone>, <bonfires:homeward_bone>, <bonfires:homeward_bone>]);

//Coiled Sword
recipes.remove(<bonfires:coiled_sword>);
mods.embers.Alchemy.add(<bonfires:coiled_sword>, [<embers:sword_dawnstone>, <embers:ember_cluster>, <embers:aspectus_dawnstone>, <embers:aspectus_lead>, <bonfires:ash_pile>], {"dawnstone": 16 to 32, "copper": 0 to 16});