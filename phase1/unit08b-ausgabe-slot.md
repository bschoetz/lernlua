# 📤 Unit 8½: Der Ausgabe-Slot — `return`

### Was lernen wir?
Deine Rezepte aus Unit 8 haben bisher nur Schilder hochgehalten (`print`). Heute lernen sie, ein **Ergebnis zurückzugeben**, mit dem das Programm weiterrechnen kann.

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

### 🧪 Experiment: Das unsichtbare Ergebnis
Tippe nur das ab:

```lua
local function herzen_in_leben(herzen)
  return herzen * 2
end

herzen_in_leben(10)
```

Es erscheint … nichts! Das Rezept ist gelaufen, die 20 lag im Ausgabe-Slot — aber niemand hat sie abgeholt. `return` zeigt eben nichts an. Erst `print(herzen_in_leben(10))` holt das Item ab und hält es hoch.

### 🎯 Quest 8½.1: Schaden-Rechner
Schreibe eine Funktion `schaden(waffe, treffer)` — zwei Lücken:
- Holzschwert → 4 Schaden pro Treffer
- Eisenschwert → 6 Schaden pro Treffer
- Diamantschwert → 7 Schaden pro Treffer
- In den Ausgabe-Slot (`return`) kommt: Schaden × Anzahl Treffer

Teste sie mit verschiedenen Werten — z.B. `print(schaden("Eisenschwert", 3))`. Tipp: In der Funktion brauchst Du `if`/`elseif` aus Unit 5½.

### 🏆 Bonus-Quest: XP-Rechner als Rezept
Erinnerst Du Dich an den XP-Rechner aus Unit 4½? Bau ihn als Funktion: `fehlende_level(aktuell, ziel)` legt die Differenz in den Ausgabe-Slot. Überleg vorher: Braucht diese Funktion `print` oder `return` — und warum?

---
⬅️ [Unit 8](unit08-funktionen.md) · [Übersicht](README.md) · ➡️ [Unit 9: Tables](unit09-tables.md)
