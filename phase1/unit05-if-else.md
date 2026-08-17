# 🚪 Unit 5: Türen mit Redstone — `if` und `else`

### Was lernen wir?
Manchmal soll das Programm entscheiden. Wie eine Druckplatte vor einer Tür: *Wenn* ein Spieler draufsteht, *dann* öffnet die Tür. Sonst bleibt sie zu.

### 🧪 Experiment: Stell Lua eine Frage
Bevor wir Türen bauen, probier mal das hier aus:

```lua
print(5 > 3)
print(1 > 100)
print(7 == 7)
```

Lua antwortet: `true`, `false`, `true`. Das heißt **wahr**, **falsch**, **wahr**.

Eine **Bedingung** ist also nichts Geheimnisvolles — es ist einfach eine **Frage, die Lua mit wahr oder falsch beantwortet**. Und genau solche Fragen stellen wir gleich unseren Druckplatten.

### Die Vergleichszeichen

| Zeichen | Die Frage | Beispiel |
|---------|-----------|----------|
| `==` | Ist es gleich? | `7 == 7` → wahr |
| `~=` | Ist es ungleich? | `3 ~= 5` → wahr |
| `<` | Ist links kleiner? | `3 < 10` → wahr |
| `>` | Ist links größer? | `3 > 10` → falsch |
| `<=` | Kleiner oder gleich? | `5 <= 5` → wahr |
| `>=` | Größer oder gleich? | `4 >= 9` → falsch |

**Das Krokodil hilft Dir bei `<` und `>`:** Du kennst das aus der Schule — das Krokodilmaul ist gierig und schnappt immer nach der **größeren** Zahl. Bei `3 < 10` zeigt das offene Maul zur 10. So merkst Du Dir die Richtung ganz von selbst.

**⚠️ Ein `=` oder zwei `==`? Riesiger Unterschied!**
- `herzen = 10` — **ein** Gleichheitszeichen ist ein **Befehl**: "Leg die 10 in den Slot `herzen`!" (kennst Du aus Unit 2)
- `herzen == 10` — **zwei** Gleichheitszeichen sind eine **Frage**: "Ist in `herzen` eine 10?"

Wenn Du in einer Bedingung aus Versehen nur ein `=` schreibst, meckert Lua. Das passiert **jedem** am Anfang — jetzt weißt Du schon, woran es liegt.

> 💡 **Tastatur-Tipp:** Die Schlange `~` für "ungleich" tippst Du mit **AltGr + `+`** (die Taste rechts neben dem Ü).

### Die Druckplatte: `if` ... `then` ... `else` ... `end`
```lua
if BEDINGUNG then
  -- Tür geht auf: mach das hier
else
  -- Tür bleibt zu: mach stattdessen das hier
end
```

- `if` ist die Druckplatte: Sie prüft die Frage.
- `then` — bei **wahr** geht die Tür auf, und der Code dahinter läuft.
- `else` — bei **falsch** läuft stattdessen dieser Teil. (Den kannst Du auch weglassen, wenn bei falsch einfach nichts passieren soll.)
- `end` ist wichtig — das schließt den Block ab, wie das Schließen einer Truhe.

### Beispiel
```lua
local herzen = 3

if herzen <= 2 then
  print("ACHTUNG: Wenig Leben! Iss was!")
else
  print("Alles okay, weiter abenteuern!")
end
```

### Mehrere Türen: `elseif`
Mit `elseif` baust Du einen ganzen Gang voller Türen:

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

### ⚠️ Die Schild-Falle beim Vergleichen
Erinnerst Du Dich an Unit 4? Jetzt kommt die angekündigte Falle. Probier aus:

```lua
print("5" == 5)
```

**`false`!** Für Lua ist das Schild `"5"` **niemals** gleich der echten Zahl `5` — ein Schild ist eben keine Zahl.

Was heißt das für Deine Programme?
- Vergleichst Du **Text mit Text** (wie oben `welt == "nether"`) — alles gut, Schild gegen Schild. ✅
- Willst Du eine **Zahl** aus `io.read()` vergleichen — erst durch den Schmelzofen: `local herzen = tonumber(io.read())`. Sonst ist Deine Bedingung immer falsch, und Du suchst ewig den Fehler. 🔥

### 🎯 Quest 5.1: Der Mob-Bestimmer
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
⬅️ [Unit 4](unit04-eingaben.md) · [Übersicht](README.md) · ➡️ [Unit 6: for-Schleifen](unit06-for-schleifen.md)
