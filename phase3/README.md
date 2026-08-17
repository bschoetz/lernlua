# 🌍 Phase 3 — Eigene Mod für Luanti / Mineclonia

In Phase 1 und 2 haben wir Lua **im Terminal** gelernt. Jetzt machen wir den großen Sprung: Wir bauen eine **echte Mod**, die in Luanti läuft — und zwar so, dass sie auch im Minecraft-ähnlichen Game **Mineclonia** funktioniert.

Phase 3 ist in **20 kleine Units** aufgeteilt. Jede Unit ist eine verdauliche Einheit von ca. 15–30 Minuten. Niemand muss alles an einem Tag schaffen — ruhig Tempo nach Lust und Laune.

> **Voraussetzung:** Phase 1 und 2 abgeschlossen. Du kennst Tables (auch mit Schlüsseln), Funktionen, Schleifen, `if` und Strings.

## 🤔 Was ist Luanti, was ist Mineclonia?

**Luanti** (früher "Minetest") ist eine Open-Source-Spiel-Engine für Voxel-Welten — also Welten aus Blöcken, wie Minecraft. Aber: Luanti ist nur die **Engine**. Das eigentliche Spiel kommt als sogenanntes "Game" obendrauf.

**Mineclonia** ist so ein Game für Luanti. Es ist ein sehr nah an Minecraft angelehntes Survival-Spiel mit Creepern, Diamanten, dem End, dem Nether und so weiter. Es ist kostenlos und läuft auf älteren Rechnern viel besser als das echte Minecraft.

**Mods** sind Erweiterungen, die wir in Lua schreiben. Sie können neue Blöcke, Items, Werkzeuge, Rezepte und Verhalten hinzufügen. Genau das werden wir tun.

## 🛠️ Setup — Luanti und Mineclonia installieren

1. **Luanti installieren** — von [luanti.org](https://www.luanti.org), unter Arch Linux einfach: `sudo pacman -S luanti`
2. Luanti starten → Reiter **"Content"** → **"Browse online content"**
3. Nach **"Mineclonia"** suchen und installieren
4. Im Hauptmenü unter **"Start Game"** → Mineclonia auswählen → eine Testwelt erstellen (Creative Mode ist gut zum Ausprobieren)
5. **Code-Editor**: Unser **VSCodium** aus Phase 1+2 — perfekt geeignet. Am besten den Mods-Ordner (siehe unten) direkt als Projektordner öffnen.

### Wo kommen die Mods hin?
In Luanti auf **"About"** → **"Open User Data Directory"** klicken. Im Datei-Manager öffnet sich ein Ordner (unter Linux meist `~/.minetest/` oder `~/.luanti/`). Darin liegt ein Unterordner **`mods`** — dort kommen unsere selbstgemachten Mods rein.

```
luanti-user-data/
├── games/
├── mods/          ← HIER kommen unsere Mods hin
│   └── ...
└── worlds/
```

## Die Units

| Unit | Thema |
|------|-------|
| [21](unit21-anatomie-einer-mod.md) | Was ist eine Mod? — Die Anatomie |
| [22](unit22-hallo-luanti.md) | Hello, Luanti! — Die allererste Mod |
| [23](unit23-chat-begruessung.md) | Etwas Sichtbares — Begrüßung im Chat |
| [24](unit24-local.md) | `local` in Mods — jetzt wird's ernst |
| [25](unit25-chat-befehle.md) | Eigene Chat-Befehle |
| [26](unit26-wuerfel-befehl.md) | Befehle mit Zufall — `/wuerfel` |
| [27](unit27-eigene-bloecke.md) | Eigene Blöcke — `register_node` |
| [28](unit28-texturen.md) | Pixel-Art — Eigene Texturen malen |
| [29](unit29-licht-und-sounds.md) | Licht, Sounds, Transparenz |
| [30](unit30-groups-und-drops.md) | Groups und Drops |
| [31](unit31-craftitems.md) | Eigene Items — Craftitems |
| [32](unit32-on-use.md) | Items mit eigener Aktion — `on_use` |
| [33](unit33-rezepte-geformt.md) | Crafting-Rezepte — geformt |
| [34](unit34-rezepte-ungeformt.md) | Crafting-Rezepte — ungeformt |
| [35](unit35-spieler-callbacks.md) | Callbacks — Spieler-Ereignisse |
| [36](unit36-block-callbacks.md) | Callbacks — Block-Ereignisse |
| [37](unit37-globalstep-abm.md) | Zeit und Wiederholung — `globalstep` und ABMs |
| [38](unit38-debugging.md) | Bugs finden — Logs lesen und debuggen |
| [39](unit39-magie-mod-teil1.md) | 🪄 Mega-Projekt Teil 1 — Die Magie-Mod |
| [40](unit40-magie-mod-teil2.md) | ✨ Mega-Projekt Teil 2 — Zauberstab, Funken, Chat |

## 🏅 Was Du nach Phase 3 kannst

- ✅ Aufbau einer Luanti-Mod (`mod.conf`, `init.lua`, `textures/`)
- ✅ Mineclonia-kompatibles Modding (`mcl_core`, `mcl_sounds`, Item-Namen)
- ✅ Eigene Blöcke mit Texturen, Sounds, Licht registrieren
- ✅ Groups, Drops, Craftitems, `on_use`-Aktionen
- ✅ Crafting-Rezepte (geformt und ungeformt)
- ✅ Chat-Befehle und Callbacks (Spieler- und Block-Ereignisse)
- ✅ Wiederkehrende Aktionen mit `globalstep` und ABMs
- ✅ Pixel-Art mit Piskel
- ✅ Bug-Suche über Logdatei und `core.log`
- ✅ **Eine eigene komplette Mod**, die Du Freunden zeigen kannst

➡️ Los geht's mit [Unit 21](unit21-anatomie-einer-mod.md)
