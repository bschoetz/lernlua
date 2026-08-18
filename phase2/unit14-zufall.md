# 🎲 Unit 14: Würfel und Zufall — `math.random` richtig nutzen

### Was lernen wir?
In Phase 1 (Unit 10½) hatten wir `math.random(1, 5)` für das Erz-Quiz. Hier ein paar Profi-Tricks.

### Würfel mit verschiedenen Seiten
```lua
local w6 = math.random(1, 6)
local w20 = math.random(1, 20)
local prozent = math.random(1, 100)

print("W6: " .. w6)
print("W20: " .. w20)
print("Prozent: " .. prozent .. "%")
```

> 💡 Unser Lua (5.5) schüttelt den Würfel beim Start automatisch. In alten Lua-Versionen brauchte man dafür `math.randomseed(os.time())` am Programmanfang — falls Dir das mal in fremdem Code begegnet, weißt Du jetzt, was es tut.

### Zufällig aus einer Liste
```lua
local mobs = {"Zombie", "Skelett", "Creeper", "Spinne", "Enderman"}
local zufalls_mob = mobs[math.random(1, #mobs)]
print("Ein wilder " .. zufalls_mob .. " erscheint!")
```

`#mobs` ist die Länge — so funktioniert es auch, wenn Du später mehr Mobs hinzufügst.

### Prozent-Chancen
```lua
local chance = math.random(1, 100)

if chance <= 5 then
  print("Seltenes Diamant-Erz!")
elseif chance <= 25 then
  print("Eisen-Erz")
else
  print("Stein")
end
```

### 🎯 Quest 14.1: Mob-Generator
Schreibe ein Programm, das **5 zufällige Mobs** aus einer Liste von mindestens 8 Mobs ausgibt.

### 🏆 Bonus-Quest: Loot-Truhe
Beim Öffnen einer Truhe wird ausgewürfelt:
- 50% Chance: "Brot"
- 30% Chance: "Eisenbarren"
- 15% Chance: "Diamant"
- 5% Chance: "Netherit-Splitter"

Lass den Spieler 10 Mal öffnen und gib jedes Mal den Fund aus.

---
⬅️ [Unit 13](unit13-logik.md) · [Übersicht](README.md) · ➡️ [Unit 15: Funktionen im Team](unit15-funktionen-teamwork.md)
