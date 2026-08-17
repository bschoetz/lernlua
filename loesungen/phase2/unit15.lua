local function neuer_spieler(name)
  return { name = name, herzen = 10, hunger = 10, inventar = {} }
end

-- Quest 15.1: Heilung und Schaden
local function heile(spieler, menge)
  spieler.herzen = math.min(spieler.herzen + menge, 10)
  print(spieler.name .. " geheilt. Herzen: " .. spieler.herzen)
end

local function essen(spieler, menge)
  spieler.hunger = math.min(spieler.hunger + menge, 10)
  print(spieler.name .. " hat gegessen. Hunger: " .. spieler.hunger)
end

local steve = neuer_spieler("Steve")
steve.herzen = 3
steve.hunger = 2

heile(steve, 4)   -- 7
heile(steve, 5)   -- 10 (nicht 12!)
essen(steve, 3)   -- 5
essen(steve, 9)   -- 10

-- Bonus-Quest: Kampf-Runde
local function kampf(spieler, mob)
  local spieler_schaden = math.random(1, 6)
  local mob_schaden = math.random(1, 4)
  mob.herzen = mob.herzen - spieler_schaden
  spieler.herzen = spieler.herzen - mob_schaden
  print(spieler.name .. " trifft " .. mob.name .. " mit " .. spieler_schaden ..
        " (" .. math.max(mob.herzen, 0) .. " HP übrig)")
  print(mob.name .. " trifft " .. spieler.name .. " mit " .. mob_schaden ..
        " (" .. math.max(spieler.herzen, 0) .. " HP übrig)")
end

print("")
print("=== KAMPF ===")
local alex = neuer_spieler("Alex")
local zombie = { name = "Zombie", herzen = 12 }

while alex.herzen > 0 and zombie.herzen > 0 do
  kampf(alex, zombie)
end

if alex.herzen > 0 then
  print("🏆 " .. alex.name .. " gewinnt!")
else
  print("💀 Der Zombie gewinnt...")
end
