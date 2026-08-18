# 💬 Unit 23: Etwas Sichtbares — Begrüßung im Chat

## Was lernen wir?
Log-Meldungen sind unsichtbar — langweilig. Jetzt machen wir was, das der Spieler im Spiel sieht: Eine Begrüßung im Chat, wenn er der Welt beitritt.

```lua
core.register_on_joinplayer(function(player)
  local name = player:get_player_name()
  core.chat_send_all("Willkommen, " .. name .. "!")
end)
```

Was passiert hier:
- `core.register_on_joinplayer(...)` sagt Luanti: "Immer wenn ein Spieler beitritt, ruf bitte diese Funktion auf."
- Die Funktion bekommt einen `player` (das ist eine Art Objekt, das den Spieler repräsentiert).
- `player:get_player_name()` holt den Namen aus dem Spieler-Objekt. Der **Doppelpunkt** ist neu — den lernen wir noch genauer kennen.
- `core.chat_send_all(...)` schickt eine Nachricht an **alle** Spieler im Chat.

## ⚔️ Übungsquests

### 🎯 Aufgabe
Erweitere `hallowelt`: Lass beim Beitreten "Willkommen, NAME!" erscheinen. Welt verlassen, neu beitreten — die Nachricht muss kommen.

### 🏆 Bonus
Nutze `core.chat_send_player(name, "...")` statt `chat_send_all`, damit nur der beitretende Spieler die Nachricht sieht.

---
⬅️ [Unit 22](unit22-hallo-luanti.md) · [Übersicht](README.md) · ➡️ [Unit 24: local in Mods](unit24-local.md)
