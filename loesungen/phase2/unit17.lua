-- Quest 17.1 + Bonus: Mini-Welt mit 4 Räumen und Items
local welt = {
  spawn = {
    name = "Spawn-Punkt",
    beschreibung = "Eine grüne Wiese. Hier begann alles.",
    ausgaenge = { nord = "dorf", ost = "mine" },
    items = { "Fackel" }
  },
  dorf = {
    name = "Dorf",
    beschreibung = "Ein paar Häuser, ein Brunnen, freundliche Dorfbewohner.",
    ausgaenge = { sued = "spawn", ost = "portal" },
    items = { "Brot", "Apfel" }
  },
  mine = {
    name = "Alte Mine",
    beschreibung = "Dunkle Gänge, irgendwo tropft Wasser.",
    ausgaenge = { west = "spawn" },
    items = { "Eisenspitzhacke" }
  },
  portal = {
    name = "Nether-Portal",
    beschreibung = "Lila Funken wabern im Obsidianrahmen.",
    ausgaenge = { west = "dorf" },
    items = {}
  }
}

local aktueller_raum = "spawn"

local function zeige_raum()
  local raum = welt[aktueller_raum]
  print("")
  print("=== " .. raum.name .. " ===")
  print(raum.beschreibung)
  if raum.items and #raum.items > 0 then
    print("Hier liegt: " .. table.concat(raum.items, ", "))
  end
  print("Ausgänge:")
  for richtung, ziel in pairs(raum.ausgaenge) do
    print("  " .. richtung .. " -> " .. welt[ziel].name)
  end
end

-- Alle Räume einmal durchtesten:
for raumname, _ in pairs(welt) do
  aktueller_raum = raumname
  zeige_raum()
end
