-- Quest 2.1: Schrei-Maschine
print("Sag mir einen Satz:")
local satz = io.read()
print(string.upper(satz) .. "!!!")

-- Bonus-Quest: Mob-Zensur
print("Noch ein Satz (gerne mit Creeper drin):")
local satz2 = io.read()
local zensiert = string.gsub(satz2, "Creeper", "Pfannkuchen")
print(zensiert)
