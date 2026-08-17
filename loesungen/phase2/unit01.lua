-- Quest 1.1: Charakter-Karte
local spieler = {
  name = "Alex",
  herzen = 10,
  hunger = 8,
  xp = 127,
  position = { x = 64, y = 72, z = -128 }
}

print("=== SPIELER-KARTE ===")
print("Name:    " .. spieler.name)
print("Herzen:  " .. spieler.herzen)
print("Hunger:  " .. spieler.hunger)
print("XP:      " .. spieler.xp)
print("Position: X=" .. spieler.position.x .. ", Y=" .. spieler.position.y .. ", Z=" .. spieler.position.z)

-- Bonus-Quest: Mob-Datenbank
local mobs = {
  zombie  = { schaden = 3, leben = 20, feindlich = true },
  skelett = { schaden = 4, leben = 20, feindlich = true },
  creeper = { schaden = 22, leben = 20, feindlich = true },
}

print("")
print("=== CREEPER ===")
print("Schaden:   " .. mobs.creeper.schaden)
print("Leben:     " .. mobs.creeper.leben)
print("Feindlich: " .. tostring(mobs.creeper.feindlich))
-- tostring braucht man, weil man true/false nicht direkt mit .. verkleben kann
