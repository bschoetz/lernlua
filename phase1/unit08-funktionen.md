# 🔨 Unit 8: Eigene Crafting-Rezepte — Funktionen

### Was lernen wir?
Eine **Funktion** ist ein eigenes Rezept. Du gibst ihm einen Namen und sagst, was es tun soll. Danach kannst Du das Rezept immer wieder benutzen.

```lua
local function gruss(name)
  print("Hallo " .. name .. ", willkommen!")
end

gruss("Steve")
gruss("Alex")
gruss("Herobrine")
```

Das spart Tipparbeit und macht den Code übersichtlicher. (Auch Funktionen bekommen ein `local` — gleiche Profi-Regel wie bei Variablen.)

### Funktion mit Rückgabewert
Eine Funktion kann auch etwas zurückgeben — mit `return`:

```lua
local function herzen_in_leben(herzen)
  return herzen * 2
end

local leben = herzen_in_leben(10)
print("Du hast " .. leben .. " Lebenspunkte.")
```

### Beispiel mit mehreren Parametern
```lua
local function craft_block(material, anzahl)
  print("Du craftest " .. anzahl .. " " .. material .. "-Block/Blöcke.")
end

craft_block("Diamant", 3)
craft_block("Eisen", 5)
craft_block("Gold", 1)
```

### 🎯 Quest 8.1: Schaden-Rechner
Schreibe eine Funktion `schaden(waffe, treffer)`:
- Holzschwert → 4 Schaden pro Treffer
- Eisenschwert → 6 Schaden pro Treffer
- Diamantschwert → 7 Schaden pro Treffer
- Rückgabe: Schaden × Anzahl Treffer

Teste sie mit verschiedenen Werten.

### 🏆 Bonus-Quest: Mob-Begrüßer
Schreibe eine Funktion `mob_sagt(mob, text)`, die ausgibt:
```
[Creeper] sagt: Sssss...
[Zombie] sagt: Uaaaargh!
```

---
⬅️ [Unit 7](unit07-while-schleifen.md) · [Übersicht](README.md) · ➡️ [Unit 9: Tables](unit09-tables.md)
