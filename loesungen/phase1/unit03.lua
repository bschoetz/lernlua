-- Quest 3.1: Der Crafting-Rechner
local barren = 73
local bloecke = barren // 9
local rest = barren % 9

print("Eisenbarren: " .. barren)
print("Eisenblöcke: " .. bloecke)   -- 8
print("Übrig: " .. rest)            -- 1

-- Bonus-Quest: Wie lange bis Level 30?
local xp_pro_mob = 7
local xp_noetig = 825

print("Volle Mobs: " .. xp_noetig // xp_pro_mob)   -- 117
print("Fehlende XP: " .. xp_noetig % xp_pro_mob)   -- 6

-- Die letzte Antwort kommt aus dem Kopf: 117 Mobs bringen erst 819 XP,
-- es fehlen noch 6 - also muss er 118 Mobs besiegen.
-- (Profi-Trick für später: math.ceil(825 / 7) rundet auf und ergibt
-- direkt 118 - kommt im Kurs aber erst viel später dran.)
