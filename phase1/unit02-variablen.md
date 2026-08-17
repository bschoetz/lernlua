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

Die zwei Punkte `..` kleben Texte zusammen. Stell Dir vor, das ist Crafting: Du nimmst zwei Strings und craftest sie zu einem.

### Regeln für Variablen-Namen
- Buchstaben, Zahlen und `_` erlaubt
- Dürfen nicht mit einer Zahl anfangen (`2spieler` ❌, `spieler2` ✅)
- Keine Leerzeichen oder Umlaute
- Groß- und Kleinschreibung zählt: `Spieler` ist nicht das Gleiche wie `spieler`

### 🎯 Quest 2.1: Charakter-Steckbrief
Erstelle Variablen für `name`, `level`, `welt` und `werkzeug`. Gib damit einen Steckbrief aus:
```
=== SPIELER-STECKBRIEF ===
Name: Alex
Level: 42
Welt: Overworld
Werkzeug: Netherit-Spitzhacke
```

### 🏆 Bonus-Quest: Variable ändern
Was passiert, wenn Du `herzen = 10` schreibst, ausgibst, dann `herzen = 5` schreibst und nochmal ausgibst? Probier's aus!

---
⬅️ [Unit 1](unit01-hallo-overworld.md) · [Übersicht](README.md) · ➡️ [Unit 3: Rechnen](unit03-rechnen.md)
