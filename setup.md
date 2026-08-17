# 🛠️ Setup — Dein Crafting Table

Wir programmieren **lokal auf dem eigenen Rechner** — mit zwei Werkzeugen:

1. **VSCodium** — der Editor, in dem wir Code schreiben (zeigt Lua farbig an und hilft bei Tippfehlern)
2. **Lua im Terminal** — führt unsere Programme aus

## Installation (falls noch nicht geschehen)

Unter Arch Linux:

```bash
sudo pacman -S lua
```

VSCodium gibt es auf [vscodium.com](https://vscodium.com) (oder aus dem AUR: `vscodium-bin`).

Prüfen, ob Lua läuft — im Terminal:

```bash
lua -v
```

Es sollte etwas wie `Lua 5.5.1` erscheinen.

> 💡 In VSCodium lohnt sich eine Lua-Erweiterung (z.B. "Lua" von sumneko): Sie unterstreicht Fehler schon beim Tippen.

## Der Arbeits-Workflow

So läuft **jede** Übung ab:

1. **VSCodium öffnen** und den `lernlua`-Ordner öffnen (Datei → Ordner öffnen)
2. Eine neue Datei anlegen, z.B. `hallo.lua` — Endung immer `.lua`!
3. Code schreiben und **speichern** (Strg+S)
4. Das **Terminal in VSCodium öffnen**: Menü *Terminal → Neues Terminal* (öffnet sich unten)
5. Programm starten:

```bash
lua hallo.lua
```

Die Ausgabe erscheint direkt darunter. Code ändern → speichern → nochmal `lua hallo.lua`. (Tipp: Pfeiltaste ↑ im Terminal wiederholt den letzten Befehl.)

## Wichtige Terminal-Tricks

| Was | Wie |
|-----|-----|
| Programm läuft endlos / hängt | **Strg+C** drückt den Not-Aus |
| Letzten Befehl wiederholen | Pfeiltaste ↑, dann Enter |
| Lua als Taschenrechner | einfach `lua` tippen (ohne Dateiname) — beenden mit Strg+D |

> 💡 **Tipp:** Code aus den Units immer **selbst abtippen**, nicht kopieren. Tippfehler sind die besten Lehrer.

## Ordnung halten

Leg Dir für Deine Übungsdateien einen eigenen Ordner an, z.B. `meine-programme/` — eine Datei pro Quest (`quest-1-1.lua`, `quest-2-1.lua`, ...). So findest Du alles wieder.

➡️ Weiter zu [Phase 1](phase1/README.md)
