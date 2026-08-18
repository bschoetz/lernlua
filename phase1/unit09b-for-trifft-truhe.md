# 🌟 Unit 9½: `for` trifft Truhe

### Was lernen wir?
Heute verbinden sich zwei Dinge, die Du schon gut kennst — der Rundenzähler aus Unit 6 und die Truhe aus Unit 9. Diese Kombination wirst Du ab jetzt **ständig** benutzen, bis in die Luanti-Mods von Phase 3.

### Der große Moment: `for` trifft Truhe
**Der Rundenzähler wird zur Slot-Nummer:**

```lua
local inventar = {"Schwert", "Spitzhacke", "Brot", "Fackel"}

for i = 1, #inventar do
  print("Slot " .. i .. ": " .. inventar[i])
end
```

In Zeitlupe:

- **Runde 1:** `i` ist 1 → `inventar[1]` → "Schwert"
- **Runde 2:** `i` ist 2 → `inventar[2]` → "Spitzhacke"
- **Runde 3:** `i` ist 3 → `inventar[3]` → "Brot"
- **Runde 4:** `i` ist 4 → `inventar[4]` → "Fackel" — und `#inventar` ist 4, also Schluss.

`i` hat eine Doppelrolle: Es zählt die Runden **und** zeigt auf den passenden Slot. Und weil als Zielwert `#inventar` dasteht, passt sich die Schleife automatisch an — egal, wie voll die Truhe ist.

### Anhängen mit `table.insert`
```lua
table.insert(inventar, "Apfel")     -- ins nächste freie Fach hinten legen
```

`table.insert` legt das Item ans Ende — die Truhe wird um einen Slot voller, und `#inventar` zählt automatisch mit. Häng mal etwas an und lass die Schleife danach nochmal laufen: Sie druckt den neuen Slot einfach mit, ohne dass Du sie ändern musst!

### 🎯 Quest 9½.1: Dein Inventar
Nimm Deine 5-Item-Truhe aus Quest 9.1 und gib sie als nummerierte Liste aus:
```
=== INVENTAR ===
1. Diamantschwert
2. Eisenspitzhacke
...
```

Tipp: Genau dafür ist die "for trifft Truhe"-Zeile da. Danach: Häng mit `table.insert` ein sechstes Item an und starte neu — die Liste wächst von selbst mit.

### 🏆 Bonus-Quest: Mob-Zoo
Eine Truhe mit 6 Mobs. Lass eine Schleife jeden Mob "Hallo!" sagen:
```
Zombie sagt: Hallo!
Skelett sagt: Hallo!
...
```

---
⬅️ [Unit 9](unit09-tables.md) · [Übersicht](README.md) · ➡️ [Unit 10: Mega-Projekt](unit10-erz-rate-spiel.md)
