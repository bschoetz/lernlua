-- Unit 10: Erz-Rate-Spiel - Stand nach Version 2
-- (Türsteher + Nah-dran-Bewertung; das Würfeln kommt in Unit 10½)

print("=== ERZ-TIEFEN-QUIZ ===")
local tiefe = -50

print("Auf welcher Y-Höhe findet man Diamant?")
local versuch = tonumber(io.read())

-- Türsteher: erst prüfen, ob überhaupt eine Zahl kam (sonst wäre versuch nil,
-- und math.abs würde beim Rechnen mit "nichts" abstürzen)
if versuch == nil then
  print("ACHTUNG: Das war keine Zahl! Probier's nochmal mit Ziffern.")
else
  local differenz = math.abs(versuch - tiefe)

  if differenz == 0 then
    print("*** PERFEKT! Genau bei Y=" .. tiefe)
  elseif differenz <= 10 then
    print("** Sehr nah! Richtig wäre Y=" .. tiefe)
  elseif differenz <= 30 then
    print("* Nicht schlecht. Richtig wäre Y=" .. tiefe)
  else
    print("Daneben. Richtig wäre Y=" .. tiefe)
  end
end
