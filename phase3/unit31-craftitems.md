# 🍎 Unit 31: Eigene Items — Craftitems

## Was lernen wir?
Ein **Craftitem** ist ein Item, das man **nicht** in der Welt platzieren kann — wie ein Stock, ein Apfel, ein Diamant. Es liegt nur im Inventar herum.

```lua
core.register_craftitem("meinemod:zauberstaub", {
  description = "Zauberstaub",
  inventory_image = "meinemod_zauberstaub.png",
})
```

Das war's. Mehr braucht ein einfaches Craftitem nicht.

### Item, das man essen kann
```lua
core.register_craftitem("meinemod:wunderapfel", {
  description = "Wunderapfel",
  inventory_image = "meinemod_wunderapfel.png",
  on_use = core.item_eat(8),
})
```

`core.item_eat(8)` heilt 8 Hitpoints (= 4 Herzen) und verbraucht das Item.

### Wichtig: `inventory_image` statt `tiles`
Bei Craftitems heißt es `inventory_image` (Einzahl, ein Bild). Bei Blöcken `tiles` (Mehrzahl, mehrere Bilder).

## ⚔️ Übungsquests

### 🎯 Aufgabe
Erstelle einen "Magischen Trank" als Craftitem. Mal die Textur (Piskel, 16×16). Beim Benutzen heilt er 10 HP. Texturdatei: `meinemod_trank.png`.

### 🏆 Bonus
Erstelle ein zweites Item: "Schwacher Trank", der nur 4 HP heilt.

---
⬅️ [Unit 30](unit30-groups-und-drops.md) · [Übersicht](README.md) · ➡️ [Unit 32: on_use](unit32-on-use.md)
