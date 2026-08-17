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

### Die Zeile auseinandergenommen
`for i = 1, 5 do` besteht aus vier Teilen:

| Teil | Bedeutung |
|------|-----------|
| `i` | der **Rundenzähler** |
| `1` | Startwert — hier geht's los |
| `5` | Zielwert — nach dieser Runde ist Schluss |
| `do` | "Los geht's!" |

Und das `end` am Schluss kennst Du schon: Truhe zu, Schleife fertig.

Stell Dir `i` wie einen Freund vor, der beim Spielen die **Runden mitzählt** und in jeder Runde die aktuelle Zahl ruft: In Runde 1 ist `i` gleich 1, in Runde 2 gleich 2 … und nach Runde 5 hört er auf.

### 🤔 Warum steht da kein `local` vor dem `i`?
Gute Frage! `local` ist der Stempel für Slots, die **Du selbst** anlegst. Den Rundenzähler legst aber nicht Du an — **die Schleife bringt ihren eigenen Zähler mit**. Im `for`-Rezept ist schon eingebaut: "Ich erschaffe mir einen Zähler, der gehört nur mir, und wenn ich fertig bin, nehme ich ihn wieder mit." Wie der rundenzählende Freund, der seinen eigenen Strichlisten-Zettel mitbringt und nach dem Spiel wieder einsteckt.

Beides kannst Du selbst nachprüfen:

```lua
for local i = 1, 5 do   -- Lua meckert sofort: Syntaxfehler!
```

Ein `local` ist dort sogar **verboten** — es wäre doppelt gemoppelt. Und:

```lua
for i = 1, 5 do
  print("Runde " .. i)
end
print(i)   -- nil - der Zähler ist nach der Schleife spurlos weg!
```

`nil` ("nichts") kennst Du schon vom Schmelzofen: Nach der Schleife existiert der Zähler einfach nicht mehr.

### 💡 Profi-Regel: Der Zähler heißt `i`
Theoretisch darfst Du den Rundenzähler nennen, wie Du willst (`runde`, `block`, …). Aber **Profis nehmen für einfache Zählschleifen fast immer `i`** — kurz für "Index". Das ist eine weltweite Absprache unter Programmierern: Wer irgendwo `for i = ...` liest, weiß sofort "aha, der Rundenzähler", ohne nachzudenken. Deshalb gewöhnen wir uns das gleich an.

(Und falls mal zwei Schleifen ineinanderstecken: Die zweite heißt dann `j`, die dritte `k` — auch das ist Absprache.)

### Mit dem Rundenzähler rechnen
Der eigentliche Trick: Du kannst `i` in jeder Runde **zum Rechnen benutzen**.

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

### Schrittweite: Zählen in Sprüngen
Aus der Schule kennst Du das Zählen in 2er-, 5er- und 10er-Schritten. Genau das kann die Schleife auch — mit einer **dritten Zahl**:

```lua
for i = 0, 20, 5 do
  print(i)
end
-- gibt aus: 0, 5, 10, 15, 20
```

Das ist das Zählen in 5er-Schritten: Die dritte Zahl sagt, **wie groß der Sprung** von Runde zu Runde ist. Lässt Du sie weg, springt die Schleife ganz normal in 1er-Schritten.

### Beispiel
```lua
print("Baue eine Mauer aus 10 Blöcken:")
for i = 1, 10 do
  print("Block " .. i .. " platziert")
end
print("Mauer fertig!")
```

### 🎯 Quest 6.1: Die Einmaleins-Maschine
Baue ein Programm, das Dir beim Einmaleins-Üben hilft:
1. Es fragt: "Welche Reihe willst Du üben?" (Schmelzofen aus Unit 4 nicht vergessen!)
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
⬅️ [Unit 5](unit05-if-else.md) · [Übersicht](README.md) · ➡️ [Unit 7: while-Schleifen](unit07-while-schleifen.md)
