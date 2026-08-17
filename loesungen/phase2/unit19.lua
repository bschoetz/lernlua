-- Quest 19.1 + Bonus: Schatzsuche mit "nimm X" und "werfe X"
local welt = {
  spawn = {
    name = "Spawn-Punkt",
    beschreibung = "Eine grüne Wiese.",
    ausgaenge = { nord = "dorf" },
    items = { "Fackel", "Stock" }
  },
  dorf = {
    name = "Dorf",
    beschreibung = "Ein paar Häuser, ein Brunnen.",
    ausgaenge = { sued = "spawn" },
    items = { "Brot", "Apfel" }
  }
}

local aktueller_raum = "spawn"
local spieler = { name = "Du", inventar = {} }

local function zeige_raum()
  local raum = welt[aktueller_raum]
  print("")
  print("=== " .. raum.name .. " ===")
  print(raum.beschreibung)
  if #raum.items > 0 then
    print("Hier liegt: " .. table.concat(raum.items, ", "))
  end
end

local function gehe(richtung)
  local raum = welt[aktueller_raum]
  if raum.ausgaenge[richtung] then
    aktueller_raum = raum.ausgaenge[richtung]
    zeige_raum()
  else
    print("Da führt kein Weg hin.")
  end
end

local function nimm(item_name)
  local raum = welt[aktueller_raum]
  for i = 1, #raum.items do
    if raum.items[i] == item_name then
      table.insert(spieler.inventar, item_name)
      table.remove(raum.items, i)
      print("Du hebst " .. item_name .. " auf.")
      return
    end
  end
  print("Kein '" .. item_name .. "' hier.")
end

-- Bonus: werfe X
local function werfe(item_name)
  for i = 1, #spieler.inventar do
    if spieler.inventar[i] == item_name then
      table.remove(spieler.inventar, i)
      table.insert(welt[aktueller_raum].items, item_name)
      print("Du wirfst " .. item_name .. " weg.")
      return
    end
  end
  print("Du hast kein '" .. item_name .. "'.")
end

local function zeige_inventar()
  if #spieler.inventar == 0 then
    print("Dein Inventar ist leer.")
  else
    print("=== Inventar ===")
    for i = 1, #spieler.inventar do
      print(i .. ". " .. spieler.inventar[i])
    end
  end
end

zeige_raum()

while true do
  print("")
  print("Was tun? (nord/sued, nimm X, werfe X, inventar, ende)")
  local eingabe = io.read()

  if eingabe == "ende" then
    break
  elseif eingabe == "inventar" then
    zeige_inventar()
  elseif string.sub(eingabe, 1, 5) == "nimm " then
    nimm(string.sub(eingabe, 6))
  elseif string.sub(eingabe, 1, 6) == "werfe " then
    werfe(string.sub(eingabe, 7))
  else
    gehe(eingabe)
  end
end
