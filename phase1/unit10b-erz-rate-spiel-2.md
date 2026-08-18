# 🎲 Unit 10½: Mega-Projekt Teil 2 — Würfel, Runden, Punkte

Dein Spiel aus Unit 10 läuft — aber es fragt immer nur nach Diamant. Heute bekommt es die zwei Zutaten, die aus einem Quiz ein richtiges Spiel machen: **Zufall** und **Punkte**.

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
2. **Punkte sammeln:** `local punkte = 0` vor der Schleife, und in der Schleife z.B. `punkte = punkte + 2` — die Sammler-Zeile aus Unit 7! (Stapel raus, was drauf, Stapel zurück — genau wie beim Weizen-Wunder aus Unit 7½.)

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

### 🎯 Quest 10½.1: Spiele jede Version
Wichtigste Regel dieser Unit: **Bau erst weiter, wenn die aktuelle Version läuft.** Spiele jede Version mindestens einmal durch — und die fertige Version 4 ein paar Mal. Schaffst Du die 9 Punkte?

### 🏆 Version 5 — Deine Ideen
Das Spiel gehört jetzt Dir! Bau es weiter aus:
- **5 Runden statt 3** (vergiss nicht, die "von 9 Punkten" anzupassen — oder rechne das Maximum gleich aus: `runden * 3`)
- **Mehr Erze**: Lapislazuli, Redstone, Kupfer in die Zwillings-Truhen — dank `#erze` musst Du sonst nichts ändern!
- **Spielername**: Frag am Anfang nach dem Namen und benutze ihn in den Ausgaben
- **Spezial-Glückwunsch**: Wer perfekt rät, bekommt eine Extra-Nachricht

---

## 🏅 Geschafft!
Damit ist Phase 1 abgeschlossen — Zeit für einen Blick auf die [Checkliste](../README.md#-fortschritt). Du hast ein komplettes Spiel gebaut: Eingaben, Entscheidungen, Schleifen, Truhen und Zufall — alles selbst gebaut, in einem Programm. In [Phase 2](../phase2/README.md) kommen Tables mit Namen, String-Tricks und ein großes Text-Adventure.

⬅️ [Unit 10](unit10-erz-rate-spiel.md) · [Übersicht](README.md) · ➡️ [Phase 2](../phase2/README.md)
