-- Quest 7.1: Diamanten sammeln
local diamanten = 0

while diamanten < 5 do
  print("Diamant gefunden? (j/n)")
  local antwort = io.read()
  if antwort == "j" then
    diamanten = diamanten + 1
    print("Du hast jetzt " .. diamanten .. " Diamanten.")
  else
    print("Weitersuchen!")
  end
end

print("Genug für eine Diamant-Spitzhacke!")

-- Bonus-Quest: Countdown zum Spawn
print("")
for i = 10, 0, -1 do
  print(i)
end
print("💥 BOOM — Creeper explodiert!")
