# ⌨️ Unit 4: Chat mit dem Spieler — `io.read`

### Was lernen wir?
Bisher hat das Programm nur geredet. Jetzt soll es **zuhören**. Mit `io.read()` wartet das Programm, bis Du etwas ins Terminal eintippst und Enter drückst — genau eine Sache, und die kannst Du heute komplett.

### Beispiel
```lua
print("Wie heißt Du?")
local name = io.read()
print("Willkommen in der Welt, " .. name .. "!")
```

Wenn Du das mit `lua datei.lua` startest, bleibt das Programm stehen und wartet — der Cursor blinkt im Terminal. Tippe Deine Antwort und drücke Enter.

Was da passiert, kennst Du fast alles schon: `io.read()` holt Deine Antwort ab, und `local name = ...` legt sie in einen Slot (Unit 2). Ab da ist es eine ganz normale Variable — zusammenkleben mit `..`, ausgeben mit `print`.

### Warum heißt das Ding `io.read`?
Das sind zwei englische Abkürzungen: `io` steht für **In und Out** — alles, was ins Programm **rein**geht und **raus**kommt. Und `read` heißt **lesen**. `io.read()` sagt also wörtlich: "Lies ein, was da getippt wird."

Und der Punkt dazwischen? `io` ist eine **Werkzeugkiste**, und der Punkt greift hinein: `io.read` liest Du als "aus der Kiste `io` das Werkzeug `read`". Lua sortiert seine Werkzeuge in solche Kisten, damit man sie wiederfindet — nur die allerwichtigsten wie `print` liegen ohne Kiste direkt griffbereit. Das Punkt-Muster wirst Du noch oft sehen, zum Beispiel bei der Mathe-Kiste: `math.random` würfelt Zufallszahlen (kommt in Unit 10½).

Was sonst noch in der `io`-Kiste liegt? Alles, womit ein Programm mit der Außenwelt redet — Tastatur, Bildschirm und sogar Dateien. Wir benutzen erstmal nur das Lese-Werkzeug.

### 🧪 Experiment: Das Programm wartet wirklich
Starte das Beispiel und tippe erstmal … nichts. Das Programm läuft nicht weiter — es wartet geduldig auf Dich, bis Du Enter drückst. Und was passiert wohl, wenn Du als Namen etwas völlig Verrücktes eingibst, mit Leerzeichen und allem? Probier's aus — `io.read()` nimmt alles, was Du ihm gibst.

### 🎯 Quest 4.1: Der Begrüßungs-Bot
Schreibe ein Programm:
1. Fragt nach dem Spielernamen
2. Fragt nach dem Lieblings-Mob
3. Antwortet: "Hallo NAME, MOB sind auch meine Favoriten!"

### 🏆 Bonus-Quest: Der Interview-Bot
Erinnerst Du Dich an den Steckbrief aus Quest 2.1? Damals standen die Werte fest im Programm. Baue ihn jetzt als Interview: Frag nach Name, Welt und Werkzeug — und gib dann den Steckbrief mit den **echten Antworten** aus.

---
⬅️ [Unit 3½: Variablen-Namen](unit03b-variablennamen.md) · [Übersicht](README.md) · ➡️ [Unit 4½: Der Schmelzofen](unit04b-schmelzofen.md)
