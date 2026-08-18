-- Quest 8.1: Mob-Begrüßer
-- Rezept mit zwei Lücken - nur aufschreiben passiert still,
-- erst die Aufrufe unten lassen es laufen!
local function mob_sagt(mob, text)
  print("[" .. mob .. "] sagt: " .. text)
end

mob_sagt("Creeper", "Sssss...")
mob_sagt("Zombie", "Uaaaargh!")
mob_sagt("Skelett", "Klapper klapper")

-- Bonus-Quest: Der Zeilen-Zähler
-- Fünf Aufrufe = 5 Zeilen. Ohne Rezept wären es 5 print-Zeilen
-- mit jeweils komplettem Text - und bei jeder Änderung am Format
-- müsste man alle 5 anfassen statt nur das Rezept.
mob_sagt("Enderman", "...")
mob_sagt("Schwein", "Oink!")
