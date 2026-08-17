-- Quest 8.1 + Bonus: Spielbare Welt mit schönem Prompt
local welt = {
  spawn = {
    name = "Spawn-Punkt",
    beschreibung = "Eine grüne Wiese. Hier begann alles.",
    ausgaenge = { nord = "dorf", ost = "mine" }
  },
  dorf = {
    name = "Dorf",
    beschreibung = "Ein paar Häuser, ein Brunnen.",
    ausgaenge = { sued = "spawn", ost = "portal" }
  },
  mine = {
    name = "Alte Mine",
    beschreibung = "Dunkle Gänge, irgendwo tropft Wasser.",
    ausgaenge = { west = "spawn" }
  },
  portal = {
    name = "Nether-Portal",
    beschreibung = "Lila Funken wabern im Obsidianrahmen.",
    ausgaenge = { west = "dorf" }
  }
}

local aktueller_raum = "spawn"

local function zeige_raum()
  local raum = welt[aktueller_raum]
  print("")
  print("=== " .. raum.name .. " ===")
  print(raum.beschreibung)
end

local function gehe(richtung)
  local raum = welt[aktueller_raum]
  if raum.ausgaenge[richtung] then
    aktueller_raum = raum.ausgaenge[richtung]
    zeige_raum()
  else
    print("⛔ Da führt kein Weg hin.")
  end
end

-- Bonus: mögliche Richtungen sammeln und anzeigen
local function moegliche_richtungen()
  local richtungen = {}
  for r, _ in pairs(welt[aktueller_raum].ausgaenge) do
    table.insert(richtungen, r)
  end
  return table.concat(richtungen, ", ")
end

zeige_raum()

while true do
  print("")
  print("Was tun? (möglich: " .. moegliche_richtungen() .. " / ende)")
  local eingabe = io.read()

  if eingabe == "ende" then
    print("Bis bald!")
    break
  else
    gehe(eingabe)
  end
end
