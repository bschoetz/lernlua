# 🔁 Unit 6: Eine Mauer bauen — `for`-Schleifen

## Was lernen wir?
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

## Die Zeile auseinandergenommen
`for i = 1, 5 do` besteht aus vier Teilen:

| Teil | Bedeutung |
|------|-----------|
| `i` | der **Rundenzähler** |
| `1` | Startwert — hier geht's los |
| `5` | Zielwert — nach dieser Runde ist Schluss |
| `do` | "Los geht's!" |

Und das `end` am Schluss kennst Du schon: Truhe zu, Schleife fertig.

Stell Dir `i` wie einen Freund vor, der beim Spielen die **Runden mitzählt** und in jeder Runde die aktuelle Zahl ruft: In Runde 1 ist `i` gleich 1, in Runde 2 gleich 2 … und nach Runde 5 hört er auf.

> 💡 **Zwei Dinge zum Rundenzähler:** Erstens braucht er **kein `local`** — die Schleife bringt ihren eigenen Zähler mit und nimmt ihn am Ende wieder mit (probier nach der Schleife mal `print(i)` — es kommt `nil`, der Zähler ist spurlos weg!). Zweitens heißt er bei **Profis auf der ganzen Welt einfach `i`** — eine Absprache, wie beim Kleinschreiben der Namen: Wer `for i = ...` liest, weiß sofort "aha, der Rundenzähler".

## ⚔️ Übungsquests

### 🎯 Quest 6.1: Die Mauer
Baue eine Mauer aus 10 Blöcken:
```
Baue eine Mauer aus 10 Blöcken:
Block 1 platziert
Block 2 platziert
...
Block 10 platziert
Mauer fertig!
```

Achte darauf: Die erste und die letzte Zeile stehen **außerhalb** der Schleife — sie sollen ja nur einmal erscheinen. Danach: Mach die Mauer 25 Blöcke lang. Wie viele Zeichen musstest Du dafür ändern?

### 🏆 Bonus-Quest: Bis 100
Lass eine Schleife von 1 bis 100 zählen und alle Zahlen ausgeben. Eine Sekunde Tipparbeit — und stell Dir vor, Du hättest 100 `print`-Zeilen geschrieben!

---
⬅️ [Unit 5½: Der Türen-Gang](unit05b-tueren-gang.md) · [Übersicht](README.md) · ➡️ [Unit 6½: Rechnen im Takt](unit06b-rechnen-im-takt.md)
