# 📜 Unit 11: Beschriftete Truhen — Tables mit Schlüsseln

### Was lernen wir?
In Phase 1 waren Tables wie Truhen mit nummerierten Slots: `inventar[1]`, `inventar[2]`. Jetzt lernen wir **beschriftete Slots** — wie eine Shulker-Box mit Etiketten.

```lua
local spieler = {
  name = "Steve",
  herzen = 10,
  level = 5,
  welt = "Overworld"
}

print(spieler.name)     -- "Steve"
print(spieler.herzen)   -- 10
print(spieler.level)    -- 5
```

Mit dem **Punkt** kommst Du an die Werte. Das ist viel lesbarer als `spieler[1]`, `spieler[2]`.

### Werte ändern und hinzufügen
```lua
spieler.herzen = 8          -- Wert ändern
spieler.beruf = "Bergmann"  -- Neuen Eintrag hinzufügen
print(spieler.beruf)
```

### Tables in Tables
Echte Power: Eine Table kann andere Tables enthalten.
```lua
local spieler = {
  name = "Alex",
  herzen = 10,
  ausruestung = {
    waffe = "Diamantschwert",
    ruestung = "Eisen",
    werkzeug = "Netherit-Spitzhacke"
  }
}

print(spieler.ausruestung.waffe)   -- "Diamantschwert"
```

### 🎯 Quest 11.1: Charakter-Karte
Erstelle einen Spieler mit `name`, `herzen`, `hunger`, `xp` und `position` (selbst wieder eine Table mit `x`, `y`, `z`). Gib alles schön formatiert aus:

```
=== SPIELER-KARTE ===
Name:    Alex
Herzen:  10
Hunger:  8
XP:      127
Position: X=64, Y=72, Z=-128
```

### 🏆 Bonus-Quest: Mob-Datenbank
Erstelle eine Table `mobs` mit drei beschrifteten Einträgen (`zombie`, `skelett`, `creeper`). Jeder Eintrag ist selbst eine Table mit `schaden`, `leben` und `feindlich`. Gib alle Werte für den Creeper aus.

---
⬅️ [Übersicht](README.md) · ➡️ [Unit 12: Strings](unit12-strings.md)
