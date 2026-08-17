# 🎮 lernlua — Lua lernen für Luanti-Modding

Mein Sohn und ich lernen Lua, um selber einen [Luanti](https://www.luanti.org)-Mod zu erstellen. Dabei hilft uns Claude.

Der Kurs ist im Minecraft-Stil aufgebaut: Jede Unit ist eine kleine **Quest** mit Erklärung, Beispiel und Aufgaben zum Selberprobieren. Wir arbeiten mit **VSCodium** und **Lua im Terminal** — kein Online-Dienst nötig.

## 🗺️ Der Weg

| Phase | Thema | Ergebnis |
|-------|-------|----------|
| [Phase 1](phase1/README.md) | Lua-Grundlagen (10 Units) | Ein eigenes Erz-Rate-Spiel |
| [Phase 2](phase2/README.md) | Fortgeschrittenes Lua (10 Units) | Ein Text-Adventure mit Räumen, Items und Boss |
| [Phase 3](phase3/README.md) | Luanti/Mineclonia-Modding (20 Units) | Eine echte, spielbare Magie-Mod |

**Zuerst lesen:** [Setup — Werkzeuge einrichten](setup.md)

## 📖 Kurs als HTML-Seite (neben dem Editor anzeigen)

Statt zu drucken: den ganzen Kurs als eine einzige HTML-Seite bauen und im Browser neben VSCodium öffnen —

```bash
python3 baue-kurs.py
xdg-open kurs.html
```

Die Seite hat eine Kapitel-Navigation links, Lua-Syntax-Highlighting, Dark Mode (folgt der System-Einstellung) und eine **anklickbare Fortschritts-Checkliste**, die sich die Häkchen im Browser merkt. Nach Änderungen an den Markdown-Dateien einfach das Skript neu laufen lassen.

## 📁 Struktur

```
lernlua/
├── setup.md          ← Werkzeuge: VSCodium, Lua, Terminal
├── phase1/           ← eine Datei pro Unit
├── phase2/
├── phase3/
└── loesungen/        ← Musterlösungen (erst selbst probieren!)
    ├── phase1/
    ├── phase2/
    └── phase3/       ← fertige Mods: hallowelt, meinemod, magie
```

## ✅ Fortschritt

### Phase 1 — Crafting mit Code
- [ ] Unit 1: Hallo Overworld! (`print`)
- [ ] Unit 2: Inventar-Slots (Variablen)
- [ ] Unit 3: Rechnen wie ein Redstone-Ingenieur (Operatoren, `local`)
- [ ] Unit 4: Chat mit dem Spieler (`io.read`)
- [ ] Unit 5: Türen mit Redstone (`if` / `else`)
- [ ] Unit 6: Eine Mauer bauen (`for`)
- [ ] Unit 7: Warten auf den Tag (`while`)
- [ ] Unit 8: Eigene Crafting-Rezepte (Funktionen)
- [ ] Unit 9: Truhen mit vielen Slots (Tables)
- [ ] Unit 10: 🎮 Mega-Projekt — Das Erz-Rate-Spiel

### Phase 2 — Vom Lehrling zum Abenteurer
- [ ] Unit 11: Beschriftete Truhen (Tables mit Schlüsseln)
- [ ] Unit 12: Schilder lesen (Strings)
- [ ] Unit 13: Logik-Gates (`and`, `or`, `not`)
- [ ] Unit 14: Würfel und Zufall (`math.random`)
- [ ] Unit 15: Funktionen, die zusammenarbeiten
- [ ] Unit 16: `table.insert` und `table.remove`
- [ ] Unit 17: Welt aus Räumen
- [ ] Unit 18: Bewegung in der Welt
- [ ] Unit 19: Items aufheben und benutzen
- [ ] Unit 20: 🐉 Mega-Projekt — Die Höhle des Enderdrachen

### Phase 3 — Eigene Mod für Luanti / Mineclonia
- [ ] Unit 21: Was ist eine Mod?
- [ ] Unit 22: Hello, Luanti!
- [ ] Unit 23: Begrüßung im Chat
- [ ] Unit 24: `local` in Mods — jetzt wird's ernst
- [ ] Unit 25: Eigene Chat-Befehle
- [ ] Unit 26: Befehle mit Zufall
- [ ] Unit 27: Eigene Blöcke (`register_node`)
- [ ] Unit 28: Pixel-Art — Eigene Texturen
- [ ] Unit 29: Licht, Sounds, Transparenz
- [ ] Unit 30: Groups und Drops
- [ ] Unit 31: Eigene Items (Craftitems)
- [ ] Unit 32: Items mit eigener Aktion (`on_use`)
- [ ] Unit 33: Crafting-Rezepte — geformt
- [ ] Unit 34: Crafting-Rezepte — ungeformt
- [ ] Unit 35: Callbacks — Spieler-Ereignisse
- [ ] Unit 36: Callbacks — Block-Ereignisse
- [ ] Unit 37: `globalstep` und ABMs
- [ ] Unit 38: Bugs finden — Logs und Debugging
- [ ] Unit 39: 🪄 Mega-Projekt Teil 1 — Die Magie-Mod
- [ ] Unit 40: ✨ Mega-Projekt Teil 2 — Zauberstab, Funken, Chat

---

*Viel Erfolg beim Coden! 🟩⛏️*
