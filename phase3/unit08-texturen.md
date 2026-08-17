# 🎨 Unit 8: Pixel-Art — Eigene Texturen malen

### Was lernen wir?
Damit der Block nicht pink-schwarz ist, brauchen wir eine **Textur**. Das ist ein PNG-Bild, normalerweise **16×16 Pixel** klein.

### Werkzeug: Piskel
Auf [piskelapp.com](https://www.piskelapp.com) im Browser kostenlos Pixel-Art malen. Kein Login nötig.

1. "Create Sprite" klicken
2. Größe auf 16×16 einstellen (Resize-Knopf rechts)
3. Mit der Maus pixelweise malen
4. Speichern: **"Export"** → **"PNG"** → Datei herunterladen

(Wer lieber lokal arbeitet: GIMP oder Krita können das auch — Piskel ist nur der einfachste Einstieg.)

### Datei richtig benennen und ablegen
Die Datei muss mit dem Mod-Namen anfangen:
- ✅ `meinemod_wunderblock.png`
- ❌ `wunderblock.png` (kollidiert mit anderen Mods)
- ❌ `MeineMod_Wunderblock.PNG` (Großbuchstaben können Probleme machen)

Sie kommt in den Ordner `textures/` der Mod:
```
meinemod/
├── mod.conf
├── init.lua
└── textures/
    └── meinemod_wunderblock.png
```

### 🎯 Aufgabe
Mal ein 16×16-Pixel-Bild für Deinen Wunderblock. Leg's in `textures/`. Welt neu starten und Block platzieren — die Textur sollte sichtbar sein.

### 🏆 Bonus
Mach einen Block mit 6 verschiedenen Texturen (oben, unten, vier Seiten):
```lua
tiles = {
  "meinemod_oben.png",
  "meinemod_unten.png",
  "meinemod_seite.png",
  "meinemod_seite.png",
  "meinemod_seite.png",
  "meinemod_seite.png",
},
```
Reihenfolge ist: **top, bottom, right, left, back, front** (also +Y, -Y, +X, -X, +Z, -Z).

---
⬅️ [Unit 7](unit07-eigene-bloecke.md) · [Übersicht](README.md) · ➡️ [Unit 9: Licht und Sounds](unit09-licht-und-sounds.md)
