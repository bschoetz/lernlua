# 🔁 Unit 6: Eine Mauer bauen — `for`-Schleifen

### Was lernen wir?
Wenn Du eine Mauer aus 50 Blöcken bauen willst, willst Du nicht 50 Mal denselben Befehl schreiben. Eine **Schleife** wiederholt Code automatisch.

```lua
for i = 1, 5 do
  print("Block Nummer " .. i)
end
```

Das gibt aus:
```
Block Nummer 1
Block Nummer 2
Block Nummer 3
Block Nummer 4
Block Nummer 5
```

Die Variable `i` zählt von `1` bis `5` hoch. Du kannst sie auch anders nennen. (Sie ist übrigens automatisch `local` — die Schleife räumt sie danach selbst wieder auf.)

### Mit Schrittweite
```lua
for i = 0, 20, 5 do
  print(i)
end
-- gibt aus: 0, 5, 10, 15, 20
```

Die dritte Zahl ist die **Schrittweite**.

### Beispiel
```lua
print("Baue eine Mauer aus 10 Blöcken:")
for i = 1, 10 do
  print("🟫 Block " .. i .. " platziert")
end
print("Mauer fertig!")
```

### 🎯 Quest 6.1: Crafting-Rezept-Tafel
Gib das kleine Einmaleins für Smaragde aus:
```
1 Smaragd = 1 Smaragd
2 Smaragde = 2 Smaragde
...
10 Smaragde = 10 Smaragde
```
(Bei der Zahl 9 gäbe es einen Smaragdblock — das ignorieren wir erst mal.)

### 🏆 Bonus-Quest: Rückwärts zählen
Lass eine Schleife von 10 bis 1 **rückwärts** zählen. Tipp: Die Schrittweite kann auch negativ sein (`-1`).

---
⬅️ [Unit 5](unit05-if-else.md) · [Übersicht](README.md) · ➡️ [Unit 7: while-Schleifen](unit07-while-schleifen.md)
