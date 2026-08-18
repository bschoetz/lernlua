-- Quest 5.1: Der Hunger-Warner
-- Die Eingabe kommt als Schild an - vor dem Zahlen-Vergleich schmelzen!
print("Wie hungrig bist Du? (0-10)")
local hunger = tonumber(io.read())

if hunger <= 3 then
  print("Schnell, iss ein Steak!")
else
  print("Alles gut, weiter geht's!")
end

-- Bonus-Quest: Creeper-Alarm (Frage-Aufgabe, kein Programm noetig)
-- 1) "weniger als 5 Bloecke" -> das Kleiner-Zeichen:  abstand < 5
-- 2) "genau 3 Bloecke"       -> die Gleich-Frage:     abstand == 3
--    (zwei Gleichheitszeichen - eines waere ein Befehl!)
