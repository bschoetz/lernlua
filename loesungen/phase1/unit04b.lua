-- Quest 4½.1: Der Zahlen-Addierer
print("Erste Zahl?")
local a = tonumber(io.read())   -- Schild direkt im Ofen schmelzen
print("Zweite Zahl?")
local b = tonumber(io.read())
print("Ergebnis: " .. (a + b))  -- Klammern, damit erst gerechnet und dann geklebt wird

-- Der Spaß zum Schluss: mit .. statt + wird geklebt statt gerechnet -
-- aus 3 und 4 wird dann "34":
-- print("Ergebnis: " .. a .. b)

-- Bonus-Quest: XP-Rechner
print("Welches Level hast Du?")
local level = tonumber(io.read())
print("Welches Level willst Du erreichen?")
local ziel = tonumber(io.read())
print("Dir fehlen noch " .. (ziel - level) .. " Level.")
