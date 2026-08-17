-- Quest 4.1: Mob-Generator
local mobs = {"Zombie", "Skelett", "Creeper", "Spinne", "Enderman", "Hexe", "Slime", "Phantom"}

print("5 zufällige Mobs:")
for i = 1, 5 do
  local mob = mobs[math.random(1, #mobs)]
  print(i .. ". " .. mob)
end

-- Bonus-Quest: Loot-Truhe
print("")
print("Du öffnest 10 Truhen:")
for i = 1, 10 do
  local chance = math.random(1, 100)
  local fund
  if chance <= 5 then
    fund = "Netherit-Splitter"
  elseif chance <= 20 then          -- 5 + 15 = 20
    fund = "Diamant"
  elseif chance <= 50 then          -- 20 + 30 = 50
    fund = "Eisenbarren"
  else                              -- Rest: 50%
    fund = "Brot"
  end
  print("Truhe " .. i .. ": " .. fund)
end
