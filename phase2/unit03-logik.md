# 🔀 Unit 3: Logik-Gates aus Redstone — `and`, `or`, `not`

### Was lernen wir?
Bisher haben wir mit `if` immer **eine** Bedingung geprüft. Jetzt kombinieren wir sie — wie Redstone-Schaltungen.

| Operator | Bedeutung | Wann wahr? |
|----------|-----------|------------|
| `and` | und | wenn **beide** Bedingungen wahr sind |
| `or` | oder | wenn **mindestens eine** wahr ist |
| `not` | nicht | dreht wahr/falsch um |

### Beispiele
```lua
local herzen = 8
local hunger = 3

if herzen > 5 and hunger > 5 then
  print("Kampfbereit!")
else
  print("Erst essen oder heilen.")
end
```

```lua
local welt = "nether"

if welt == "nether" or welt == "end" then
  print("Gefährliche Dimension!")
end
```

```lua
local ist_tag = false

if not ist_tag then
  print("Vorsicht, Mobs spawnen!")
end
```

### Ketten bauen
```lua
local level = 25
local hat_diamantschwert = true
local hat_ruestung = true

if level >= 20 and hat_diamantschwert and hat_ruestung then
  print("Bereit für den Enderdrachen!")
end
```

### 🎯 Quest 3.1: Spawn-Bedingungen
Schreibe ein Programm, das prüft, ob Mobs spawnen können. Bedingungen:
- Es ist Nacht (`ist_tag = false`)
- Das Licht-Level ist niedriger als 7

Wenn **beide** zutreffen → "Mobs spawnen!". Sonst → "Sicher."

### 🏆 Bonus-Quest: Boss-Bereit-Check
Frage nach `level` (Zahl), `hat_schwert` (j/n) und `hat_traenke` (j/n). Der Spieler ist boss-bereit, wenn Level ≥ 30 **und** mindestens eines der beiden Items dabei ist.

---
⬅️ [Unit 2](unit02-strings.md) · [Übersicht](README.md) · ➡️ [Unit 4: Zufall](unit04-zufall.md)
