# ⏳ Unit 7: Warten auf den Tag — `while`-Schleifen

### Was lernen wir?
`for` ist gut, wenn man weiß, **wie oft** wiederholt werden soll. `while` ist gut, wenn man **so lange** etwas tun will, bis eine Bedingung erfüllt ist.

```lua
while BEDINGUNG do
  -- mach das hier wieder und wieder
end
```

### Beispiel
```lua
local hunger = 0

while hunger < 10 do
  hunger = hunger + 1
  print("Hunger jetzt: " .. hunger)
end

print("Bin satt!")
```

### ⚠️ Achtung Endlos-Schleife!
Wenn die Bedingung nie falsch wird, läuft das Programm ewig. Beispiel:
```lua
local herzen = 10
while herzen > 0 do
  print("Aua!")
  -- vergessen: herzen = herzen - 1
end
```
Falls das passiert: Im Terminal **Strg+C** drücken — das ist der Not-Aus-Knopf.

### 🎯 Quest 7.1: Diamanten sammeln
Schreibe ein Programm:
- Start mit 0 Diamanten
- So lange weniger als 5 Diamanten, fragt es: "Diamant gefunden? (j/n)"
- Bei `j` wird ein Diamant dazugezählt und ausgegeben
- Bei `n` sagt es "Weitersuchen!"
- Wenn 5 erreicht: "Genug für eine Diamant-Spitzhacke!"

### 🏆 Bonus-Quest: Countdown zum Spawn
Mache einen Countdown von 10 bis 0. Bei 0 ausgeben: "💥 BOOM — Creeper explodiert!"

---
⬅️ [Unit 6](unit06-for-schleifen.md) · [Übersicht](README.md) · ➡️ [Unit 8: Funktionen](unit08-funktionen.md)
