-- Quest 16.1: Inventar-Verwalter
local inventar = {}

for i = 1, 5 do
  print("Was willst Du aufheben? (" .. i .. "/5)")
  local item = io.read()
  table.insert(inventar, item)
end

print("")
print("=== INVENTAR ===")
for i = 1, #inventar do
  print(i .. ". " .. inventar[i])
end

-- Bonus-Quest: Item benutzen
print("")
print("Welche Slot-Nummer willst Du wegwerfen?")
local slot = tonumber(io.read())

if slot and slot >= 1 and slot <= #inventar then
  local item = inventar[slot]
  table.remove(inventar, slot)
  print(item .. " weggeworfen.")
else
  print("Diesen Slot gibt es nicht.")
end

print("")
print("=== INVENTAR ===")
for i = 1, #inventar do
  print(i .. ". " .. inventar[i])
end
