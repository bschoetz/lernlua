# 🧰 Unit 9: Truhen mit vielen Slots — Tables (Listen)

### Was lernen wir?
Eine **Table** ist wie eine Truhe mit nummerierten Slots. In jedem Slot kann etwas anderes liegen.

```lua
local inventar = {"Schwert", "Spitzhacke", "Brot", "Fackel"}

print(inventar[1])  -- "Schwert"
print(inventar[2])  -- "Spitzhacke"
print(inventar[3])  -- "Brot"
print(inventar[4])  -- "Fackel"
```

> ⚠️ In Lua fängt die Zählung bei **1** an, nicht bei 0 wie in vielen anderen Sprachen!

### Anzahl der Einträge
Mit `#inventar` bekommst Du die Anzahl:
```lua
print("Du hast " .. #inventar .. " Items.")
```

### Alle Slots durchgehen
```lua
local inventar = {"Schwert", "Spitzhacke", "Brot", "Fackel"}

for i = 1, #inventar do
  print("Slot " .. i .. ": " .. inventar[i])
end
```

### Slots ändern und anhängen
```lua
inventar[2] = "Diamant-Spitzhacke"  -- Slot 2 überschreiben
table.insert(inventar, "Apfel")     -- Hinten anhängen
```

### 🎯 Quest 9.1: Dein Inventar
Lege eine Table mit 5 Items an, die Dein Spieler dabei hat. Gib sie als Liste aus:
```
=== INVENTAR ===
1. Diamantschwert
2. Eisenspitzhacke
...
```

### 🏆 Bonus-Quest: Mob-Zoo
Eine Liste mit 6 Mobs. Lass eine Schleife jeden Mob "Hallo!" sagen:
```
Zombie sagt: Hallo!
Skelett sagt: Hallo!
...
```

---
⬅️ [Unit 8](unit08-funktionen.md) · [Übersicht](README.md) · ➡️ [Unit 10: Mega-Projekt](unit10-erz-rate-spiel.md)
