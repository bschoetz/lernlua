# 🗺️ Unit 17: Welt aus Räumen — Räume als Tables

## Was lernen wir?
Jetzt wird's spannend. Wir bauen die Grundlage für ein Text-Adventure: eine **Welt aus Räumen**, zwischen denen man wechseln kann.

### Ein Raum als Table
```lua
local raum_hoehle = {
  name = "Dunkle Höhle",
  beschreibung = "Es ist feucht und kalt. Tropfsteine glitzern im Fackelschein.",
  ausgaenge = {
    nord = "wald",
    sued = "tiefe"
  }
}
```

`ausgaenge` ist eine Table mit Richtungen. Jede Richtung zeigt auf den **Namen** eines anderen Raums.

### Eine ganze Welt
```lua
local welt = {
  hoehle = {
    name = "Dunkle Höhle",
    beschreibung = "Feucht und kalt. Tropfsteine glitzern.",
    ausgaenge = { nord = "wald", sued = "tiefe" }
  },
  wald = {
    name = "Eichenwald",
    beschreibung = "Hohe Bäume, ein Pfad führt nach Süden.",
    ausgaenge = { sued = "hoehle", ost = "dorf" }
  },
  dorf = {
    name = "Dorfplatz",
    beschreibung = "Ein Brunnen, ein paar Dorfbewohner.",
    ausgaenge = { west = "wald" }
  },
  tiefe = {
    name = "Tiefe Mine",
    beschreibung = "Du hörst Zombies grummeln. Lava leuchtet rot.",
    ausgaenge = { nord = "hoehle" }
  }
}
```

### Durch die Welt bewegen
```lua
local aktueller_raum = "hoehle"

local function zeige_raum()
  local raum = welt[aktueller_raum]
  print("")
  print("=== " .. raum.name .. " ===")
  print(raum.beschreibung)
  print("Ausgänge:")
  for richtung, ziel in pairs(raum.ausgaenge) do
    print("  " .. richtung .. " -> " .. welt[ziel].name)
  end
end

zeige_raum()
```

> 💡 **Neu: `pairs(...)`** — wenn eine Table beschriftete Slots hat (statt 1, 2, 3), gehst Du sie mit `for ... in pairs(...) do` durch. `richtung` ist der Name, `ziel` der Wert. Die Reihenfolge ist dabei übrigens nicht garantiert — Lua darf die Etiketten in beliebiger Ordnung durchgehen.

## ⚔️ Übungsquests

### 🎯 Quest 17.1: Deine Mini-Welt
Baue eine Welt mit **4 Räumen** Deiner Wahl (z.B. Spawn, Dorf, Mine, Nether-Portal). Jeder Raum braucht `name`, `beschreibung` und `ausgaenge`. Achte darauf: Wenn Raum A einen Ausgang nach B hat, sollte B auch einen zurück nach A haben.

Teste mit `aktueller_raum = "..."` und `zeige_raum()`.

### 🏆 Bonus-Quest: Items in Räumen
Erweitere jeden Raum um eine `items`-Liste (z.B. `items = {"Fackel", "Apfel"}`). Lass `zeige_raum` auch ausgeben, was im Raum liegt.

---
⬅️ [Unit 16](unit16-insert-remove.md) · [Übersicht](README.md) · ➡️ [Unit 18: Bewegung](unit18-bewegung.md)
