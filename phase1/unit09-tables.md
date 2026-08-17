# 🧰 Unit 9: Truhen mit vielen Slots — Tables (Listen)

### Was lernen wir?
Bisher konnte jeder Variablen-Slot genau **ein** Ding aufnehmen. Eine **Table** ist eine ganze **Truhe mit nummerierten Slots**:

| Slot 1 | Slot 2 | Slot 3 | Slot 4 |
|--------|--------|--------|--------|
| Schwert | Spitzhacke | Brot | Fackel |

```lua
local inventar = {"Schwert", "Spitzhacke", "Brot", "Fackel"}

print(inventar[1])  -- "Schwert"
print(inventar[2])  -- "Spitzhacke"
print(inventar[3])  -- "Brot"
print(inventar[4])  -- "Fackel"
```

Die geschweiften Klammern `{...}` bauen die Truhe und befüllen sie der Reihe nach. Und `inventar[1]` liest Du am besten laut vor: **"Truhe `inventar`, Slot 1"** — die eckigen Klammern sind die Slot-Nummer.

> 💡 **Lua zählt wie Du:** Der erste Slot ist Slot 1. (Viele andere Programmiersprachen fangen komischerweise bei 0 an — das muss Dich jetzt nicht kümmern, aber wundere Dich nicht, wenn Du es mal irgendwo hörst.)

### 🧪 Experiment: In den leeren Slot greifen
Was passiert wohl hier?

```lua
local inventar = {"Schwert", "Spitzhacke", "Brot", "Fackel"}
print(inventar[99])
```

**`nil`** — der alte Bekannte! Du kennst ihn vom Schmelzofen (Unit 4) und vom verschwundenen Rundenzähler (Unit 6): Wo nichts liegt, bekommst Du "nichts". Greifst Du in einen leeren Slot, meckert Lua nicht — es gibt Dir einfach `nil`. (Merk Dir das gut: In Phase 3 ist "aus Versehen in einen leeren Slot gegriffen" der häufigste Bug überhaupt.)

### Das Zähl-Zeichen `#`
`#inventar` fragt die Truhe: **"Wie viele Slots sind belegt?"**

```lua
print("Du hast " .. #inventar .. " Items.")   -- 4
```

### 🌟 Der große Moment: `for` trifft Truhe
Jetzt verbinden sich zwei Dinge, die Du schon kennst — **der Rundenzähler aus Unit 6 wird zur Slot-Nummer**:

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

### Slots ändern und anhängen
```lua
inventar[2] = "Diamant-Spitzhacke"  -- Item in Slot 2 austauschen
table.insert(inventar, "Apfel")     -- ins nächste freie Fach hinten legen
```

Slot überschreiben = altes Item raus, neues rein. `table.insert` = Item ans Ende anhängen, die Truhe wird um einen Slot voller (und `#inventar` zählt automatisch mit).

### 🎯 Quest 9.1: Dein Inventar
Baue eine Truhe mit 5 Items, die Dein Spieler dabei hat. Gib sie als nummerierte Liste aus:
```
=== INVENTAR ===
1. Diamantschwert
2. Eisenspitzhacke
...
```

Tipp: Genau dafür ist die "for trifft Truhe"-Zeile da.

### 🏆 Bonus-Quest: Mob-Zoo
Eine Truhe mit 6 Mobs. Lass eine Schleife jeden Mob "Hallo!" sagen:
```
Zombie sagt: Hallo!
Skelett sagt: Hallo!
...
```

---
⬅️ [Unit 8](unit08-funktionen.md) · [Übersicht](README.md) · ➡️ [Unit 10: Mega-Projekt](unit10-erz-rate-spiel.md)
