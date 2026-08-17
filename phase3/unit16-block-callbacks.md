# 🧱 Unit 16: Callbacks für Blöcke

### Was lernen wir?
Es gibt auch Callbacks, die feuern, wenn **Blöcke** platziert oder abgebaut werden.

### Block wird platziert
```lua
core.register_on_placenode(function(pos, newnode, placer)
  if newnode.name == "meinemod:wunderblock" then
    local name = placer:get_player_name()
    core.chat_send_player(name, "🎉 Ein Wunderblock! Selten gesehen.")
  end
end)
```

- `pos` ist die Position als `{x, y, z}`
- `newnode.name` ist der technische Name des Blocks
- `placer` ist der Spieler, der ihn platziert hat

### Block wird abgebaut
```lua
core.register_on_dignode(function(pos, oldnode, digger)
  if oldnode.name == "mcl_core:diamond_ore" then
    local name = digger:get_player_name()
    core.chat_send_all("💎 " .. name .. " hat einen Diamanten gefunden!")
  end
end)
```

### Achtung: Diese Callbacks feuern für **alle** Blöcke
Deshalb immer mit `if newnode.name == "..."` filtern. Sonst spamt Dein Code bei jedem einzelnen Block-Klick.

### 🎯 Aufgabe
Wenn ein Spieler einen Diamant-Erzblock abbaut (`mcl_core:diamond_ore`), bekommt er eine private Gratulation im Chat.

### 🏆 Bonus
Wenn jemand einen TNT-Block (`mcl_tnt:tnt`) platziert: Warne **alle anderen** Spieler. Aber nicht den Platzierer selbst. (Tipp: `core.get_connected_players()` gibt eine Liste aller Spieler.)

---
⬅️ [Unit 15](unit15-spieler-callbacks.md) · [Übersicht](README.md) · ➡️ [Unit 17: globalstep und ABMs](unit17-globalstep-abm.md)
