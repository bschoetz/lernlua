# 🎯 Unit 19: Mega-Projekt Teil 1 — Die "Magie-Mod" aufbauen

Jetzt bauen wir eine **vollständige, zusammenhängende Mod**: die Magie-Mod. Sie hat:

1. **Magisches Erz** — neuer Block
2. **Magie-Staub** — Item, fällt beim Erz-Abbau raus
3. **Magie-Kristall** — Block, leuchtet, aus Staub craftbar
4. **Zauberstab** — aus Kristall + Stock, schießt Funken
5. **Begrüßung** beim Beitritt
6. **Chat-Befehl** `/magie` für Statistik

Wir machen das in **zwei Units**: hier den Aufbau (Blöcke, Items, Rezepte), in Unit 20 die "Schmuckstücke" (Funken, Statistik, Chat).

### Ordnerstruktur
```
mods/
└── magie/
    ├── mod.conf
    ├── init.lua
    └── textures/
        ├── magie_erz.png
        ├── magie_staub.png
        ├── magie_kristall.png
        └── magie_zauberstab.png
```

### mod.conf
```ini
name = magie
description = Magische Blöcke, Items und Zauber
depends = mcl_core, mcl_sounds
```

### Texturen malen
Vier 16×16 Pixel-Art-Bilder in Piskel erstellen. Lass Deiner Fantasie freien Lauf — magisches Erz könnte z.B. lila Stein sein, Staub ein paar gelbe Punkte, Kristall ein blaues durchsichtiges Ding, Zauberstab ein brauner Stab mit Spitze.

### init.lua — Teil 1 (Blöcke und Items)

```lua
-- ===============================
--  MAGIE-MOD
-- ===============================

-- -----------------------
--  1. MAGISCHES ERZ
-- -----------------------
core.register_node("magie:erz", {
  description = "Magisches Erz",
  tiles = {"magie_erz.png"},
  groups = {cracky = 2},
  drop = "magie:staub 2",
  sounds = mcl_sounds.node_sound_stone_defaults(),
})

-- -----------------------
--  2. MAGIE-STAUB (Item)
-- -----------------------
core.register_craftitem("magie:staub", {
  description = "Magie-Staub",
  inventory_image = "magie_staub.png",
})

-- -----------------------
--  3. MAGIE-KRISTALL (leuchtender Block)
-- -----------------------
core.register_node("magie:kristall", {
  description = "Magie-Kristall",
  tiles = {"magie_kristall.png"},
  groups = {cracky = 2},
  light_source = 12,
  use_texture_alpha = "blend",
  drawtype = "glasslike",
  sunlight_propagates = true,
  sounds = mcl_sounds.node_sound_glass_defaults(),
})

-- -----------------------
--  4. ZAUBERSTAB (Item, einfache Variante)
-- -----------------------
core.register_craftitem("magie:zauberstab", {
  description = "Zauberstab",
  inventory_image = "magie_zauberstab.png",
  stack_max = 1,
})

-- -----------------------
--  5. CRAFTING-REZEPTE
-- -----------------------

-- Kristall: 4 Staub im Quadrat
core.register_craft({
  output = "magie:kristall",
  recipe = {
    {"magie:staub", "magie:staub"},
    {"magie:staub", "magie:staub"},
  },
})

-- Zauberstab: Kristall oben, Stock unten
core.register_craft({
  output = "magie:zauberstab",
  recipe = {
    {"magie:kristall"},
    {"mcl_core:stick"},
  },
})

-- Erz künstlich herstellen (Spaß-Rezept)
core.register_craft({
  output = "magie:erz",
  recipe = {
    {"magie:staub", "magie:staub",    "magie:staub"},
    {"magie:staub", "mcl_core:stone", "magie:staub"},
    {"magie:staub", "magie:staub",    "magie:staub"},
  },
})

core.log("action", "[magie] Magie-Mod (Teil 1) geladen!")
```

### 🎯 Aufgabe
Bring Teil 1 zum Laufen. Im Spiel testen:
- `/giveme magie:erz` → platzieren, abbauen → Staub kommt
- `/giveme magie:staub 4` → in Werkbank legen → Kristall craften
- Kristall + Stock → Zauberstab craften

Der Zauberstab macht noch nichts beim Klicken — das kommt in Unit 20.

### 🏆 Bonus
Füge ein zweites Erz hinzu (`magie:erz_blau`) mit anderer Textur, das einen anderen Staub-Typ droppt.

---
⬅️ [Unit 18](unit18-debugging.md) · [Übersicht](README.md) · ➡️ [Unit 20: Magie-Mod Teil 2](unit20-magie-mod-teil2.md)
