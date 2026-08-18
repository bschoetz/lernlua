-- Quest 6½.1: Die Einmaleins-Maschine
print("Welche Reihe willst Du üben?")
local zahl = tonumber(io.read())   -- Schmelzofen: Schild -> echte Zahl

for i = 1, 10 do
  print(i .. " x " .. zahl .. " = " .. i * zahl)
end

-- Bonus-Quest: Rückwärts zählen
print("")
for i = 10, 1, -1 do
  print(i)
end
