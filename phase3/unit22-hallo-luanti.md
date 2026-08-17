# 👋 Unit 22: Hello, Luanti! — Die allererste Mod

### Was lernen wir?
Wie sieht die kleinstmögliche Mod aus? Genau zwei Dateien — und sie tut ausnahmsweise gar nichts Sichtbares, schreibt nur eine Nachricht ins Log.

### Schritt für Schritt

**1.** Im Mods-Ordner einen neuen Ordner `hallowelt` anlegen (am besten in VSCodium: Mods-Ordner öffnen → Neuer Ordner).

**2.** Darin eine `mod.conf`:
```ini
name = hallowelt
description = Mein allererster Mod-Test
```

**3.** Eine `init.lua`:
```lua
core.log("action", "[hallowelt] Hallo aus meiner ersten Mod!")
```

**4.** In Luanti die Welt starten. Beim Welt-Auswählen vorher auf **"Select Mods"** klicken und die Mod ankreuzen, sonst wird sie nicht geladen!

### Wo sehe ich die Meldung?
Im User-Data-Verzeichnis liegt eine Datei `debug.txt` — da hinein schreibt Luanti alle Log-Meldungen. Öffne sie in VSCodium und suche (Strg+F) nach `[hallowelt]`.

> 💡 `core.log("action", "...")` ist wie das `print` aus Phase 1 — aber für Mods. Der Spieler sieht das nicht im Spiel; es ist nur für Entwickler.

### 🎯 Aufgabe
Bring die `hallowelt`-Mod zum Laufen und finde die Meldung in `debug.txt`.

### 🏆 Bonus
Schreibe zwei verschiedene Log-Meldungen direkt untereinander. Erscheinen beide in der Logdatei?

---
⬅️ [Unit 21](unit21-anatomie-einer-mod.md) · [Übersicht](README.md) · ➡️ [Unit 23: Begrüßung im Chat](unit23-chat-begruessung.md)
