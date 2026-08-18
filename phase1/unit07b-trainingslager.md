# ⛏️ Unit 7½: Trainingslager — sammeln mit `while`

## Was lernen wir?
Heute: **nichts Neues!** Du hast alles schon im Gürtel — `while` (Unit 7), `if` (Unit 5), `io.read` (Unit 4) und die Sammler-Zeile `x = x + 1`. Heute wird nur gebaut. Solche Trainings-Runden machen Profis übrigens ständig: Ein Werkzeug sitzt erst, wenn man es benutzt hat.

## ⚔️ Übungsquests

### 🎯 Quest 7½.1: Diamanten sammeln
Schreibe ein Programm:
- Start mit 0 Diamanten
- So lange weniger als 5 Diamanten, fragt es: "Diamant gefunden? (j/n)"
- Bei `j` wird ein Diamant dazugezählt und ausgegeben, wie viele Du hast
- Bei `n` sagt es "Weitersuchen!"
- Wenn 5 erreicht: "Genug für eine Diamant-Spitzhacke!"

Tipp: In der `while`-Schleife steckt ein `if` — zähl am Ende Deine `end`s: Schleife und `if` brauchen je eins.

### 🏆 Bonus-Quest: Das Weizen-Wunder
Du startest mit **1 Weizen**. Jede Ernte **verdoppelt** Deinen Vorrat. Wie oft musst Du ernten, bis Du **über 100** Weizen hast?

Schreibe ein Programm, das so lange verdoppelt (`weizen = weizen * 2`), wie `weizen < 100` ist — und dabei die Ernten mitzählt. Gib am Ende aus, wie viele Ernten es waren.

Schätze **vorher**: Wie oft wird es wohl dauern? Die Antwort überrascht fast jeden — genau deshalb ist das ein Fall für `while`: Man weiß die Rundenzahl eben nicht im Voraus!

---
⬅️ [Unit 7](unit07-while-schleifen.md) · [Übersicht](README.md) · ➡️ [Unit 8: Funktionen](unit08-funktionen.md)
