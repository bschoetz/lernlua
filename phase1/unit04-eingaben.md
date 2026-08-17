# ⌨️ Unit 4: Chat mit dem Spieler — `io.read`

### Was lernen wir?
Bisher hat das Programm nur geredet. Jetzt soll es **zuhören**. Mit `io.read()` wartet das Programm, bis Du etwas ins Terminal eintippst und Enter drückst.

### Beispiel
```lua
print("Wie heißt Du?")
local name = io.read()
print("Willkommen in der Welt, " .. name .. "!")

print("Wie viele Herzen hast Du?")
local herzen = io.read()
print(name .. " hat " .. herzen .. " Herzen.")
```

Wenn Du das mit `lua datei.lua` startest, bleibt das Programm stehen und wartet — der Cursor blinkt im Terminal. Tippe Deine Antwort und drücke Enter.

### ⚠️ Wichtig: Text vs. Zahl
Was Du mit `io.read()` bekommst, ist **immer Text**, auch wenn Du eine Zahl eintippst. Wenn Du damit rechnen willst, musst Du es mit `tonumber(...)` umwandeln:

```lua
print("Wie alt bist Du?")
local alter_text = io.read()
local alter = tonumber(alter_text)
print("Nächstes Jahr bist Du " .. (alter + 1))
```

### 🎯 Quest 4.1: Der Begrüßungs-Bot
Schreibe ein Programm:
1. Fragt nach dem Spielernamen
2. Fragt nach dem Lieblings-Mob
3. Antwortet: "Hallo NAME, MOB sind auch meine Favoriten!"

### 🏆 Bonus-Quest: XP-Rechner
Frage nach dem aktuellen Level und dem Ziel-Level des Spielers. Gib aus, wie viele Level noch fehlen. Vergiss `tonumber` nicht!

---
⬅️ [Unit 3](unit03-rechnen.md) · [Übersicht](README.md) · ➡️ [Unit 5: if und else](unit05-if-else.md)
