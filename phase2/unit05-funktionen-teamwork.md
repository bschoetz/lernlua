# 🔧 Unit 5: Mehr-Werkzeug-Funktionen — Funktionen, die zusammenarbeiten

### Was lernen wir?
Funktionen können andere Funktionen aufrufen. So baust Du **komplexe Werkzeuge aus einfachen Teilen** — wie ein Crafting Tree.

### Beispiel
```lua
local function wuerfeln()
  return math.random(1, 6)
end

local function zwei_wuerfeln()
  return wuerfeln() + wuerfeln()
end

print("Du würfelst: " .. zwei_wuerfeln())
```

`zwei_wuerfeln` ruft zweimal `wuerfeln` auf. Wenn Du mal den Würfel ändern willst (z.B. auf W20), musst Du das nur an **einer Stelle** tun.

> ⚠️ Reihenfolge zählt: `wuerfeln` muss **über** `zwei_wuerfeln` stehen, sonst kennt Lua die Funktion noch nicht, wenn sie gebraucht wird.

### Funktionen, die Tables zurückgeben
Eine Funktion kann auch eine ganze Truhe zurückgeben:

```lua
local function neuer_spieler(name)
  return {
    name = name,
    herzen = 10,
    hunger = 10,
    inventar = {}
  }
end

local steve = neuer_spieler("Steve")
local alex = neuer_spieler("Alex")

print(steve.name .. " hat " .. steve.herzen .. " Herzen.")
print(alex.name .. " hat " .. alex.herzen .. " Herzen.")
```

Du kannst beliebig viele Spieler erstellen, ohne den Code zu wiederholen.

### Funktionen, die Tables verändern
```lua
local function nimm_schaden(spieler, schaden)
  spieler.herzen = spieler.herzen - schaden
  print(spieler.name .. " nimmt " .. schaden .. " Schaden. (" .. spieler.herzen .. " Herzen übrig)")
end

local steve = neuer_spieler("Steve")
nimm_schaden(steve, 3)
nimm_schaden(steve, 2)
```

### 🎯 Quest 5.1: Heilung und Schaden
Schreibe zwei Funktionen:
- `heile(spieler, menge)` — erhöht `herzen` (aber maximal 10)
- `essen(spieler, menge)` — erhöht `hunger` (aber maximal 10)

Teste sie mit einem Spieler, der nur noch 3 Herzen und 2 Hunger hat.

Tipp: `math.min(a, b)` gibt die kleinere der beiden Zahlen zurück — praktisch für "maximal 10".

### 🏆 Bonus-Quest: Kampf-Runde
Eine Funktion `kampf(spieler, mob)`:
- Würfelt Schaden für den Spieler (1–6)
- Würfelt Schaden für den Mob (1–4)
- Beide nehmen Schaden
- Gibt aus, was passiert ist

Lass den Kampf so lange laufen, bis einer keine Herzen mehr hat (das ist auch ein `while`!).

---
⬅️ [Unit 4](unit04-zufall.md) · [Übersicht](README.md) · ➡️ [Unit 6: insert und remove](unit06-insert-remove.md)
