-- Quest 8.1: Schaden-Rechner
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

-- Bonus-Quest: Mob-Begrüßer
local function mob_sagt(mob, text)
  print("[" .. mob .. "] sagt: " .. text)
end

mob_sagt("Creeper", "Sssss...")
mob_sagt("Zombie", "Uaaaargh!")
