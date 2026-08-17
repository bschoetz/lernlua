# 👂 Unit 35: Callbacks — Auf Spieler-Aktionen reagieren

### Was lernen wir?
Eine Mod kann sich für **Ereignisse** anmelden. Wenn das Ereignis passiert, ruft Luanti unsere Funktion auf. Das nennt man **Callback** (Rückruf).

Wir haben schon `register_on_joinplayer` benutzt. Es gibt viel mehr:

### Spieler stirbt
```lua
core.register_on_dieplayer(function(player)
  local name = player:get_player_name()
  core.chat_send_all("💀 " .. name .. " ist gestorben!")
end)
```

### Spieler respawnt
```lua
core.register_on_respawnplayer(function(player)
  local name = player:get_player_name()
  core.chat_send_player(name, "🌟 Willkommen zurück!")
  return false  -- nicht den Respawn-Vorgang abbrechen
end)
```

### Die wichtigsten Callbacks
| Callback | Wann |
|----------|------|
| `register_on_joinplayer` | Beitritt |
| `register_on_leaveplayer` | Verlassen |
| `register_on_dieplayer` | Tod |
| `register_on_respawnplayer` | Respawn |
| `register_on_chat_message` | Chat-Nachricht |
| `register_on_punchplayer` | Spieler wird geschlagen |

### 🎯 Aufgabe
**Tod-Zähler**: Bei jedem Tod erscheint im Chat "💀 NAME ist zum X. Mal gestorben!". Tipp: Eine `local tode = {}` Table und `tode[name] = (tode[name] or 0) + 1`.

### 🏆 Bonus
Ein Befehl `/tode`, der zeigt, wie oft jeder Spieler gestorben ist (geh die `tode`-Table mit `pairs` durch).

---
⬅️ [Unit 34](unit34-rezepte-ungeformt.md) · [Übersicht](README.md) · ➡️ [Unit 36: Block-Callbacks](unit36-block-callbacks.md)
