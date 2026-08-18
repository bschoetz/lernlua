# 🗝️ Unit 16: Items in Truhen — `table.insert` und `table.remove`

## Was lernen wir?
Du kannst eine Table während des Programms **wachsen und schrumpfen** lassen.

### Hinzufügen
```lua
local inventar = {"Schwert"}

table.insert(inventar, "Brot")
table.insert(inventar, "Fackel")
table.insert(inventar, "Diamant")

for i = 1, #inventar do
  print(i .. ". " .. inventar[i])
end
```

### Entfernen
```lua
local inventar = {"Schwert", "Brot", "Fackel", "Diamant"}

table.remove(inventar, 2)  -- entfernt "Brot"

for i = 1, #inventar do
  print(i .. ". " .. inventar[i])
end
```

`table.remove(t)` ohne Position entfernt das **letzte** Element. Und: Nach dem Entfernen rücken alle folgenden Items einen Slot nach vorne — keine Lücken.

### Prüfen, ob etwas drin ist
Es gibt keinen fertigen Befehl dafür — wir bauen ihn selbst:
```lua
local function enthaelt(liste, item)
  for i = 1, #liste do
    if liste[i] == item then
      return true
    end
  end
  return false
end

local inventar = {"Schwert", "Brot"}
print(enthaelt(inventar, "Brot"))     -- true
print(enthaelt(inventar, "Diamant"))  -- false
```

## ⚔️ Übungsquests

### 🎯 Quest 16.1: Inventar-Verwalter
Schreibe ein Programm:
1. Leeres Inventar
2. Schleife, die 5 Mal fragt: "Was willst Du aufheben?"
3. Jede Eingabe wird hinzugefügt
4. Am Ende: Inventar nummeriert ausgeben

### 🏆 Bonus-Quest: Item benutzen
Erweitere Quest 16.1: Nach dem Aufheben fragt das Programm: "Welche Slot-Nummer willst Du wegwerfen?" und entfernt das Item. Gib das fertige Inventar aus.

---
⬅️ [Unit 15](unit15-funktionen-teamwork.md) · [Übersicht](README.md) · ➡️ [Unit 17: Welt aus Räumen](unit17-raeume.md)
