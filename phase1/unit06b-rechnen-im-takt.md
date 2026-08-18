# 🧮 Unit 6½: Rechnen im Takt — mehr aus `for` herausholen

## Was lernen wir?
Der Rundenzähler `i` kann mehr als nur zählen: Du kannst in jeder Runde **mit ihm rechnen**. Das macht die Schleife erst richtig mächtig.

## Mit dem Rundenzähler rechnen
```lua
for i = 1, 5 do
  print(i .. " Zombies droppen " .. i * 2 .. " Fleisch")
end
```

```
1 Zombies droppen 2 Fleisch
2 Zombies droppen 4 Fleisch
3 Zombies droppen 6 Fleisch
...
```

In jeder Runde wird `i * 2` frisch ausgerechnet — mit dem aktuellen Wert des Zählers.

## Schrittweite: Zählen in Sprüngen
Aus der Schule kennst Du das Zählen in 2er-, 5er- und 10er-Schritten. Genau das kann die Schleife auch — mit einer **dritten Zahl**:

```lua
for i = 0, 20, 5 do
  print(i)
end
-- gibt aus: 0, 5, 10, 15, 20
```

Das ist das Zählen in 5er-Schritten: Die dritte Zahl sagt, **wie groß der Sprung** von Runde zu Runde ist. Lässt Du sie weg, springt die Schleife ganz normal in 1er-Schritten.

## ⚔️ Übungsquests

### 🎯 Quest 6½.1: Die Einmaleins-Maschine
Baue ein Programm, das Dir beim Einmaleins-Üben hilft:
1. Es fragt: "Welche Reihe willst Du üben?" (Schmelzofen aus Unit 4½ nicht vergessen!)
2. Dann druckt es die komplette Reihe von 1 bis 10:

```
Welche Reihe willst Du üben? 7
1 x 7 = 7
2 x 7 = 14
3 x 7 = 21
...
10 x 7 = 70
```

Tipp: In der Schleife brauchst Du `i`, die eingegebene Zahl und `i * zahl`.

### 🏆 Bonus-Quest: Rückwärts zählen
Lass eine Schleife von 10 bis 1 **rückwärts** zählen. Tipp: Die Schrittweite kann auch negativ sein — `-1` heißt "einen Schritt rückwärts springen".

---
⬅️ [Unit 6](unit06-for-schleifen.md) · [Übersicht](README.md) · ➡️ [Unit 7: while-Schleifen](unit07-while-schleifen.md)
