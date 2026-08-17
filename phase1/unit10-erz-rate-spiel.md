# 🎮 Unit 10: Mega-Projekt — Das Erz-Rate-Spiel

Jetzt kommt alles zusammen. Ein kleines Spiel: Der Computer denkt sich ein Erz aus, und der Spieler muss raten, wie tief es vorkommt.

### 🆕 Neues Werkzeug: `math.random`
Bevor's losgeht, ein neuer Befehl: `math.random(1, 5)` gibt eine **zufällige** ganze Zahl zwischen 1 und 5 zurück — wie ein Würfelwurf. Jedes Mal eine andere!

```lua
print(math.random(1, 6))   -- würfelt 1 bis 6
```

> 💡 In modernem Lua (ab 5.4, wir haben 5.5) ist der Würfel beim Programmstart schon automatisch "geschüttelt". Falls Du irgendwo auf ein altes Lua triffst, das immer dieselben Zahlen liefert: einmal `math.randomseed(os.time())` an den Programmanfang schreiben.

### Schritt 1: Die Vorbereitung
```lua
local erze = {"Kohle", "Eisen", "Gold", "Diamant", "Smaragd"}
local tiefen = {50, 30, 10, -50, -16}
```

Zwei Tables, die zusammengehören: `erze[1]` ist "Kohle", `tiefen[1]` ist `50`.

### Schritt 2: Zufälliges Erz auswählen
```lua
local nummer = math.random(1, 5)
local erz = erze[nummer]
local tiefe = tiefen[nummer]
```

### Schritt 3: Der Spieler rät
```lua
print("Auf welcher Y-Koordinate findet man " .. erz .. "?")
print("(Hinweis: Über 0 oder unter 0 — schätze!)")
local versuch = tonumber(io.read())
```

### Schritt 4: Auswertung
```lua
local differenz = math.abs(versuch - tiefe)

if differenz == 0 then
  print("🎯 PERFEKT! Genau bei Y=" .. tiefe)
elseif differenz <= 10 then
  print("🟢 Sehr nah! Richtig wäre Y=" .. tiefe)
elseif differenz <= 30 then
  print("🟡 Nicht schlecht. Richtig wäre Y=" .. tiefe)
else
  print("🔴 Daneben. Richtig wäre Y=" .. tiefe)
end
```

`math.abs(...)` macht aus einer negativen Zahl eine positive — wir wollen ja den Abstand.

### Das ganze Programm
```lua
local erze = {"Kohle", "Eisen", "Gold", "Diamant", "Smaragd"}
local tiefen = {50, 30, 10, -50, -16}

print("=== ERZ-TIEFEN-QUIZ ===")
print("Auf welcher Y-Koordinate findet man welches Erz?")
print("")

local punkte = 0

for runde = 1, 3 do
  print("--- Runde " .. runde .. " ---")
  local nummer = math.random(1, 5)
  local erz = erze[nummer]
  local tiefe = tiefen[nummer]

  print("Auf welcher Y-Koordinate findet man " .. erz .. "?")
  local versuch = tonumber(io.read())
  local differenz = math.abs(versuch - tiefe)

  if differenz == 0 then
    print("🎯 PERFEKT! +3 Punkte")
    punkte = punkte + 3
  elseif differenz <= 10 then
    print("🟢 Sehr nah! +2 Punkte (Richtig: Y=" .. tiefe .. ")")
    punkte = punkte + 2
  elseif differenz <= 30 then
    print("🟡 Okay. +1 Punkt (Richtig: Y=" .. tiefe .. ")")
    punkte = punkte + 1
  else
    print("🔴 Daneben. (Richtig: Y=" .. tiefe .. ")")
  end
  print("")
end

print("=== ERGEBNIS ===")
print("Du hast " .. punkte .. " von 9 möglichen Punkten erreicht.")

if punkte >= 7 then
  print("🏆 Erz-Meister!")
elseif punkte >= 4 then
  print("⛏️ Solider Bergmann.")
else
  print("📚 Übung macht den Meister!")
end
```

### 🎯 Quest 10.1: Spiele es
Tippe das Programm ab und spiele es ein paar Mal.

### 🏆 Bonus-Quests (für die Cleveren)
- Mache **5 Runden** statt 3
- Füge **mehr Erze** hinzu (Lapislazuli, Redstone, Kupfer) — Tipp: dann `math.random(1, #erze)` benutzen, damit es automatisch mitwächst
- Lass den Spieler vor dem Spiel seinen Namen eingeben und nutze ihn in den Ausgaben
- Wenn der Spieler perfekt rät, gib einen speziellen Glückwunsch

---

## 🏅 Geschafft!
Damit ist Phase 1 abgeschlossen — Zeit für einen Blick auf die [Checkliste](../README.md#-fortschritt). In [Phase 2](../phase2/README.md) kommen Tables mit Namen, String-Tricks und ein großes Text-Adventure.

⬅️ [Unit 9](unit09-tables.md) · [Übersicht](README.md) · ➡️ [Phase 2](../phase2/README.md)
