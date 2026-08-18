# ⏰ Unit 37: Zeit und Wiederholung — `globalstep` und ABMs

## Was lernen wir?
Wie macht man Sachen, die **regelmäßig** passieren? Zwei Wege.

### globalstep — läuft die ganze Zeit
```lua
local timer = 0

core.register_globalstep(function(dtime)
  timer = timer + dtime
  if timer >= 5 then
    timer = 0
    core.chat_send_all("5 Sekunden vergangen!")
  end
end)
```

`dtime` ist die Zeit seit dem letzten Aufruf. `globalstep` läuft **mehrmals pro Sekunde**, deshalb sammeln wir mit `timer` an, bis 5 erreicht sind.

> ⚠️ Vorsicht: `globalstep` läuft sehr oft. Schreib keinen schweren Code rein!

### ABMs — Block-spezifische Wiederholung
ABM = "Active Block Modifier". Macht nur etwas bei bestimmten Block-Typen, viel effizienter.

```lua
core.register_abm({
  label = "Wunderblock funkelt",
  nodenames = {"meinemod:wunderblock"},
  interval = 5,    -- alle 5 Sekunden prüfen
  chance = 2,      -- mit 1:2 Wahrscheinlichkeit
  action = function(pos, node)
    core.add_particlespawner({
      amount = 10,
      time = 0.5,
      minpos = pos,
      maxpos = pos,
      minvel = {x = -0.5, y = 1, z = -0.5},
      maxvel = {x = 0.5, y = 2, z = 0.5},
      minexptime = 1,
      maxexptime = 2,
      texture = "meinemod_zauberstaub.png",
    })
  end,
})
```

Luanti geht alle Wunderblöcke in der Welt durch und entscheidet pro Block per Zufall, ob die Funktion läuft.

## ⚔️ Übungsquests

### 🎯 Aufgabe
Mach Deinen Wunderblock funkelnd: Alle paar Sekunden spuckt er Partikel aus.

### 🏆 Bonus
Schreib einen ABM, der **leuchtende Blöcke neben einem Wunderblock** automatisch zu Glas verwandelt. Tipp: `core.set_node(pos, {name = "mcl_core:glass"})` und der ABM-Parameter `neighbors`.

---
⬅️ [Unit 36](unit36-block-callbacks.md) · [Übersicht](README.md) · ➡️ [Unit 38: Debugging](unit38-debugging.md)
