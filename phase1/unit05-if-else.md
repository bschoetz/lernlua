# 🚪 Unit 5: Türen mit Redstone — `if` und `else`

### Was lernen wir?
Manchmal soll das Programm entscheiden. Wie eine Druckplatte: *Wenn* ein Spieler draufsteht, *dann* öffnet die Tür. In Lua:

```lua
if BEDINGUNG then
  -- mach das hier
else
  -- sonst mach das hier
end
```

`end` ist wichtig — das schließt den `if`-Block ab, wie das Schließen einer Truhe.

### Vergleichs-Operatoren

| Operator | Bedeutung |
|----------|-----------|
| `==` | gleich (zwei Gleichheitszeichen!) |
| `~=` | ungleich |
| `<` | kleiner |
| `>` | größer |
| `<=` | kleiner oder gleich |
| `>=` | größer oder gleich |

### Beispiel
```lua
local herzen = 3

if herzen <= 2 then
  print("⚠️ Achtung, wenig Leben! Iss was!")
else
  print("Alles okay, weiter abenteuern!")
end
```

Mit `elseif` kann man mehrere Fälle prüfen:

```lua
print("Welche Welt? (overworld / nether / end)")
local welt = io.read()

if welt == "overworld" then
  print("Schöne Berge und Wälder!")
elseif welt == "nether" then
  print("Vorsicht vor Ghasts!")
elseif welt == "end" then
  print("Pass auf den Enderdrachen auf!")
else
  print("Diese Welt kenne ich nicht.")
end
```

### 🎯 Quest 5.1: Der Mob-Bestimmer
Frage nach einem Mob-Namen. Gib aus:
- "zombie" → "Untot, fürchtet Sonne"
- "creeper" → "VORSICHT, GEHT WEG!"
- "cow" → "Friedlich, gibt Milch"
- alles andere → "Unbekannter Mob"

### 🏆 Bonus-Quest: Schwierigkeits-Bewertung
Frage nach Herzen (Zahl! `tonumber` nicht vergessen). Gib aus:
- 0 → "Game Over"
- 1–3 → "Kritisch!"
- 4–7 → "Mittel"
- 8–10 → "Voll gesund"

---
⬅️ [Unit 4](unit04-eingaben.md) · [Übersicht](README.md) · ➡️ [Unit 6: for-Schleifen](unit06-for-schleifen.md)
