# 📦 Unit 2: Inventar-Slots — Variablen

### Was lernen wir?
Eine **Variable** ist wie ein Slot im Inventar. Du gibst ihm einen Namen und legst etwas hinein — eine Zahl, einen Text. Später kannst Du den Inhalt benutzen.

### Beispiel
```lua
spieler = "Steve"
herzen = 10
lieblingsblock = "Diamantblock"

print("Spieler: " .. spieler)
print(spieler .. " hat " .. herzen .. " Herzen.")
print("Sein Lieblingsblock: " .. lieblingsblock)
```

### Wann brauche ich Anführungszeichen — und wann nicht?
Das verwirrt am Anfang **jeden**, deshalb ganz genau:

**Alles in Anführungszeichen nimmt Lua wortwörtlich.** Wie beim wörtlichen Zitieren: `"Steve"` heißt "genau die Buchstaben S-t-e-v-e, nicht mehr und nicht weniger".

**Ohne Anführungszeichen ist ein Wort ein Name.** Dann schlägt Lua nach, was sich dahinter verbirgt — zum Beispiel ein Variablen-Slot (`spieler`) oder ein Befehl (`print`).

| Du schreibst | Lua versteht |
|--------------|--------------|
| `"Steve"` | den Text Steve — wortwörtlich |
| `spieler` | einen Slot-Namen — Lua holt raus, was drinliegt |
| `10` | eine Zahl — **Zahlen brauchen nie Anführungszeichen** |

### 🧪 Experiment: Der Unterschied in zwei Zeilen
```lua
spieler = "Steve"

print(spieler)      -- Steve    (Lua schlägt den Slot nach)
print("spieler")    -- spieler  (wortwörtlich, Slot egal!)
```

Gleiches Wort, riesiger Unterschied! Ohne Anführungszeichen bekommst Du den **Inhalt des Slots**, mit Anführungszeichen den **Text selbst**.

Und noch ein Versuch: Was gibt wohl `print(Steve)` aus — ohne Anführungszeichen? Lua sucht einen Slot namens `Steve` … und findet keinen. Es erscheint `nil` — das ist Luas Wort für "nichts". Wenn Du also irgendwo unerwartet `nil` siehst: Oft fehlen einfach Anführungszeichen, oder ein Slot-Name ist falsch geschrieben.

### Texte zusammenkleben mit `..`
Jetzt verstehst Du auch, warum diese Zeile so gemischt aussieht:

```lua
print("Spieler: " .. spieler)
```

Der **feste Text** (`"Spieler: "`) steht in Anführungszeichen, der **Slot-Name** (`spieler`) nicht — und die zwei Punkte `..` kleben beides zusammen. Stell Dir vor, das ist Crafting: Du nimmst zwei Teile und craftest sie zu einem Text.

**Faustregel zum Merken:**
- Soll es **genau so** auf dem Bildschirm erscheinen? → Anführungszeichen ✅
- Ist es der **Name eines Slots** (oder ein Befehl)? → keine Anführungszeichen ❌
- Ist es eine **Zahl zum Rechnen**? → keine Anführungszeichen ❌

### Regeln für Variablen-Namen
- Buchstaben, Zahlen und `_` erlaubt
- Dürfen nicht mit einer Zahl anfangen (`2spieler` ❌, `spieler2` ✅)
- Keine Leerzeichen oder Umlaute
- Groß- und Kleinschreibung zählt: `Spieler` ist nicht das Gleiche wie `spieler`
- Und: Slot-Namen stehen **nie** in Anführungszeichen

### 🎯 Quest 2.1: Charakter-Steckbrief
Erstelle Variablen für `name`, `level`, `welt` und `werkzeug`. Gib damit einen Steckbrief aus:
```
=== SPIELER-STECKBRIEF ===
Name: Alex
Level: 42
Welt: Overworld
Werkzeug: Netherit-Spitzhacke
```

Achte bei jeder Zeile darauf: Was ist fester Text (Anführungszeichen), was kommt aus einem Slot (keine)?

### 🏆 Bonus-Quest: Variable ändern
Was passiert, wenn Du `herzen = 10` schreibst, ausgibst, dann `herzen = 5` schreibst und nochmal ausgibst? Probier's aus!

---
⬅️ [Unit 1](unit01-hallo-overworld.md) · [Übersicht](README.md) · ➡️ [Unit 3: Rechnen](unit03-rechnen.md)
