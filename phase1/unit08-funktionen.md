# 🔨 Unit 8: Eigene Crafting-Rezepte — Funktionen

## Was lernen wir?
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

> 💡 **Reihenfolge zählt:** Das Rezept muss **über** dem ersten Aufruf stehen. Lua liest Deine Datei von oben nach unten und kennt nur Rezepte, die es schon gelesen hat.

## Die Lücke im Rezept: Parameter
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

## ⚔️ Übungsquests

### 🎯 Quest 8.1: Mob-Begrüßer
Schreibe eine Funktion `mob_sagt(mob, text)` mit zwei Lücken, die ausgibt:
```
[Creeper] sagt: Sssss...
[Zombie] sagt: Uaaaargh!
```

Ruf sie für mindestens drei verschiedene Mobs auf.

### 🏆 Bonus-Quest: Der Zeilen-Zähler
Ruf Deine Funktion für **fünf** Mobs auf — das ist pro Mob nur eine Zeile. Und jetzt zähl nach: Wie viele Zeilen hättest Du **ohne** das Rezept getippt? Genau dafür gibt es Funktionen.

---
⬅️ [Unit 7½: Trainingslager](unit07b-trainingslager.md) · [Übersicht](README.md) · ➡️ [Unit 8½: Der Ausgabe-Slot](unit08b-ausgabe-slot.md)
