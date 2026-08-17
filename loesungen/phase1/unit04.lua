-- Quest 4.1: Der Begrüßungs-Bot
print("Wie heißt Du?")
local name = io.read()
print("Was ist Dein Lieblings-Mob?")
local mob = io.read()
print("Hallo " .. name .. ", " .. mob .. " sind auch meine Favoriten!")

-- Quest 4.2: Repariere den Addierer
print("Erste Zahl?")
local a = tonumber(io.read())   -- Schild direkt im Ofen schmelzen
print("Zweite Zahl?")
local b = tonumber(io.read())
print("Ergebnis: " .. (a + b))  -- Klammern, damit erst gerechnet und dann geklebt wird

-- Bonus-Quest: XP-Rechner
print("Welches Level hast Du?")
local level = tonumber(io.read())
print("Welches Level willst Du erreichen?")
local ziel = tonumber(io.read())
print("Dir fehlen noch " .. (ziel - level) .. " Level.")
