# 🪄 Unit 32: Items mit eigener Aktion — `on_use`

### Was lernen wir?
Bisher haben Items beim Klicken nur Essens-Heilung gemacht. Jetzt schreiben wir eigene Aktionen.

```lua
core.register_craftitem("meinemod:teleportstab", {
  description = "Teleportstab",
  inventory_image = "meinemod_teleportstab.png",
  on_use = function(itemstack, user, pointed_thing)
    local pos = user:get_pos()
    pos.y = pos.y + 10
    user:set_pos(pos)
    return itemstack
  end,
})
```

Erklärung der Parameter:
- `itemstack` — der Item-Stack, der gerade benutzt wird
- `user` — der Spieler, der's benutzt
- `pointed_thing` — was der Spieler gerade anschaut (Block, Mob, oder nichts)

`user:get_pos()` holt die Position als Table `{x=..., y=..., z=...}`. Wir erhöhen `y` und setzen die neue Position.

### Partikel als visueller Effekt
```lua
core.register_craftitem("meinemod:feuerwerk", {
  description = "Mini-Feuerwerk",
  inventory_image = "meinemod_feuerwerk.png",
  on_use = function(itemstack, user, pointed_thing)
    local pos = user:get_pos()
    core.add_particlespawner({
      amount = 50,
      time = 1,
      minpos = {x = pos.x - 1, y = pos.y, z = pos.z - 1},
      maxpos = {x = pos.x + 1, y = pos.y + 3, z = pos.z + 1},
      minvel = {x = -1, y = 2, z = -1},
      maxvel = {x = 1, y = 4, z = 1},
      minexptime = 1,
      maxexptime = 2,
      minsize = 2,
      maxsize = 4,
      texture = "meinemod_zauberstaub.png",
    })
    return itemstack
  end,
})
```

Klingt kompliziert, ist aber nur eine Table: Wo sollen die Partikel starten, wie schnell, wie groß, welche Textur?

### 🎯 Aufgabe
Bring den Teleport-Stab zum Laufen. Probier verschiedene Höhen aus (5, 20, 100).

### 🏆 Bonus
Schreib einen "Rückwärts-Teleporter", der den Spieler **5 Blöcke runter** versetzt. Was passiert, wenn er im Erdreich landet?

---
⬅️ [Unit 31](unit31-craftitems.md) · [Übersicht](README.md) · ➡️ [Unit 33: Rezepte geformt](unit33-rezepte-geformt.md)
