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

print("Mobs (abgerundet): " .. xp_noetig // xp_pro_mob)        -- 117, reicht noch nicht ganz
print("Rest-XP: " .. xp_noetig % xp_pro_mob)                   -- 6 XP fehlen noch
print("Mobs (aufgerundet): " .. math.ceil(xp_noetig / xp_pro_mob))  -- 118 - so viele braucht man wirklich
