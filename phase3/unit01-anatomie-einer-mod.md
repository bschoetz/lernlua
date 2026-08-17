# 📦 Unit 1: Was ist eine Mod? — Die Anatomie

### Was lernen wir?
Jede Luanti-Mod ist nichts anderes als ein **Ordner** mit ein paar Dateien drin. Es ist kein magisches Programm und keine Spezial-Datei — nur Text, den Luanti liest.

Mindestens diese zwei Dateien braucht jede Mod:

- **`mod.conf`** — eine "Visitenkarte": Wie heißt die Mod? Was braucht sie zum Laufen?
- **`init.lua`** — der eigentliche Code, der beim Start ausgeführt wird

Optional kommen dazu:
- **`textures/`** — Ordner mit Bildern (PNG-Dateien, meistens 16×16 Pixel)
- **`sounds/`** — Ordner mit Tönen (OGG-Dateien)

Der **Ordnername** ist gleichzeitig der Name der Mod. Wenn der Ordner `meinemod` heißt, ist auch die Mod `meinemod`. Wichtig: nur Kleinbuchstaben, Zahlen und Unterstrich — keine Leerzeichen, keine Umlaute.

### 🎯 Aufgabe
Schau Dir die Liste von echten Mineclonia-Mod-Ordnern an (`mcl_core`, `mcl_sounds`, `mcl_doors`...). Du findest sie im User-Data-Verzeichnis unter `games/mineclonia/mods/`. Was fällt am Namensmuster auf? Warum machen Mod-Entwickler das wohl?

> 💡 Antwort: Mit dem Präfix `mcl_` weiß man sofort, dass es Mineclonia-Mods sind. Genauso werden wir später eigene Items mit `meinemod:irgendwas` benennen, damit es keine Verwechslungen gibt.

---
⬅️ [Übersicht](README.md) · ➡️ [Unit 2: Hello, Luanti!](unit02-hallo-luanti.md)
