-- Quest 9.1: Dein Inventar
local inventar = {"Diamantschwert", "Eisenspitzhacke", "Brot", "Fackel", "Wasserflasche"}

print("=== INVENTAR ===")
for i = 1, #inventar do
  print(i .. ". " .. inventar[i])
end

-- Bonus-Quest: Mob-Zoo
local mobs = {"Zombie", "Skelett", "Creeper", "Spinne", "Enderman", "Schwein"}

print("")
for i = 1, #mobs do
  print(mobs[i] .. " sagt: Hallo!")
end
