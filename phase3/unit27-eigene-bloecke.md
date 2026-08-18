# 🧱 Unit 27: Eigene Blöcke — `register_node` Grundlagen

## Was lernen wir?
Jetzt wird's richtig spannend: Wir registrieren einen **eigenen Block**. In Luanti heißen Blöcke "Nodes".

```lua
core.register_node("meinemod:wunderblock", {
  description = "Wunderblock",
  tiles = {"meinemod_wunderblock.png"},
  groups = {cracky = 2},
  sounds = mcl_sounds.node_sound_stone_defaults(),
})
```

Was passiert hier:
- **`"meinemod:wunderblock"`** — der eindeutige Name. Format: `modname:irgendwas`. So weiß Luanti, welche Mod den Block bereitgestellt hat.
- **`description`** — der Name, der im Inventar angezeigt wird
- **`tiles`** — Liste der Texturen. Ein Eintrag = überall gleich. Sechs Einträge = jede Seite anders.
- **`groups`** — Eigenschaften. `cracky = 2` heißt: mit Spitzhacke abbaubar, mittlere Härte.
- **`sounds`** — Mineclonia bietet vorgefertigte Sound-Sets

### Erste eigene Mod anlegen
1. Ordner `meinemod/` im mods-Ordner
2. `mod.conf`:
   ```ini
   name = meinemod
   description = Eigene Blöcke und Items
   depends = mcl_core, mcl_sounds
   ```
3. `init.lua` mit dem Node-Code oben

> 💡 `depends = mcl_core, mcl_sounds` ist wichtig! Sonst weiß Luanti nicht, dass diese Mineclonia-Mods vor unserer geladen sein müssen — und `mcl_sounds.xxx` würde nicht existieren.

### Aber: Wir haben noch keine Textur!
Ohne PNG-Bild ist der Block "pink-schwarz" (das Luanti-"Fehlt"-Muster). Die Textur kommt in der nächsten Unit dran — erstmal mit Platzhalter starten.

## ⚔️ Übungsquests

### 🎯 Aufgabe
Lege die neue Mod an, schreib den Code, starte die Welt (Mod ankreuzen!). Im Creative-Inventar nach "Wunderblock" suchen — auch wenn er noch pink ist. Mit `/giveme meinemod:wunderblock` kannst Du ihn auch direkt holen.

### 🏆 Bonus
Schreib eine zweite `register_node`-Anweisung für einen "Wunderblock 2" mit anderem Namen.

---
⬅️ [Unit 26](unit26-wuerfel-befehl.md) · [Übersicht](README.md) · ➡️ [Unit 28: Texturen](unit28-texturen.md)
