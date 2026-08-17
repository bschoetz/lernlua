# 🚶 Unit 18: Bewegung in der Welt — Eingaben verarbeiten

### Was lernen wir?
Wir nehmen die Welt aus Unit 17 und machen daraus ein **interaktives Spiel**, wo der Spieler Richtungen eintippt.

### Der Bewegungs-Befehl
```lua
local function gehe(richtung)
  local raum = welt[aktueller_raum]
  if raum.ausgaenge[richtung] then
    aktueller_raum = raum.ausgaenge[richtung]
    zeige_raum()
  else
    print("Da führt kein Weg hin.")
  end
end
```

`raum.ausgaenge[richtung]` — wenn der Spieler `nord` eingibt, schaut das Programm, ob der aktuelle Raum einen Ausgang `nord` hat.

### Die Haupt-Schleife
```lua
zeige_raum()

while true do
  print("")
  print("Was tun? (nord/sued/ost/west/ende)")
  local eingabe = io.read()

  if eingabe == "ende" then
    print("Bis bald!")
    break
  else
    gehe(eingabe)
  end
end
```

> 💡 **Neu: `break`** — bricht eine Schleife sofort ab. `while true do` läuft eigentlich für immer — `break` ist der Notausgang. (Und falls Du Dich mal einschließt: Strg+C im Terminal.)

### 🎯 Quest 18.1: Die Welt erforschen
Nimm Deine Welt aus Quest 17.1 und mache sie spielbar mit dem Code oben. Spiele und gehe durch alle Räume.

### 🏆 Bonus-Quest: Schöner Prompt
Statt nur "Was tun?" — zeige dem Spieler die **möglichen Richtungen**:
```
Was tun? (möglich: nord, ost / ende)
```

Tipp: Sammle die Richtungen aus `welt[aktueller_raum].ausgaenge` mit `pairs` in eine Liste und nutze `table.concat(liste, ", ")`.

---
⬅️ [Unit 17](unit17-raeume.md) · [Übersicht](README.md) · ➡️ [Unit 19: Items aufheben](unit19-items.md)
