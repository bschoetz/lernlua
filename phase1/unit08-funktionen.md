# 🔨 Unit 8: Eigene Crafting-Rezepte — Funktionen

### Was lernen wir?
Eine **Funktion** ist ein eigenes Crafting-Rezept: Du schreibst es **einmal** in Dein Rezeptbuch — und kannst es danach so oft benutzen, wie Du willst.

```lua
local function gruss(name)
  print("Hallo " .. name .. ", willkommen!")
end

gruss("Steve")
gruss("Alex")
gruss("Herobrine")
```

Das spart Tipparbeit und macht den Code übersichtlicher. (Auch Funktionen bekommen ein `local` — gleiche Profi-Regel wie bei Variablen.)

### 🧪 Experiment: Das vergessene Craften
Ganz wichtig: **Ein Rezept ins Buch schreiben und ein Rezept benutzen sind zwei verschiedene Dinge!** Probier es aus — tippe *nur* das hier ab und starte es:

```lua
local function gruss(name)
  print("Hallo " .. name .. ", willkommen!")
end
```

Es passiert… **nichts!** 🤨 Warum? Du hast das Rezept nur ins Rezeptbuch geschrieben. Gecraftet hast Du noch nicht. Erst der **Aufruf** — `gruss("Steve")` unten dazuschreiben — lässt das Rezept wirklich ablaufen. Merke:

- `function gruss(name) ... end` = Rezept **aufschreiben** (passiert still)
- `gruss("Steve")` = Rezept **benutzen** (jetzt läuft der Code darin!)

### Die Lücke im Rezept: Parameter
Was ist dieses `name` in den Klammern? Das ist eine **Lücke im Rezept**. Beim Aufschreiben lässt Du sie offen — beim Benutzen wird sie gefüllt. In Zeitlupe, was bei `gruss("Steve")` passiert:

1. Lua schlägt das Rezept `gruss` im Buch nach
2. `"Steve"` wird in den Lücken-Slot `name` gelegt
3. Jetzt laufen die Zeilen im Rezept — und überall, wo `name` steht, liegt gerade `"Steve"`

Bei `gruss("Alex")` läuft dasselbe Rezept — nur liegt diesmal `"Alex"` in der Lücke. **Ein Rezept, tausend Möglichkeiten.**

Ein Rezept kann auch mehrere Lücken haben:

```lua
local function craft_block(material, anzahl)
  print("Du craftest " .. anzahl .. " " .. material .. "-Block/Blöcke.")
end

craft_block("Diamant", 3)
craft_block("Eisen", 5)
craft_block("Gold", 1)
```

Die Reihenfolge zählt: Das Erste landet in der ersten Lücke, das Zweite in der zweiten.

### Der Ausgabe-Slot: `return`
Denk an die Werkbank: Zutaten rein → Rezept läuft → **das fertige Item liegt im Ausgabe-Slot**. Genau das macht `return`:

```lua
local function herzen_in_leben(herzen)
  return herzen * 2
end

local leben = herzen_in_leben(10)
print("Du hast " .. leben .. " Lebenspunkte.")
```

`herzen_in_leben(10)` läuft ab, und im Ausgabe-Slot liegt `20`. Das Ergebnis kannst Du herausnehmen und in einen Variablen-Slot legen (`local leben = ...`) — oder direkt weiterbenutzen: `print(herzen_in_leben(10))`.

### ⚠️ Merkkasten: `print` oder `return`?
Die werden **ständig** verwechselt — hier der Unterschied:

- **`print`** hält ein Schild hoch: Der Text erscheint auf dem Bildschirm — aber danach ist er weg. Das Programm kann damit **nicht** weiterrechnen.
- **`return`** legt das Ergebnis in den **Ausgabe-Slot** der Werkbank: Der Spieler sieht erstmal nichts — aber das Programm kann das Item abholen und weiterverwenden.

Und: Sobald `return` ausgeführt wird, ist das Rezept **sofort fertig**. Zeilen, die in der Funktion danach kommen, laufen nicht mehr.

> 💡 **Reihenfolge zählt:** Das Rezept muss **über** dem ersten Aufruf stehen. Lua liest Deine Datei von oben nach unten und kennt nur Rezepte, die es schon gelesen hat.

### 🎯 Quest 8.1: Schaden-Rechner
Schreibe eine Funktion `schaden(waffe, treffer)` — zwei Lücken:
- Holzschwert → 4 Schaden pro Treffer
- Eisenschwert → 6 Schaden pro Treffer
- Diamantschwert → 7 Schaden pro Treffer
- In den Ausgabe-Slot (`return`) kommt: Schaden × Anzahl Treffer

Teste sie mit verschiedenen Werten — z.B. `print(schaden("Eisenschwert", 3))`. Tipp: In der Funktion brauchst Du `if`/`elseif` aus Unit 5.

### 🏆 Bonus-Quest: Mob-Begrüßer
Schreibe eine Funktion `mob_sagt(mob, text)`, die ausgibt:
```
[Creeper] sagt: Sssss...
[Zombie] sagt: Uaaaargh!
```

(Hier reicht `print` — es soll ja nur etwas angezeigt werden. Überleg kurz: Warum braucht diese Funktion kein `return`?)

---
⬅️ [Unit 7](unit07-while-schleifen.md) · [Übersicht](README.md) · ➡️ [Unit 9: Tables](unit09-tables.md)
