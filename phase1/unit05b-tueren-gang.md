# 🗝️ Unit 5½: Der Türen-Gang — `elseif`

## Was lernen wir?
Mit `if` und `else` hast Du zwei Türen. Aber was, wenn es mehr als zwei Möglichkeiten gibt? Heute bauen wir einen ganzen **Gang voller Türen**.

## Mehrere Türen: `elseif`
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

**Wichtig: Lua prüft von oben nach unten** — und nimmt die **erste Tür, die aufgeht**. Alle Türen danach werden gar nicht mehr angeschaut. Das letzte `else` ist die Notausgangs-Tür: Sie geht auf, wenn alle anderen zu blieben.

Und noch etwas fällt auf: Der ganze Gang braucht nur **ein** `end` — egal wie viele `elseif`-Türen drinstecken.

## ⚠️ Die Schild-Falle beim Vergleichen
Erinnerst Du Dich an Unit 4½? Jetzt kommt die angekündigte Falle. Probier aus:

```lua
print("5" == 5)
```

**`false`!** Für Lua ist das Schild `"5"` **niemals** gleich der echten Zahl `5` — ein Schild ist eben keine Zahl.

Was heißt das für Deine Programme?
- Vergleichst Du **Text mit Text** (wie oben `welt == "nether"`) — alles gut, Schild gegen Schild. ✅
- Willst Du eine **Zahl** aus `io.read()` vergleichen — erst durch den Schmelzofen: `local herzen = tonumber(io.read())`. Sonst ist Deine Bedingung immer falsch, und Du suchst ewig den Fehler. 🔥

## ⚔️ Übungsquests

### 🎯 Quest 5½.1: Der Mob-Bestimmer
Frage nach einem Mob-Namen. Gib aus:
- "zombie" → "Untot, fürchtet Sonne"
- "creeper" → "VORSICHT, GEHT WEG!"
- "cow" → "Friedlich, gibt Milch"
- alles andere → "Unbekannter Mob"

(Hier vergleichst Du Schild mit Schild — kein Schmelzen nötig.)

### 🏆 Bonus-Quest: Schwierigkeits-Bewertung
Frage nach den Herzen und gib aus:
- 0 → "Game Over"
- 1–3 → "Kritisch!"
- 4–7 → "Mittel"
- 8–10 → "Voll gesund"

Zwei Tipps: Hier vergleichst Du **Zahlen** — Schmelzofen nicht vergessen! Und denk an die Türen-Reihenfolge: Wenn die 0 schon von der ersten Tür abgefangen wurde, reicht danach `herzen <= 3` für "1 bis 3".

---
⬅️ [Unit 5](unit05-if-else.md) · [Übersicht](README.md) · ➡️ [Unit 6: for-Schleifen](unit06-for-schleifen.md)
