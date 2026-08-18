# ⏳ Unit 7: Warten auf den Tag — `while`-Schleifen

### Was lernen wir?
In Unit 6 hast Du Schleifen kennengelernt, bei denen Du **vorher weißt**, wie viele Runden laufen: eine Mauer aus 10 Blöcken → 10 Runden. Aber oft weißt Du das eben **nicht**:

| Situation | Wie viele Runden? | Schleife |
|-----------|-------------------|----------|
| Mauer aus 10 Blöcken bauen | 10 — weiß ich vorher | `for` |
| Einmaleins-Reihe bis 10 drucken | 10 — weiß ich vorher | `for` |
| Essen, solange ich hungrig bin | Keine Ahnung! | `while` |
| Graben, bis ich Diamanten finde | Keine Ahnung! | `while` |

**Merkregel:** `for` = "Ich weiß, wie oft." `while` = "Wiederhole, **solange** etwas gilt."

```lua
while BEDINGUNG do
  -- mach das hier wieder und wieder
end
```

### Die Bedingung kennst Du schon!
Nach `while` steht **genau dieselbe Sorte Frage wie beim `if`** aus Unit 5 — eine Frage, die Lua mit wahr oder falsch beantwortet (`hunger < 10`, `herzen > 0`, …).

Der Unterschied: `if` stellt die Frage **einmal**. `while` stellt sie **vor jeder Runde neu**:

```
Frage stellen -> wahr? -> Runde laufen lassen -> wieder Frage stellen -> ...
                falsch? -> fertig, weiter im Programm
```

### Beispiel in Zeitlupe
```lua
local hunger = 0

while hunger < 10 do
  hunger = hunger + 1
  print("Hunger jetzt: " .. hunger)
end

print("Bin satt!")
```

So läuft das ab:

- **Vor Runde 1:** Ist `0 < 10`? Wahr → Runde läuft. `hunger` wird 1.
- **Vor Runde 2:** Ist `1 < 10`? Wahr → Runde läuft. `hunger` wird 2.
- … so geht es weiter …
- **Nach Runde 10:** Ist `10 < 10`? **Falsch!** → Schleife fertig, es geht bei "Bin satt!" weiter.

### 🤔 Moment — `hunger = hunger + 1`?!
Als Mathe-Aufgabe wäre das Unsinn: Eine Zahl kann nicht gleich sich selbst plus 1 sein. Aber Du weißt es ja aus Unit 5: **Ein `=` ist keine Gleichung, sondern ein Befehl!**

Lua liest die Zeile von **rechts nach links**:
1. Schau nach, was im Slot `hunger` liegt (z.B. 3)
2. Zähle 1 dazu (macht 4)
3. Leg das Ergebnis **zurück in den Slot**

Wie beim Inventar: Stapel aus dem Slot nehmen, ein Item draufpacken, Stapel zurücklegen. Diese Zeile wirst Du noch tausendmal schreiben — sie ist der Trick, mit dem Schleifen etwas **ansammeln**.

### 🧪 Experiment: Bau absichtlich eine Endlos-Schleife!
Was passiert, wenn die Frage **niemals** falsch wird? Probier es aus — mit Absicht:

```lua
local herzen = 10
while herzen > 0 do
  print("Aua!")
end
```

Das Programm schreit endlos "Aua!", denn `herzen` bleibt immer 10 — die Frage `herzen > 0` ist für alle Ewigkeit wahr. **Jetzt drück Strg+C** — den Not-Aus-Knopf aus dem Setup. Geschafft? Glückwunsch, Du hast Deinen ersten Endlos-Bug überlebt. 😄

### 🎯 Quest 7.1: Repariere die Endlos-Schleife
In der Schleife muss `herzen = herzen - 1` stehen, damit die Frage irgendwann falsch wird. Bau es ein und lass zusätzlich in jeder Runde die übrigen Herzen ausgeben. Nach der Schleife: "Umgefallen!" — und diesmal hört das Programm von selbst auf.

Damit hast Du heute beides erlebt: den gefürchtetsten Schleifen-Fehler überhaupt — und seine Reparatur. Mehr braucht es für heute nicht.

### 🏆 Bonus-Quest: Der Zeitraffer
Lass einen Slot `tag` von 1 hochzählen, solange `tag <= 7`, und gib jede Runde "Tag X bricht an" aus. Danach: "Eine ganze Minecraft-Woche geschafft!"

---
⬅️ [Unit 6½: Rechnen im Takt](unit06b-rechnen-im-takt.md) · [Übersicht](README.md) · ➡️ [Unit 7½: Trainingslager](unit07b-trainingslager.md)
