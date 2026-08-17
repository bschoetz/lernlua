# 🌟 Unit 9: Blöcke mit Charakter — Licht, Sounds, Transparenz

### Was lernen wir?
Blöcke können mehr als nur dasitzen. Sie können leuchten, durchsichtig sein, andere Geräusche machen.

### Licht abstrahlen
```lua
core.register_node("meinemod:leuchtstein", {
  description = "Leuchtstein",
  tiles = {"meinemod_leuchtstein.png"},
  groups = {cracky = 2},
  light_source = 14,
  sounds = mcl_sounds.node_sound_glass_defaults(),
})
```

`light_source = 14` ist Maximum (wie Glowstone). Werte 1–14.

### Sound-Sets in Mineclonia
```lua
mcl_sounds.node_sound_stone_defaults()    -- Stein
mcl_sounds.node_sound_wood_defaults()     -- Holz
mcl_sounds.node_sound_dirt_defaults()     -- Erde
mcl_sounds.node_sound_sand_defaults()     -- Sand
mcl_sounds.node_sound_gravel_defaults()   -- Kies
mcl_sounds.node_sound_glass_defaults()    -- Glas
mcl_sounds.node_sound_metal_defaults()    -- Metall
mcl_sounds.node_sound_leaves_defaults()   -- Blätter
```

### Praktische Eigenschaften
| Eigenschaft | Bedeutung |
|-------------|-----------|
| `light_source` | wie hell der Block leuchtet (0–14) |
| `walkable` | ob solide (`false` = wie Fackel) |
| `climbable` | ob man dran hochklettern kann (wie Leiter) |
| `drawtype` | Form: `"normal"`, `"glasslike"`, `"airlike"` etc. |
| `use_texture_alpha` | `"blend"` für transparente PNGs |
| `sunlight_propagates` | Sonnenlicht geht durch |

### 🎯 Aufgabe
Erweitere Deine Mod um einen leuchtenden Block. Bau eine kleine Höhle und beleuchte sie damit.

### 🏆 Bonus
"Sprungkristall": leuchtet, hat Glas-Sounds, ist nicht solide (`walkable = false`) und sieht wie Glas aus (`drawtype = "glasslike"`). Wirkt fast wie ein Hologramm.

---
⬅️ [Unit 8](unit08-texturen.md) · [Übersicht](README.md) · ➡️ [Unit 10: Groups und Drops](unit10-groups-und-drops.md)
