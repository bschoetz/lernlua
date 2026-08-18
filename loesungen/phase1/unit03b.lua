-- Quest 3½.1: Der zweite Rohstoff
local eisen = 73
local gold = 30

local eisen_bloecke = eisen // 9
local eisen_rest = eisen % 9
local gold_bloecke = gold // 9
local gold_rest = gold % 9

print("Eisen: " .. eisen_bloecke .. " Blöcke, " .. eisen_rest .. " Barren übrig")   -- 8 Blöcke, 1 übrig
print("Gold: " .. gold_bloecke .. " Blöcke, " .. gold_rest .. " Barren übrig")      -- 3 Blöcke, 3 übrig

-- Bonus-Quest: Namens-Detektiv
-- Das Rätsel-Programm verteilt 30 Pfeile an 4 Spieler:
-- jeder bekommt 7, und 2 bleiben übrig. Mit guten Namen:
local pfeile = 30
local spieler = 4
local pro_spieler = pfeile // spieler
local uebrig = pfeile % spieler
print("Jeder Spieler bekommt: " .. pro_spieler)   -- 7
print("Übrig bleiben: " .. uebrig)                -- 2
