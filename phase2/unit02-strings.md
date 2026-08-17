# 🪧 Unit 2: Schilder lesen — Strings unter der Lupe

### Was lernen wir?
Ein **String** ist Text. Wir hatten ihn schon — aber Strings können viel mehr, als nur ausgegeben werden.

### Länge messen
```lua
local name = "Herobrine"
print(#name)        -- 9
```

Das `#` wie bei Tables — funktioniert auch bei Strings.

### Groß und klein
```lua
local mob = "creeper"
print(string.upper(mob))      -- "CREEPER"
print(string.lower("ZOMBIE")) -- "zombie"
```

### Teile rausschneiden
`string.sub(text, von, bis)` schneidet ein Stück raus:
```lua
local wort = "Diamantschwert"
print(string.sub(wort, 1, 7))   -- "Diamant"
print(string.sub(wort, 8))      -- "schwert"
print(string.sub(wort, -7))     -- "schwert" (von hinten gezählt)
```

### Suchen
```lua
local satz = "Achtung, ein Creeper!"
local gefunden = string.find(satz, "Creeper")
print(gefunden)  -- 14 (Position, wo es startet)
```

### Ersetzen
```lua
local text = "Ich liebe Zombies"
local neu = string.gsub(text, "Zombies", "Katzen")
print(neu)   -- "Ich liebe Katzen"
```

> ⚠️ Achtung bei Umlauten: `#`, `sub` und Co. zählen **Bytes**, nicht Buchstaben. Bei "ä", "ö", "ü" kann die Länge größer sein als erwartet. Für unsere Spiele reicht's — merk Dir nur: Bei Umlauten kann's komisch werden.

### 🎯 Quest 2.1: Schrei-Maschine
Schreibe ein Programm, das den Spieler nach einem Satz fragt und ihn dann in **GROSSBUCHSTABEN mit drei Ausrufezeichen** ausgibt:

```
Eingabe: hilfe ein creeper
Ausgabe: HILFE EIN CREEPER!!!
```

### 🏆 Bonus-Quest: Mob-Zensur
Frage nach einem Satz. Ersetze alle Vorkommen von "Creeper" durch "Pfannkuchen" und gib den neuen Satz aus.

---
⬅️ [Unit 1](unit01-tables-mit-schluesseln.md) · [Übersicht](README.md) · ➡️ [Unit 3: Logik](unit03-logik.md)
