val ieDefaults = [
    "Iron", "Magnetite", "Pyrite", "Bauxite", "Copper", "Cassiterite",
    "Gold", "Nickel", "Platinum", "Uranium", "Quartzite", "Galena",
    "Lead", "Silver", "Lapis", "Cinnabar", "Coal"
] as string[];

for mineral in ieDefaults {
    mods.immersiveengineering.Excavator.removeMineral(mineral);
}
