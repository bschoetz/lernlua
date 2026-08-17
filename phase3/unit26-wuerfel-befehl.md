# 🎲 Unit 26: Befehle mit Zufall — `/wuerfel`

### Was lernen wir?
Wir kombinieren Chat-Befehle mit `math.random` aus Phase 2.

```lua
core.register_chatcommand("wuerfel", {
  description = "Würfelt eine Zahl (Standard: 1-6)",
  func = function(name, param)
    local seiten = tonumber(param) or 6
    local ergebnis = math.random(1, seiten)
    return true, "" .. name .. " würfelt: " .. ergebnis
  end,
})
```

Profi-Trick: `tonumber(param) or 6` — wenn `param` keine Zahl ist (oder leer), nimm 6. Das `or` macht das hier elegant: Es nimmt den ersten Wert, der nicht `nil`/`false` ist.

### 🎯 Aufgabe
Bring den Würfel-Befehl zum Laufen. Teste: `/wuerfel`, `/wuerfel 20`, `/wuerfel 100`.

### 🏆 Bonus
Befehl `/muenze`, der "Kopf" oder "Zahl" zurückgibt.

---
⬅️ [Unit 25](unit25-chat-befehle.md) · [Übersicht](README.md) · ➡️ [Unit 27: Eigene Blöcke](unit27-eigene-bloecke.md)
