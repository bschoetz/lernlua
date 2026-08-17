# 🐉 Unit 10: Mega-Projekt — Die Höhle des Enderdrachen

Jetzt wird Phase 2 abgeschlossen mit einem richtigen kleinen Adventure: Eine Welt mit 5 Räumen, Items, einem Schlüssel, einer verschlossenen Tür und einem End-Boss.

### Die Geschichte
- Du startest im **Dorf**
- Im **Wald** liegt ein **Schwert**
- In der **Mine** liegt ein **Schlüssel**
- Das **Portal** ist zu — Du brauchst den Schlüssel
- Im **End** wartet der **Enderdrache** — Du brauchst das Schwert, um zu gewinnen

### Vollständiger Code

```lua
-- Die Welt --
local welt = {
  dorf = {
    name = "Dorf",
    beschreibung = "Ein gemütliches Dorf. Pfade führen nach Norden in den Wald und nach Osten zur Mine.",
    ausgaenge = { nord = "wald", ost = "mine" },
    items = {}
  },
  wald = {
    name = "Eichenwald",
    beschreibung = "Hohe Bäume. Etwas glitzert am Boden.",
    ausgaenge = { sued = "dorf", ost = "portal" },
    items = {"Schwert"}
  },
  mine = {
    name = "Verlassene Mine",
    beschreibung = "Dunkel und feucht. Ein alter Schlüssel liegt auf einer Truhe.",
    ausgaenge = { west = "dorf", nord = "portal" },
    items = {"Schluessel"}
  },
  portal = {
    name = "End-Portal",
    beschreibung = "Ein verschlossenes Portal. Es führt ins End — wenn Du es nur öffnen könntest.",
    ausgaenge = { west = "wald", sued = "mine" },
    items = {}
  },
  end_ = {
    name = "Das End",
    beschreibung = "Eine schwarze Insel im Nichts. Der Enderdrache kreist über Dir.",
    ausgaenge = {},
    items = {}
  }
}

local aktueller_raum = "dorf"
local spieler = { inventar = {} }
local portal_offen = false
local gewonnen = false
local spiel_vorbei = false

-- Hilfsfunktionen --
local function enthaelt(liste, item)
  for i = 1, #liste do
    if liste[i] == item then return true end
  end
  return false
end

local function zeige_raum()
  local raum = welt[aktueller_raum]
  print("")
  print("=== " .. raum.name .. " ===")
  print(raum.beschreibung)
  if #raum.items > 0 then
    print("Hier liegt: " .. table.concat(raum.items, ", "))
  end
  local richtungen = {}
  for r, _ in pairs(raum.ausgaenge) do
    table.insert(richtungen, r)
  end
  if #richtungen > 0 then
    print("Ausgänge: " .. table.concat(richtungen, ", "))
  end
end

local function boss_kampf()
  print("")
  print("🐉 Der Enderdrache greift an!")
  if not enthaelt(spieler.inventar, "Schwert") then
    print("Ohne Waffe hast Du keine Chance...")
    print("💀 GAME OVER 💀")
    spiel_vorbei = true
    return
  end
  print("Du ziehst Dein Schwert!")
  local drachen_leben = 20
  while drachen_leben > 0 do
    local schaden = math.random(3, 7)
    drachen_leben = drachen_leben - schaden
    if drachen_leben < 0 then drachen_leben = 0 end
    print("⚔️  Du triffst mit " .. schaden .. " Schaden. (Drache: " .. drachen_leben .. " HP)")
  end
  print("")
  print("🎉🎉🎉 DU HAST DEN ENDERDRACHEN BESIEGT! 🎉🎉🎉")
  gewonnen = true
end

local function gehe(richtung)
  local raum = welt[aktueller_raum]
  local ziel = raum.ausgaenge[richtung]
  if not ziel then
    print("⛔ Da führt kein Weg hin.")
    return
  end
  if ziel == "end_" and not portal_offen then
    print("🔒 Das Portal ist verschlossen.")
    return
  end
  aktueller_raum = ziel
  zeige_raum()
  if aktueller_raum == "end_" then
    boss_kampf()
  end
end

local function nimm(item)
  local raum = welt[aktueller_raum]
  for i = 1, #raum.items do
    if raum.items[i] == item then
      table.insert(spieler.inventar, item)
      table.remove(raum.items, i)
      print("✅ Du hebst " .. item .. " auf.")
      return
    end
  end
  print("Kein '" .. item .. "' hier.")
end

local function zeige_inventar()
  if #spieler.inventar == 0 then
    print("Dein Inventar ist leer.")
  else
    print("=== Inventar ===")
    for i = 1, #spieler.inventar do
      print("  - " .. spieler.inventar[i])
    end
  end
end

local function benutze(item)
  if not enthaelt(spieler.inventar, item) then
    print("Du hast keinen '" .. item .. "'.")
    return
  end
  if item == "Schluessel" and aktueller_raum == "portal" then
    portal_offen = true
    welt.portal.ausgaenge.nord = "end_"
    print("🔓 Das Portal öffnet sich! Ein Weg nach Norden erscheint.")
  else
    print("Hier nicht zu gebrauchen.")
  end
end

-- Haupt-Schleife --
print("=== ADVENTURE: HÖHLE DES ENDERDRACHEN ===")
print("Befehle: nord/sued/ost/west, nimm X, benutze X, inventar, ende")
zeige_raum()

while not gewonnen and not spiel_vorbei do
  print("")
  io.write("> ")
  local eingabe = io.read()

  if eingabe == "ende" then
    print("Bis bald!")
    break
  elseif eingabe == "inventar" then
    zeige_inventar()
  elseif string.sub(eingabe, 1, 5) == "nimm " then
    nimm(string.sub(eingabe, 6))
  elseif string.sub(eingabe, 1, 8) == "benutze " then
    benutze(string.sub(eingabe, 9))
  else
    gehe(eingabe)
  end
end
```

