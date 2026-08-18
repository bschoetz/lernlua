-- Quest 9.1: Deine erste Truhe
local inventar = {"Diamantschwert", "Eisenspitzhacke", "Brot", "Fackel", "Wasserflasche"}

print(inventar[1])   -- Diamantschwert
print(inventar[3])   -- Brot
print(inventar[5])   -- Wasserflasche

print("Slot 2 vorher: " .. inventar[2])
inventar[2] = "Netherit-Spitzhacke"          -- altes Item raus, neues rein
print("Slot 2 nachher: " .. inventar[2])

print("Die Truhe hat " .. #inventar .. " Items.")

-- Bonus-Quest: Der letzte Slot
-- #inventar ist die Nummer des letzten belegten Slots - deshalb greift
-- inventar[#inventar] immer ins letzte Fach, egal wie voll die Truhe ist.
print("Ganz hinten liegt: " .. inventar[#inventar])   -- Wasserflasche
