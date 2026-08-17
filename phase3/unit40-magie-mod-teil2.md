# ✨ Unit 40: Mega-Projekt Teil 2 — Zauberstab, Funken, Chat

### Was lernen wir?
Wir bringen den Zauberstab zum Leben: Beim Klicken schießt er Funken in Blickrichtung. Außerdem zählen wir Statistik und bauen einen Info-Befehl.

### Den Zauberstab erweitern
Ersetze die bisherige `register_craftitem`-Anweisung für den Zauberstab durch diese erweiterte Version:

```lua
-- Statistik: Pro Spieler die Nutzungen zählen
local zauber_zaehler = {}

core.register_craftitem("magie:zauberstab", {
  description = "Zauberstab",
  inventory_image = "magie_zauberstab.png",
  stack_max = 1,

  on_use = function(itemstack, user, pointed_thing)
    local pos = user:get_pos()
    local dir = user:get_look_dir()
    local name = user:get_player_name()

    -- Zähler hochzählen
    zauber_zaehler[name] = (zauber_zaehler[name] or 0) + 1

    -- Funken-Partikel in Blickrichtung
    core.add_particlespawner({
      amount = 80,
      time = 0.3,
      minpos = {x = pos.x, y = pos.y + 1.5, z = pos.z},
      maxpos = {x = pos.x, y = pos.y + 1.5, z = pos.z},
      minvel = {x = dir.x * 5 - 1, y = dir.y * 5 - 1, z = dir.z * 5 - 1},
      maxvel = {x = dir.x * 5 + 1, y = dir.y * 5 + 1, z = dir.z * 5 + 1},
      minexptime = 0.5,
      maxexptime = 1.5,
      minsize = 1,
      maxsize = 3,
      texture = "magie_staub.png",
      glow = 14,
    })

    return itemstack
  end,
})
```

Was passiert hier:
- `user:get_look_dir()` gibt einen 3D-Vektor `{x, y, z}` mit der Blickrichtung
- Wir starten die Partikel auf Augenhöhe (`pos.y + 1.5`)
- Die Geschwindigkeit (`minvel`/`maxvel`) ist die Blickrichtung mal 5, plus ein bisschen Streuung
- `glow = 14` macht die Partikel selbst leuchtend

### Begrüßung beim Beitritt
```lua
core.register_on_joinplayer(function(player)
  local name = player:get_player_name()
  core.chat_send_player(name,
    "Willkommen, " .. name .. "! Diese Welt enthält die Magie-Mod. " ..
    "Tippe /magie für Infos.")
end)
```

### Chat-Befehl `/magie`
```lua
core.register_chatcommand("magie", {
  description = "Zeigt Magie-Statistik",
  func = function(name, param)
    local zaubert = zauber_zaehler[name] or 0
    return true,
      "=== MAGIE-MOD ===\n" ..
      "Spieler: " .. name .. "\n" ..
      "Zauberstab-Nutzungen: " .. zaubert .. "\n" ..
      "Items: magie:erz, magie:staub, magie:kristall, magie:zauberstab"
  end,
})
```

### 🎯 Aufgabe
Alles einbauen, Welt neu starten, dann:
1. Beim Beitreten kommt die Begrüßung
2. Zauberstab nehmen → Klicken → Funken schießen
3. `/magie` → Statistik zeigt aktuelle Nutzungen

**Das war's. Du hast eine eigene Mod gebaut, die in Mineclonia funktioniert.** 🎉

### 🏆 Endgame-Bonus-Quests (für die ganz Mutigen)
- **Mehr Erze**: `magie:erz_rot`, `magie:erz_blau`, jedes mit eigener Textur und Drop
- **Aufladbarer Stab**: Der Stab funktioniert nur, wenn Magie-Staub im Inventar liegt — und verbraucht einen pro Schuss. Tipp: `user:get_inventory():contains_item("main", "magie:staub")` und `user:get_inventory():remove_item(...)`
- **Mob-Schaden**: Der Stab fügt dem angezielten Mob Schaden zu — recherchier `core.raycast` und `obj:punch`
- **Persistente Statistik**: `core.get_mod_storage()` lernen, damit der Zauber-Zähler nach Neustart noch da ist
- **Eigene Sounds**: `.ogg`-Datei in `sounds/` legen und mit `core.sound_play(...)` abspielen
- **Veröffentlichen**: Auf [content.luanti.org](https://content.luanti.org) hochladen, damit andere die Mod nutzen können

---

## 🏅 Geschafft — der ganze Kurs!

Vom "Hallo Overworld" zur echten Mineclonia-Mod. Checkliste im [Haupt-README](../README.md#-fortschritt) vervollständigen! 🎮✨

## 🚀 Wie es weitergehen könnte

- **Mobs**: Eigene Kreaturen mit Wegfindung, Aggression, Loot-Tabellen
- **Formspecs**: Eigene Menüs und Inventare im Spiel (z.B. ein Zaubertisch)
- **Mod-Speicher**: Daten persistent über `core.get_mod_storage()`
- **Welt-Generierung**: Eigene Erze automatisch in der Welt verteilen mit `core.register_ore`
- **Modulare Mods**: Code in mehrere Lua-Dateien aufteilen mit `dofile(...)`
- **ContentDB-Veröffentlichung**: Die eigene Mod der Welt zugänglich machen

⬅️ [Unit 39](unit39-magie-mod-teil1.md) · [Übersicht](README.md)
