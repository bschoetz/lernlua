# 🎮 Unit 10: Mega-Projekt Teil 1 — Das Erz-Rate-Spiel

Jetzt kommt alles zusammen: Dein erstes richtiges Spiel! Der Computer denkt sich ein Erz aus, und der Spieler muss raten, auf welcher Y-Höhe man es findet.

Wir bauen es so, wie echte Spieleentwickler arbeiten: **in Ausbaustufen**. Jede Version ist ein fertiges, spielbares Spiel — erst wenn sie läuft, bauen wir die nächste. So siehst Du alle paar Minuten einen Erfolg statt am Ende einen Berg Tippfehler.

Heute bauen wir Version 1 und 2 — in [Unit 10½](unit10b-erz-rate-spiel-2.md) lernt das Spiel dann würfeln.

---

## 🕹️ Version 1 — Es funktioniert!

Wir fangen klein an: **ein** festes Erz, **eine** Frage, richtig oder falsch. Alles darin kennst Du schon aus Unit 4 und 5:

```lua
print("=== ERZ-TIEFEN-QUIZ ===")
print("Auf welcher Y-Höhe findet man Diamant?")
local versuch = tonumber(io.read())

if versuch == nil then
  print("ACHTUNG: Das war keine Zahl! Probier's nochmal mit Ziffern.")
elseif versuch == -50 then
  print("Richtig! Diamanten findet man bei Y=-50.")
else
  print("Leider falsch - richtig wäre Y=-50.")
end
```

Schau Dir die **erste Tür** an: Was passiert, wenn der Spieler "Diamant" statt einer Zahl eintippt? Der Schmelzofen liefert `nil` ("nichts") — und die erste Tür fängt genau das ab. Wir nennen so eine Prüfung den **Türsteher**: Er steht ganz vorne und lässt nur echte Zahlen zu den anderen Türen durch. (Türen-Reihenfolge aus Unit 5½!)

**▶️ Speichern, starten, spielen!** Dreimal: einmal richtig raten, einmal falsch — und einmal absichtlich Buchstaben eingeben.

---

## 🕹️ Version 2 — Fairness: "nah dran" zählt

Nur "richtig oder falsch" ist gemein — wer −49 tippt, lag ja fast richtig! Wir bewerten jetzt, **wie nah** der Tipp an der Wahrheit liegt.

### Neu: Abstand messen mit `math.abs`
Denk an den **Zahlenstrahl** aus der Schule: Die Wahrheit liegt bei −50, Dein Tipp bei −20 — die beiden liegen **30 auseinander**. Diesen Abstand rechnet `versuch - tiefe` aus. Dabei kann auch etwas Negatives herauskommen (wenn Dein Tipp auf der anderen Seite liegt) — aber ein **Abstand** ist nie negativ! Deshalb gibt es `math.abs(...)`: Es schneidet das Minus einfach ab. Aus −30 wird 30.

```lua
print("=== ERZ-TIEFEN-QUIZ ===")
local tiefe = -50

print("Auf welcher Y-Höhe findet man Diamant?")
local versuch = tonumber(io.read())

if versuch == nil then
  print("ACHTUNG: Das war keine Zahl! Probier's nochmal mit Ziffern.")
else
  local differenz = math.abs(versuch - tiefe)

  if differenz == 0 then
    print("*** PERFEKT! Genau bei Y=" .. tiefe)
  elseif differenz <= 10 then
    print("** Sehr nah! Richtig wäre Y=" .. tiefe)
  elseif differenz <= 30 then
    print("* Nicht schlecht. Richtig wäre Y=" .. tiefe)
  else
    print("Daneben. Richtig wäre Y=" .. tiefe)
  end
end
```

Zwei Dinge stecken hier drin:
- Die `elseif`-Kaskade kennst Du aus Unit 5½ — und die **Türen-Reihenfolge** zahlt sich aus: Wer die 0-Tür schafft, kommt gar nicht erst zur ≤10-Tür.
- Der **Türsteher steht jetzt außen herum**: Erst wenn er eine echte Zahl durchgelassen hat, wird im `else`-Teil der Abstand berechnet und bewertet. Ein `if` im `if` — zähl die `end`s: Jedes braucht seins!

**▶️ Speichern, starten, spielen!** Teste alle vier Türen: genau richtig, knapp daneben, weiter weg, völlig daneben — und den Türsteher mit Buchstaben.

### 🔍 Detektiv-Aufgabe
Warum steht der Türsteher **vor** der Abstand-Rechnung und ist nicht einfach eine weitere Tür in der Kaskade? Finde es heraus: Lösche ihn testweise (nur das äußere `if versuch == nil ... else` und ein `end`) und tippe Buchstaben ein. **Absturz!** Lies die Fehlermeldung: *"attempt to perform arithmetic on a nil value"* — die Zeile `math.abs(versuch - tiefe)` kann mit "nichts" nicht rechnen. Deshalb muss der Türsteher zuschlagen, **bevor** gerechnet wird. Bau ihn wieder ein!

---

---

## ⚔️ Übungsquests

### 🎯 Quest 10.1: Spiele Version 1 und 2
Wichtigste Regel dieses Projekts: **Bau erst weiter, wenn die aktuelle Version läuft.** Spiele beide Versionen mehrmals durch und teste dabei alles: genau richtig, knapp daneben, weit daneben — und den Türsteher mit Buchstaben.

💾 **Speicherpunkt!** Du hast ein komplettes, faires Quiz gebaut — mit Türsteher, Bewertung und allem. Perfekter Moment für Feierabend. Das Würfeln kommt in [Unit 10½](unit10b-erz-rate-spiel-2.md).

---
⬅️ [Unit 9½: for trifft Truhe](unit09b-for-trifft-truhe.md) · [Übersicht](README.md) · ➡️ [Unit 10½: Würfel, Runden, Punkte](unit10b-erz-rate-spiel-2.md)
