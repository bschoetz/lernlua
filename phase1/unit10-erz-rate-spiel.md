# 🎮 Unit 10: Mega-Projekt — Das Erz-Rate-Spiel

Jetzt kommt alles zusammen: Dein erstes richtiges Spiel! Der Computer denkt sich ein Erz aus, und der Spieler muss raten, auf welcher Y-Höhe man es findet.

Wir bauen es so, wie echte Spieleentwickler arbeiten: **in Ausbaustufen**. Jede Version ist ein fertiges, spielbares Spiel — erst wenn sie läuft, bauen wir die nächste. So siehst Du alle paar Minuten einen Erfolg statt am Ende einen Berg Tippfehler.

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

Schau Dir die **erste Tür** an: Was passiert, wenn der Spieler "Diamant" statt einer Zahl eintippt? Der Schmelzofen liefert `nil` ("nichts") — und die erste Tür fängt genau das ab. Wir nennen so eine Prüfung den **Türsteher**: Er steht ganz vorne und lässt nur echte Zahlen zu den anderen Türen durch. (Türen-Reihenfolge aus Unit 5!)

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
- Die `elseif`-Kaskade kennst Du aus Unit 5 — und die **Türen-Reihenfolge** zahlt sich aus: Wer die 0-Tür schafft, kommt gar nicht erst zur ≤10-Tür.
- Der **Türsteher steht jetzt außen herum**: Erst wenn er eine echte Zahl durchgelassen hat, wird im `else`-Teil der Abstand berechnet und bewertet. Ein `if` im `if` — zähl die `end`s: Jedes braucht seins!

**▶️ Speichern, starten, spielen!** Teste alle vier Türen: genau richtig, knapp daneben, weiter weg, völlig daneben — und den Türsteher mit Buchstaben.

### 🔍 Detektiv-Aufgabe
Warum steht der Türsteher **vor** der Abstand-Rechnung und ist nicht einfach eine weitere Tür in der Kaskade? Finde es heraus: Lösche ihn testweise (nur das äußere `if versuch == nil ... else` und ein `end`) und tippe Buchstaben ein. **Absturz!** Lies die Fehlermeldung: *"attempt to perform arithmetic on a nil value"* — die Zeile `math.abs(versuch - tiefe)` kann mit "nichts" nicht rechnen. Deshalb muss der Türsteher zuschlagen, **bevor** gerechnet wird. Bau ihn wieder ein!

---

## 🕹️ Version 3 — Der Computer würfelt

Immer nur Diamant ist langweilig. Jetzt soll der Computer **selbst ein Erz auswählen**.

### Neu: Der Würfel `math.random`
`math.random(1, 5)` gibt eine **zufällige** ganze Zahl von 1 bis 5 zurück — wie ein Würfelwurf, jedes Mal anders:

```lua
print(math.random(1, 6))   -- würfelt 1 bis 6
```

> 💡 In modernem Lua (ab 5.4, wir haben 5.5) ist der Würfel beim Programmstart schon automatisch "geschüttelt". Falls Du mal auf ein altes Lua triffst, das immer dieselben Zahlen liefert: einmal `math.randomseed(os.time())` an den Programmanfang schreiben.

### Neu: Die Zwillings-Truhen
Und jetzt der Clou der ganzen Unit. Wir bauen **zwei Truhen, die zusammengehören**:

| Slot | 1 | 2 | 3 | 4 | 5 |
|------|---|---|---|---|---|
| `erze` | Kohle | Eisen | Gold | Diamant | Smaragd |
| `tiefen` | 50 | 30 | 10 | −50 | −16 |

**Die Slot-Nummer ist das Band zwischen den Truhen:** Slot 3 der einen Truhe ist "Gold" — und Slot 3 der anderen ist die 10, also Golds Fundhöhe. Würfeln wir eine Slot-Nummer, lesen wir einfach **beide Truhen am selben Slot** aus:

```lua
local erze = {"Kohle", "Eisen", "Gold", "Diamant", "Smaragd"}
local tiefen = {50, 30, 10, -50, -16}

local nummer = math.random(1, #erze)
local erz = erze[nummer]
local tiefe = tiefen[nummer]
```

Würfelt der Computer eine 4, ist `erz` = "Diamant" und `tiefe` = −50. Würfelt er eine 1, ist `erz` = "Kohle" und `tiefe` = 50. Immer das passende Paar! (Und `#erze` als Würfel-Obergrenze kennst Du aus Unit 9: Kommen später mehr Erze in die Truhe, würfelt der Würfel automatisch mit.)

Ersetze in Deinem Spiel die Zeile `local tiefe = -50` durch die fünf Zeilen oben — und in der Frage `"Diamant"` durch `.. erz ..`:

```lua
print("Auf welcher Y-Höhe findet man " .. erz .. "?")
```

