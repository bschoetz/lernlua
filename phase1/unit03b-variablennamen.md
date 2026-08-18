# 🔤 Unit 3½: Wie heißt mein Slot? — Exkurs über Variablen-Namen

## Was lernen wir?
Kein neues Lua — dafür Antworten auf Fragen, die beim Schreiben von Quest 3.1 fast von allein auftauchen: Darf derselbe Name nochmal vorkommen? Groß oder klein? Und woran erkennt man überhaupt einen guten Namen?

### Darf derselbe Name nochmal vorkommen?
In Quest 3.1 hast Du einen Slot `bloecke` angelegt. Was passiert, wenn Du im selben Programm weiterschreibst und wieder `bloecke` benutzt?

```lua
local bloecke = 73 // 9
print(bloecke)

bloecke = 30 // 9
print(bloecke)
```

Kein Problem: erst 8, dann 3. Der Slot wird einfach **neu befüllt** — das alte Item fliegt raus, das neue kommt rein. Genau das hast Du in der Bonus-Quest von Unit 2 schon ausprobiert.

Und wenn Du aus Versehen nochmal `local bloecke = ...` schreibst? Auch kein Drama. Lua stellt dann heimlich einen **zweiten Slot mit demselben Etikett** daneben und benutzt ab da nur noch den neuen. Dein Programm läuft trotzdem richtig. Den feinen Unterschied zwischen "Slot neu befüllen" und "zweiten Slot danebenstellen" kannst Du erst ab Unit 8 wirklich sehen — bis dahin gilt die Merkregel aus Unit 3: `local` nur beim **ersten** Mal.

### 🧪 Experiment: Wenn der alte Wert weg ist
"Es läuft" heißt aber nicht immer "es stimmt". Tippe das ab:

```lua
local eisen = 73
local bloecke = eisen // 9

local gold = 30
bloecke = gold // 9

print("Bloecke aus Eisen: " .. bloecke)
print("Bloecke aus Gold: " .. bloecke)
```

Beide Zeilen zeigen 3! Die 8 Eisen-Blöcke sind **weg** — überschrieben, bevor sie ausgegeben wurden. Das Fiese daran: Es gibt keine Fehlermeldung. Das Programm tut genau, was Du gesagt hast — nur nicht, was Du wolltest. Solche Fehler sind schwerer zu finden als ein Absturz.

Deshalb die Regel: **Ein Slot, eine Bedeutung.** Willst Du Dir zwei Dinge merken, nimm zwei Slots — zum Beispiel `eisen_bloecke` und `gold_bloecke`. Der Unterstrich `_` ist dabei das Leerzeichen der Programmierer: Echte Leerzeichen sind in Namen verboten, also hängt man die Wörter mit `_` zusammen. So heißen bei uns ja auch schon `erz_pro_stunde` und `xp_pro_mob`.

### 🧪 Experiment: Groß oder klein?
Aus Unit 2 weißt Du: Groß- und Kleinschreibung zählt. Was gibt das hier aus?

```lua
local Eisenbloecke = 8
print(eisenbloecke)
```

`nil` — Luas Wort für "nichts"! Für Lua sind `Eisenbloecke` und `eisenbloecke` zwei **völlig verschiedene Namen**. Der kleingeschriebene Slot existiert nicht, also kommt `nil` heraus.

Lua wäre mit beiden Schreibweisen zufrieden. Aber stell Dir vor, Du müsstest bei jedem Slot raten: War es nun groß oder klein? Deshalb gibt es eine **Abmachung unter Programmierern** (keine Lua-Regel — Lua ist das egal): **Variablen-Namen schreibt man immer komplett klein.** Dann gibt es nichts zu raten.

### Warum eigentlich `bloecke` und nicht `blöcke`?
Auch das stand schon in Unit 2: keine Umlaute in Namen. Der Grund ist simpel — Lua kennt als Namens-Buchstaben nur a bis z (plus Zahlen und `_`). Bei `local blöcke = 5` steigt es sofort mit einer Fehlermeldung aus, denn mit dem ö kann es nichts anfangen. Also: ö wird zu oe, ä zu ae, ü zu ue, ß zu ss. In **Texten** (also zwischen Anführungszeichen) sind Umlaute natürlich erlaubt — `print("Blöcke")` funktioniert wunderbar.

### 🧪 Experiment: Namen, die schon vergeben sind
Zwei Sorten von Namen kannst Du nicht (oder besser nicht) benutzen. Probier beide aus!

**Sorte 1: Luas eigene Wörter.**

```lua
local end = 5
```

Das startet gar nicht erst: `<name> expected near 'end'`. Wörter wie `end`, `if`, `while`, `for` und auch `local` selbst sind Luas **eigenes Vokabular** — die sind fest vergeben, Punkt.

**Sorte 2: Namen von Befehlen.**

```lua
local print = 5
print("Hallo")
```

Zeile 1 geht durch — `print` ist nämlich gar nicht verboten, nur **belegt**! Aber Zeile 2 stürzt ab: `attempt to call a number value (local 'print')`. Du hast ein Schild mit einer 5 über den print-Befehl genagelt, und jetzt versucht Lua, die Zahl 5 "aufzurufen". Schau Dir die Fehlermeldung genau an: Sie verrät sogar den Schuldigen — `local 'print'`. Fehlermeldungen lesen lohnt sich fast immer!

Die Reparatur ist einfach: Nenn Deinen Slot anders, dann bleibt der Befehl heil.

## Woran erkennt man einen guten Namen?
Alle diese Namen erlaubt Lua — aber sie sind nicht gleich gut:

| Erlaubt, aber rätselhaft | Besser |
|--------------------------|--------|
| `a` | `eisenbarren` |
| `zahl1`, `zahl2` | `eisen`, `gold` |
| `EisenBloecke` | `eisen_bloecke` |

Der Test ist immer derselbe: **Wenn Du das Programm nächste Woche wieder öffnest — weißt Du dann noch, was in dem Slot liegt?** Bei `a` musst Du das halbe Programm lesen, bei `eisenbarren` steht die Antwort im Namen.

Eine Ausnahme wirst Du in Unit 6 kennenlernen: Der Runden-Zähler in Schleifen heißt bei allen Profis der Welt einfach nur `i`. Warum das okay ist, siehst Du dann dort.

## ⚔️ Übungsquests

### 🎯 Quest 3½.1: Der zweite Rohstoff
Erweitere Deinen Crafting-Rechner aus Quest 3.1:
- Du hast 73 Eisenbarren **und** 30 Goldbarren
- Rechne für beide aus: Wie viele Blöcke, wie viel Rest? (je 9 Barren = 1 Block)
- Gib **am Ende** alle vier Ergebnisse aus — erst dann kommt die Ausgabe!

Tipp: Vier Dinge merken heißt vier Variablen (Slots) mit vier Namen. Wer Eisen und Gold in dieselbe Variable legt, landet im Experiment von oben.

### 🏆 Bonus-Quest: Namens-Detektiv
Dieses Programm funktioniert — aber was tut es? Finde es heraus, indem Du es liest und laufen lässt:

```lua
local a = 30
local b = 4
local c = a // b
local d = a % b
print(c)
print(d)
```

Tipp: Es geht ums Verteilen. Wenn Du es herausgefunden hast: Benenne alle vier Variablen so um, dass man die Antwort **ohne Nachdenken** im Programm lesen kann — und spendiere den zwei `print`-Zeilen noch erklärenden Text dazu.

---
⬅️ [Unit 3](unit03-rechnen.md) · [Übersicht](README.md) · ➡️ [Unit 4: Eingaben](unit04-eingaben.md)
