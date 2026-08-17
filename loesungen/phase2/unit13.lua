-- Quest 13.1: Spawn-Bedingungen
local ist_tag = false
local licht_level = 4

if not ist_tag and licht_level < 7 then
  print("Mobs spawnen!")
else
  print("Sicher.")
end

-- Bonus-Quest: Boss-Bereit-Check
print("Welches Level hast Du?")
local level = tonumber(io.read())
print("Hast Du ein Schwert? (j/n)")
local hat_schwert = io.read() == "j"
print("Hast Du Tränke? (j/n)")
local hat_traenke = io.read() == "j"

if level >= 30 and (hat_schwert or hat_traenke) then
  print("⚔️ Boss-bereit!")
else
  print("Noch nicht bereit — erst leveln oder Ausrüstung besorgen.")
end
