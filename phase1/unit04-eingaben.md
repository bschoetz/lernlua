# ⌨️ Unit 4: Chat mit dem Spieler — `io.read`

## Was lernen wir?
Bisher hat das Programm nur geredet. Jetzt soll es **zuhören**. Mit `io.read()` wartet das Programm, bis Du etwas ins Terminal eintippst und Enter drückst — genau eine Sache, und die kannst Du heute komplett.

### Beispielprogramm
```lua
print("Wie heißt Du?")
local name = io.read()
print("Willkommen in der Welt, " .. name .. "!")
```

Wenn Du dieses kleine Programm startest, bleibt das Programm stehen und wartet — der Cursor blinkt im Terminal. Tippe Deine Antwort und drücke dann Enter.

Was passiert hier im Programm? `io.read()` holt Deine Antwort ab, und `local name = ...` legt sie in einen Slot. Ab da ist Deine Antwort der Text der Variable `name`, die wir dann mit `..` zu einem Satz zusammenkleben und mit `print` anzeigen lassen.

![Comic: Lua und Sati lesen einen Textinput](unit04_ioread.jpg)

### Warum heißt das Ding `io.read`?
Das sind zwei englische Abkürzungen: `io` steht für **In und Out** — alles, was ins Programm **rein**geht und **raus**kommt. Und `read` heißt **lesen**. `io.read()` sagt also wörtlich: "Lies ein, was da getippt wird."

Und der Punkt dazwischen? `io` ist eine **Werkzeugkiste**, und der Punkt greift hinein: `io.read` bedeutet, dass wir aus der Werkzeugkiste `io` das Werkzeug `read` herausholen und benutzen. Lua sortiert seine Werkzeuge in solche Kisten, damit man sie wiederfindet — nur die allerwichtigsten wie `print` liegen ohne Kiste direkt griffbereit. Das Punkt-Muster wirst Du noch oft sehen, zum Beispiel bei der Mathe-Kiste: `math.random` würfelt Zufallszahlen (kommt in Unit 10½).

Was sonst noch in der `io`-Kiste liegt? Alles, womit ein Programm mit der Außenwelt redet — Tastatur, Bildschirm und sogar Dateien. Wir benutzen aber erstmal nur das Lese-Werkzeug `io.read`.

### 🧪 Experiment: Das Programm wartet auf Dich.
Starte das Beispiel und tippe erstmal … nichts. Das Programm läuft nicht weiter — es wartet geduldig auf Dich, bis Du Enter drückst. Und was passiert wohl, wenn Du als Namen etwas völlig Verrücktes eingibst, mit Leerzeichen und allem? Probier's aus — `io.read()` nimmt alles, was Du ihm gibst.

## ⚔️ Übungsquests

### 🎯 Quest 4.1: Der Begrüßungs-Bot
Schreibe ein Programm:
1. Fragt nach dem Spielernamen
2. Fragt nach dem Lieblings-Mob
3. Antwortet: "Hallo NAME, MOB sind auch meine Favoriten!"

### 🏆 Bonus-Quest: Der Interview-Bot
Erinnerst Du Dich an den Steckbrief aus Quest 2.1? Damals standen die Werte fest im Programm. Baue ihn jetzt als Interview: Frag nach Name, Welt und Werkzeug — und gib dann den Steckbrief mit den **echten Antworten** aus.

---
⬅️ [Unit 3½: Variablen-Namen](unit03b-variablennamen.md) · [Übersicht](README.md) · ➡️ [Unit 4½: Der Schmelzofen](unit04b-schmelzofen.md)
