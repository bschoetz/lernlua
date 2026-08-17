-- Unit 10: Erz-Rate-Spiel — mit allen Bonus-Quests:
-- 5 Runden, mehr Erze, Spielername, Spezial-Glückwunsch bei perfektem Treffer

local erze = {"Kohle", "Eisen", "Gold", "Diamant", "Smaragd", "Lapislazuli", "Redstone", "Kupfer"}
local tiefen = {50, 30, 10, -50, -16, 0, -32, 45}

print("=== ERZ-TIEFEN-QUIZ ===")
print("Wie heißt Du, Bergmann?")
local name = io.read()
print("Hallo " .. name .. "! Auf welcher Y-Koordinate findet man welches Erz?")
print("")

local punkte = 0
local runden = 5

for runde = 1, runden do
  print("--- Runde " .. runde .. " von " .. runden .. " ---")
  local nummer = math.random(1, #erze)
  local erz = erze[nummer]
  local tiefe = tiefen[nummer]

  print("Auf welcher Y-Koordinate findet man " .. erz .. "?")
  local versuch = tonumber(io.read())
  local differenz = math.abs(versuch - tiefe)

  if differenz == 0 then
    print("🎯 PERFEKT, " .. name .. "! Volltreffer bei Y=" .. tiefe .. "! +3 Punkte")
    punkte = punkte + 3
  elseif differenz <= 10 then
    print("🟢 Sehr nah! +2 Punkte (Richtig: Y=" .. tiefe .. ")")
    punkte = punkte + 2
  elseif differenz <= 30 then
    print("🟡 Okay. +1 Punkt (Richtig: Y=" .. tiefe .. ")")
    punkte = punkte + 1
  else
    print("🔴 Daneben. (Richtig: Y=" .. tiefe .. ")")
  end
  print("")
end

local maximum = runden * 3
print("=== ERGEBNIS ===")
print(name .. ", Du hast " .. punkte .. " von " .. maximum .. " möglichen Punkten erreicht.")

if punkte >= maximum - 2 then
  print("🏆 Erz-Meister!")
elseif punkte >= maximum // 2 then
  print("⛏️ Solider Bergmann.")
else
  print("📚 Übung macht den Meister!")
end
