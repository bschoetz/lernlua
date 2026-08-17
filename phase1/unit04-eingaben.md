# ⌨️ Unit 4: Chat mit dem Spieler — `io.read`

### Was lernen wir?
Bisher hat das Programm nur geredet. Jetzt soll es **zuhören**. Mit `io.read()` wartet das Programm, bis Du etwas ins Terminal eintippst und Enter drückst.

### Beispiel
```lua
print("Wie heißt Du?")
local name = io.read()
print("Willkommen in der Welt, " .. name .. "!")
```

Wenn Du das mit `lua datei.lua` startest, bleibt das Programm stehen und wartet — der Cursor blinkt im Terminal. Tippe Deine Antwort und drücke Enter.

### Zwei Sorten von Dingen: Schilder und Zahlen
In Lua gibt es (unter anderem) zwei Sorten von Dingen:

- **Echte Zahlen** — mit denen kann man rechnen: `5`, `42`, `2.5`
- **Text** — Buchstaben, wie auf ein **Schild** gemalt: `"Hallo"`, `"Steve"`

Die Anführungszeichen kennst Du seit Unit 1 — sie sind sozusagen das Schild drumherum. Und jetzt kommt's: `"5"` ist **nicht** die Zahl 5. Es ist ein Schild, auf das jemand eine 5 gemalt hat!

**Alles, was Du mit `io.read()` eintippst, kommt als Schild an.** Auch wenn Du `12` tippst — das Programm bekommt ein Schild mit "12" drauf, keine echte Zahl.

### 🧪 Experiment: Der kaputte Zahlen-Addierer
Glaubst Du nicht? Tippe das ab und probier es aus:

```lua
print("Erste Zahl?")
local a = io.read()
print("Zweite Zahl?")
local b = io.read()
print("Ergebnis: " .. a .. b)
```

Gib `3` und `4` ein. Was kommt raus? **34** statt 7! 😄

Das Programm hat nicht gerechnet — es hat die beiden Schilder einfach **aneinandergenagelt** (das machen die zwei Punkte `..` ja: zusammenkleben). Aus dem Schild "3" und dem Schild "4" wird das Schild "34".

### Der Schmelzofen: `tonumber`
Wie kommen wir vom Schild zur echten Zahl? Mit `tonumber(...)` — das ist wie der **Ofen** in Minecraft: Eisenerz rein, Eisenbarren raus. Hier: Schild rein, echte Zahl raus.

```lua
local schild = "12"          -- ein Schild mit "12" drauf
local zahl = tonumber(schild)  -- geschmolzen: die echte Zahl 12
print(zahl + 1)              -- 13 - jetzt kann man rechnen!
```

> ⚠️ **Was passiert mit Unschmelzbarem?** Wenn Du etwas in den Ofen legst, das keine Zahl ist — `tonumber("Hallo")` — kommt **nichts** raus (Lua nennt das `nil`). Damit kann man dann natürlich auch nicht rechnen.

> 💡 **Ehrlich gesagt:** Lua ist manchmal schlau und rät richtig — `"12" + 1` funktioniert sogar, Lua schmilzt das Schild heimlich selbst. Aber verlass Dich **nicht** darauf! Beim Zusammenkleben hast Du gerade gesehen, dass es schiefgeht — und beim Vergleichen (kommt in Unit 5) geht es garantiert schief: Für Lua ist das Schild `"12"` niemals gleich der Zahl `12`. Profi-Regel: **Schilder mit Zahlen drauf immer erst schmelzen.**

> 🔍 **Detektiv-Trick:** Mit `print(type(irgendwas))` verrät Dir Lua die Sorte — `string` heißt Schild (Text), `number` heißt echte Zahl. Probier mal `print(type("5"))` und `print(type(5))`.

### 🎯 Quest 4.1: Der Begrüßungs-Bot
Schreibe ein Programm:
1. Fragt nach dem Spielernamen
2. Fragt nach dem Lieblings-Mob
3. Antwortet: "Hallo NAME, MOB sind auch meine Favoriten!"

(Hier ist alles Text — kein Schmelzen nötig.)

### 🎯 Quest 4.2: Repariere den Addierer
Nimm den kaputten Zahlen-Addierer aus dem Experiment und **repariere ihn mit `tonumber`**, sodass bei `3` und `4` wirklich `7` rauskommt. Teste auch andere Zahlen!

### 🏆 Bonus-Quest: XP-Rechner
Frage nach dem aktuellen Level und dem Ziel-Level des Spielers. Gib aus, wie viele Level noch fehlen. Vergiss den Schmelzofen nicht!

---
⬅️ [Unit 3](unit03-rechnen.md) · [Übersicht](README.md) · ➡️ [Unit 5: if und else](unit05-if-else.md)
