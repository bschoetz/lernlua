-- Quest 8½.1: Schaden-Rechner
-- Zwei Lücken (waffe, treffer), Ergebnis kommt per return in den Ausgabe-Slot
local function schaden(waffe, treffer)
  local pro_treffer = 0
  if waffe == "Holzschwert" then
    pro_treffer = 4
  elseif waffe == "Eisenschwert" then
    pro_treffer = 6
  elseif waffe == "Diamantschwert" then
    pro_treffer = 7
  end
  return pro_treffer * treffer
end

print("Holzschwert, 3 Treffer: " .. schaden("Holzschwert", 3))       -- 12
print("Eisenschwert, 2 Treffer: " .. schaden("Eisenschwert", 2))     -- 12
print("Diamantschwert, 5 Treffer: " .. schaden("Diamantschwert", 5)) -- 35

-- Bonus-Quest: XP-Rechner als Rezept
-- return, nicht print: Das Programm soll mit der Differenz weiterarbeiten
-- können - anzeigen kann sie der Aufrufer dann selbst.
local function fehlende_level(aktuell, ziel)
  return ziel - aktuell
end

print("Dir fehlen noch " .. fehlende_level(12, 30) .. " Level.")   -- 18