**▶️ Speichern, starten, mehrmals spielen!** Jedes Mal ein anderes Erz? Dann funktioniert der Würfel.

---

## 🕹️ Version 4 — Runden und Punkte

Ein richtiges Quiz hat mehrere Runden und einen Punktestand. Zwei Dinge kommen dazu:

1. **Alles in eine Schleife packen:** `for runde = 1, 3 do ... end` — drei Runden (Unit 6 lässt grüßen).
2. **Punkte sammeln:** `local punkte = 0` vor der Schleife, und in der Schleife z.B. `punkte = punkte + 2` — die Sammler-Zeile aus Unit 7! (Stapel raus, was drauf, Stapel zurück — genau wie beim Weizen-Wunder.)

Hier das komplette Spiel — **nicht abtippen, sondern Dein Spiel umbauen** und dann hiermit vergleichen:

```lua
local erze = {"Kohle", "Eisen", "Gold", "Diamant", "Smaragd"}
local tiefen = {50, 30, 10, -50, -16}

print("=== ERZ-TIEFEN-QUIZ ===")
print("Auf welcher Y-Höhe findet man welches Erz?")
print("")

local punkte = 0

for runde = 1, 3 do
  print("--- Runde " .. runde .. " ---")
  local nummer = math.random(1, #erze)
  local erz = erze[nummer]
  local tiefe = tiefen[nummer]

  print("Auf welcher Y-Höhe findet man " .. erz .. "?")
  local versuch = tonumber(io.read())

  if versuch == nil then
    print("ACHTUNG: Keine Zahl - die Runde ist leider futsch! (Richtig: Y=" .. tiefe .. ")")
  else
    local differenz = math.abs(versuch - tiefe)

    if differenz == 0 then
      print("*** PERFEKT! +3 Punkte")
      punkte = punkte + 3
    elseif differenz <= 10 then
      print("** Sehr nah! +2 Punkte (Richtig: Y=" .. tiefe .. ")")
      punkte = punkte + 2
    elseif differenz <= 30 then
      print("* Okay. +1 Punkt (Richtig: Y=" .. tiefe .. ")")
      punkte = punkte + 1
    else
      print("Daneben. (Richtig: Y=" .. tiefe .. ")")
    end
  end
  print("")
end

print("=== ERGEBNIS ===")
print("Du hast " .. punkte .. " von 9 möglichen Punkten erreicht.")

if punkte >= 7 then
  print("Erz-Meister!")
elseif punkte >= 4 then
  print("Solider Bergmann.")
else
  print("Übung macht den Meister!")
end
```

Drei kleine Handwerks-Dinge darin:
- Der **Türsteher** aus Version 2 ist mit drin: Keine Zahl = Runde verschenkt, aber das Spiel läuft weiter statt abzustürzen.
- `print("")` druckt eine **Leerzeile** — nur für die Übersicht, wie eine Absatz-Taste.
- Zähl die `end`s! Türsteher-`if`, Bewertungs-`if` und die `for`-Schleife brauchen je eins. Fehlt eins, meckert Lua mit *"'end' expected"* — dann von oben nach unten prüfen: Ist jede Truhe wieder zu?

**▶️ Speichern, starten, durchspielen!**

---

### 🎯 Quest 10.1: Spiele jede Version
Wichtigste Regel dieser Unit: **Bau erst weiter, wenn die aktuelle Version läuft.** Spiele jede Version mindestens einmal durch — und die fertige Version 4 ein paar Mal. Schaffst Du die 9 Punkte?

### 🏆 Version 5 — Deine Ideen
Das Spiel gehört jetzt Dir! Bau es weiter aus:
- **5 Runden statt 3** (vergiss nicht, die "von 9 Punkten" anzupassen — oder rechne das Maximum gleich aus: `runden * 3`)
- **Mehr Erze**: Lapislazuli, Redstone, Kupfer in die Zwillings-Truhen — dank `#erze` musst Du sonst nichts ändern!
- **Spielername**: Frag am Anfang nach dem Namen und benutze ihn in den Ausgaben
- **Spezial-Glückwunsch**: Wer perfekt rät, bekommt eine Extra-Nachricht

---

## 🏅 Geschafft!
Damit ist Phase 1 abgeschlossen — Zeit für einen Blick auf die [Checkliste](../README.md#-fortschritt). Du hast ein komplettes Spiel gebaut: Eingaben, Entscheidungen, Schleifen, Truhen und Zufall — alles aus zehn Units, in einem Programm. In [Phase 2](../phase2/README.md) kommen Tables mit Namen, String-Tricks und ein großes Text-Adventure.

⬅️ [Unit 9](unit09-tables.md) · [Übersicht](README.md) · ➡️ [Phase 2](../phase2/README.md)
