# ⛏️ Unit 10: Groups und Drops — Was kommt beim Abbau raus?

### Was lernen wir?
**Groups** bestimmen, womit ein Block abgebaut werden kann. **Drop** bestimmt, was beim Abbau ins Inventar fällt.

### Die wichtigsten Groups in Mineclonia
| Group | Bedeutet |
|-------|----------|
| `cracky = 1..5` | mit Spitzhacke abbaubar (1 = sehr hart, 5 = weich) |
| `crumbly = 1..3` | mit Schaufel (Erde, Sand) |
| `choppy = 1..3` | mit Axt (Holz) |
| `snappy = 1..3` | mit Schere/Hand (Blätter, Stoff) |
| `handy = 1` | mit bloßer Hand abbaubar |

### Drop steuern
Standardmäßig kriegst Du den Block selbst zurück. Aber Du kannst es ändern:

```lua
core.register_node("meinemod:erz", {
  description = "Magisches Erz",
  tiles = {"meinemod_erz.png"},
  groups = {cracky = 2},
  drop = "meinemod:staub 3",  -- 3 Stück "Staub" beim Abbau
  sounds = mcl_sounds.node_sound_stone_defaults(),
})
```

`"meinemod:staub 3"` bedeutet: 3 Stück Staub. Aber `meinemod:staub` muss vorher registriert sein, sonst fällt nichts!

### Mehrere Drops mit Zufall
```lua
drop = {
  max_items = 2,
  items = {
    {items = {"meinemod:staub"}, rarity = 1},      -- immer 1 Staub
    {items = {"mcl_core:diamond"}, rarity = 10},   -- 1:10 Chance auf Diamant
  },
},
```

### 🎯 Aufgabe
Mach einen Block "Magisches Erz", der etwas droppen soll, das noch gar nicht existiert. Errate im Voraus: Was passiert beim Abbau? Probier's aus.

### 🏆 Bonus
Lass gar nichts droppen: `drop = ""`. Der Block ist dann nicht aufsammelbar — Profi-Trick für "Adventure"-Blöcke.

---
⬅️ [Unit 9](unit09-licht-und-sounds.md) · [Übersicht](README.md) · ➡️ [Unit 11: Craftitems](unit11-craftitems.md)
