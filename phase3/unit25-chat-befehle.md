# 💬 Unit 25: Chat-Befehle — Eigene Slash-Commands

### Was lernen wir?
Ein **Chat-Befehl** ist etwas, das der Spieler im Chat tippt, mit `/` davor — z.B. `/hallo`. Wir können eigene Befehle registrieren.

```lua
core.register_chatcommand("hallo", {
  description = "Sagt hallo zurück",
  func = function(name, param)
    return true, "Hallo " .. name .. "!"
  end,
})
```

Was passiert hier:
- `"hallo"` ist der Name — der Spieler tippt `/hallo`
- `description` taucht in `/help` auf
- `func` ist die Funktion, die ausgeführt wird
- Sie gibt zwei Werte zurück: `true` (= hat funktioniert) und den Text, den der Spieler sieht

### Parameter aufnehmen
Wenn der Spieler `/hallo Welt` tippt, ist `param` der Text `"Welt"`:
```lua
core.register_chatcommand("echo", {
  description = "Wiederholt den Text",
  func = function(name, param)
    return true, "Du hast geschrieben: " .. param
  end,
})
```

### 🎯 Aufgabe
Schreibe einen Befehl `/gruss`, der zurückgibt: "Hallo NAME, schön, dass Du da bist!"

### 🏆 Bonus
Befehl `/zeit`, der die aktuelle Tageszeit im Spiel anzeigt. Tipp: `core.get_timeofday()` gibt einen Wert zwischen 0 und 1 zurück (0 = Mitternacht, 0.5 = Mittag).

---
⬅️ [Unit 24](unit24-local.md) · [Übersicht](README.md) · ➡️ [Unit 26: Befehle mit Zufall](unit26-wuerfel-befehl.md)
