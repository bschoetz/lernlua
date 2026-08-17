# 🔀 Unit 34: Crafting-Rezepte — Ungeformt

### Was lernen wir?
Manchmal soll's egal sein, wo die Zutaten liegen — Hauptsache sie sind drin. Das heißt "shapeless".

```lua
core.register_craft({
  type = "shapeless",
  output = "meinemod:zauberstaub 4",
  recipe = {"mcl_dye:purple", "mcl_core:sugar", "mcl_dye:blue"},
})
```

Vier Stück Zauberstaub aus drei Zutaten — Reihenfolge oder Anordnung im Crafting-Grid egal.

### Output-Menge
`"meinemod:zauberstaub 4"` heißt: 4 Stück. Bei geformten Rezepten geht das genauso.

### Wann shaped, wann shapeless?
- **Shaped** für Sachen, die eine bestimmte "Form" haben (Schwert hat Griff unten, Klinge oben → Position zählt)
- **Shapeless** für Mischungen (Trank, Farbe, Teig — Reihenfolge egal)

### 🎯 Aufgabe
Mach ein Shapeless-Rezept für Deinen Zauberstaub. Probier verschiedene Anordnungen in der Werkbank — sollte immer klappen.

### 🏆 Bonus
Shapeless-Rezept für "Magie-Schleim": 2 Zauberstaub + 1 Apfel → 1 Schleim-Item. (Du musst das Schleim-Item natürlich vorher registrieren!)

---
⬅️ [Unit 33](unit33-rezepte-geformt.md) · [Übersicht](README.md) · ➡️ [Unit 35: Spieler-Callbacks](unit35-spieler-callbacks.md)
