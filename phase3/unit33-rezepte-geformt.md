# 🔨 Unit 33: Crafting-Rezepte — Geformt

### Was lernen wir?
Damit der Spieler Items **selbst herstellen** kann, brauchen wir Rezepte. Geformte Rezepte funktionieren wie in der Werkbank: Die Position der Zutaten zählt.

### Aufbau
```lua
core.register_craft({
  output = "meinemod:wunderapfel",
  recipe = {
    {"mcl_core:gold_ingot", "mcl_core:gold_ingot", "mcl_core:gold_ingot"},
    {"mcl_core:gold_ingot", "mcl_core:apple",      "mcl_core:gold_ingot"},
    {"mcl_core:gold_ingot", "mcl_core:gold_ingot", "mcl_core:gold_ingot"},
  },
})
```

Das ist quasi das Goldapfel-Rezept aus Minecraft: Apfel in der Mitte, Gold drumherum.

### Wichtige Mineclonia-Item-Namen

| Name | Was es ist |
|------|------------|
| `mcl_core:stick` | Stock |
| `mcl_core:wood` | Eichenholz-Brett |
| `mcl_core:cobble` | Bruchstein |
| `mcl_core:stone` | Stein |
| `mcl_core:dirt` | Erde |
| `mcl_core:diamond` | Diamant |
| `mcl_core:iron_ingot` | Eisenbarren |
| `mcl_core:gold_ingot` | Goldbarren |
| `mcl_core:coal_lump` | Kohle |
| `mcl_core:glass` | Glas |
| `mcl_core:apple` | Apfel |
| `mcl_mobitems:string` | Faden |

### Leere Plätze
Wenn ein Slot frei bleiben soll, schreib `""`:
```lua
recipe = {
  {"",                 "mcl_core:stick", ""},
  {"",                 "mcl_core:stick", ""},
  {"mcl_core:diamond", "",               "mcl_core:diamond"},
},
```

### 🎯 Aufgabe
Schreibe ein Rezept für Deinen "Magischen Trank": 1 Apfel + 4 Diamanten irgendwie kombiniert. Probier's im Spiel an der Werkbank aus.

> 💡 Unsicher, wie ein Item heißt? Im Spiel auf das Item zeigen und F5 drücken (Debug-Info) — oder `/giveme TEST` versuchen, die Fehlermeldung verrät oft den richtigen Namen.

### 🏆 Bonus
Schreib ein Rezept, das aus 9 Diamanten 1 Diamantblock macht. Tipp: Wie sieht so eine 3×3-Matrix aus, wenn alle Felder voll sind?

---
⬅️ [Unit 32](unit32-on-use.md) · [Übersicht](README.md) · ➡️ [Unit 34: Rezepte ungeformt](unit34-rezepte-ungeformt.md)
