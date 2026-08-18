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

**`nil`** — der alte Bekannte! Du kennst ihn vom Schmelzofen (Unit 4½) und vom verschwundenen Rundenzähler (Unit 6): Wo nichts liegt, bekommst Du "nichts". Greifst Du in einen leeren Slot, meckert Lua nicht — es gibt Dir einfach `nil`. (Merk Dir das gut: In Phase 3 ist "aus Versehen in einen leeren Slot gegriffen" der häufigste Bug überhaupt.)

### Das Zähl-Zeichen `#`
`#inventar` fragt die Truhe: **"Wie viele Slots sind belegt?"**

```lua
print("Du hast " .. #inventar .. " Items.")   -- 4
```

### Slots ändern
```lua
inventar[2] = "Diamant-Spitzhacke"  -- Item in Slot 2 austauschen
```

Slot überschreiben = altes Item raus, neues rein — genau wie bei normalen Variablen, nur eben in Slot Nummer 2 der Truhe.

### 🎯 Quest 9.1: Deine erste Truhe
1. Baue eine Truhe mit 5 Items, die Dein Spieler dabei hat
2. Gib Slot 1, Slot 3 und Slot 5 einzeln aus
3. Tausche das Item in Slot 2 gegen ein besseres aus und gib Slot 2 davor und danach aus
4. Zum Schluss: "Die Truhe hat X Items" — mit dem Zähl-Zeichen

### 🏆 Bonus-Quest: Der letzte Slot
Was gibt wohl `print(inventar[#inventar])` aus? Überleg erst, dann probier es. Warum funktioniert dieser Trick bei **jeder** Truhe, egal wie voll sie ist?

---
⬅️ [Unit 8½: Der Ausgabe-Slot](unit08b-ausgabe-slot.md) · [Übersicht](README.md) · ➡️ [Unit 9½: for trifft Truhe](unit09b-for-trifft-truhe.md)
