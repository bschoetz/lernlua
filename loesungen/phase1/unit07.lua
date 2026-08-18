-- Quest 7.1: Repariere die Endlos-Schleife
local herzen = 10

while herzen > 0 do
  print("Aua!")
  herzen = herzen - 1          -- die Reparatur: irgendwann wird die Frage falsch
  print("Noch " .. herzen .. " Herzen")
end

print("Umgefallen!")

-- Bonus-Quest: Der Zeitraffer
print("")
local tag = 1
while tag <= 7 do
  print("Tag " .. tag .. " bricht an")
  tag = tag + 1
end
print("Eine ganze Minecraft-Woche geschafft!")
