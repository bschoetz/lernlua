-- Quest 5.1: Der Mob-Bestimmer
-- (Schild-Vergleich: Text mit Text — kein tonumber nötig)
print("Welcher Mob? (zombie/creeper/cow)")
local mob = io.read()

if mob == "zombie" then
  print("Untot, fürchtet Sonne")
elseif mob == "creeper" then
  print("VORSICHT, GEHT WEG!")
elseif mob == "cow" then
  print("Friedlich, gibt Milch")
else
  print("Unbekannter Mob")
end

-- Bonus-Quest: Schwierigkeits-Bewertung
-- (Zahlen-Vergleich: erst schmelzen, sonst ist "5" == 5 niemals wahr!)
print("Wie viele Herzen hast Du? (0-10)")
local herzen = tonumber(io.read())

-- Lua prüft von oben nach unten und nimmt die erste Tür, die aufgeht:
if herzen == 0 then
  print("Game Over")
elseif herzen <= 3 then      -- die 0 wurde oben schon abgefangen
  print("Kritisch!")
elseif herzen <= 7 then
  print("Mittel")
else
  print("Voll gesund")
end