> 💡 Neue Tricks: `table.concat(liste, ", ")` macht aus einer Liste einen Text mit Komma-Trennung. `io.write("> ")` schreibt ohne Zeilenumbruch — so entsteht der Eingabe-Prompt.

> 💡 Schau Dir die Variable `spiel_vorbei` an: Wer ohne Schwert ins End geht, verliert — und das Spiel **endet wirklich** (die Haupt-Schleife prüft beide Flaggen). Ohne diese Flagge würde der Spieler nach dem Game Over für immer im End festsitzen, denn das End hat keine Ausgänge!

> ⚠️ Beachte auch die **Reihenfolge der Funktionen**: `gehe` ruft `boss_kampf` auf — deshalb muss `boss_kampf` weiter oben in der Datei stehen. Bei `local`-Funktionen kennt Lua nur, was schon definiert wurde.

### 🎯 Quest 10.1: Durchspielen
Tippe das Programm ab (ruhig in mehreren Sitzungen) und spiele es durch — einmal **mit** und einmal absichtlich **ohne** Schwert. Verstehe jeden Teil — frag ruhig nach!

### 🏆 Bonus-Quests (Endgame)
- **Mehr Räume**: Füge einen Nether-Bereich hinzu (Portal → Nether → ...).
- **Mehr Items**: Ein Schild, das Schaden reduziert. Ein Heiltrank, der Herzen wiederherstellt.
- **Spieler-Herzen**: Der Drache schlägt auch zurück (würfle seinen Schaden!). Wer zuerst bei 0 ist, verliert — so wird der Bosskampf erst richtig spannend.
- **Geheimer Raum**: Ein Raum, der nur betreten werden kann, wenn man ein bestimmtes Wort eingibt (z.B. `crouch`).
- **Nochmal spielen**: Frage nach dem Ende "Nochmal? (j/n)" — dafür musst Du das ganze Spiel in eine Funktion packen.

---

## 🏅 Geschafft!
Phase 2 ist durch — Checkliste im [Haupt-README](../README.md#-fortschritt) abhaken. In [Phase 3](../phase3/README.md) wird es ernst: eine echte Mod für Luanti/Mineclonia.

⬅️ [Unit 9](unit09-items.md) · [Übersicht](README.md) · ➡️ [Phase 3](../phase3/README.md)
