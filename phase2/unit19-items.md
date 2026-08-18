# 🎒 Unit 19: Items aufheben und benutzen

## Was lernen wir?
Ein Adventure ohne Items ist langweilig. Wir geben dem Spieler ein **eigenes Inventar** und lassen ihn Sachen aus Räumen aufheben.

### Spieler mit Inventar
```lua
local spieler = {
  name = "Du",
  inventar = {}
}
```

### Items aus dem Raum aufheben
```lua
local function nimm(item_name)
  local raum = welt[aktueller_raum]
  if not raum.items then
    print("Hier liegt nichts.")
    return
  end

  for i = 1, #raum.items do
    if raum.items[i] == item_name then
      table.insert(spieler.inventar, item_name)
      table.remove(raum.items, i)
      print("Du hebst " .. item_name .. " auf.")
      return
    end
  end

  print("Kein '" .. item_name .. "' hier.")
end
```

`return` ohne Wert beendet die Funktion sofort — praktisch, wenn man nichts mehr tun will.

### Inventar zeigen
```lua
local function zeige_inventar()
  if #spieler.inventar == 0 then
    print("Dein Inventar ist leer.")
  else
    print("=== Inventar ===")
    for i = 1, #spieler.inventar do
      print(i .. ". " .. spieler.inventar[i])
    end
  end
end
```

### Befehle erweitern
Die Haupt-Schleife wird jetzt etwas schlauer:
```lua
while true do
  print("")
  print("Was tun? (nord/sued/ost/west, nimm X, inventar, ende)")
  local eingabe = io.read()

  if eingabe == "ende" then
    break
  elseif eingabe == "inventar" then
    zeige_inventar()
  elseif string.sub(eingabe, 1, 5) == "nimm " then
    local item = string.sub(eingabe, 6)
    nimm(item)
  else
    gehe(eingabe)
  end
end
```

Mit `string.sub(eingabe, 1, 5) == "nimm "` prüfen wir, ob die Eingabe mit "nimm " anfängt. Der Rest (`string.sub(eingabe, 6)`) ist der Item-Name.

## ⚔️ Übungsquests

### 🎯 Quest 19.1: Schatzsuche
Lege in **mindestens 2 Räume** jeweils 2 Items. Spiele die Welt und sammle alles ein. Prüfe mit `inventar`, ob es funktioniert.

### 🏆 Bonus-Quest: Wegwerfen
Schreibe einen Befehl `werfe X`, der ein Item aus dem Inventar entfernt und in den aktuellen Raum legt.

---
⬅️ [Unit 18](unit18-bewegung.md) · [Übersicht](README.md) · ➡️ [Unit 20: Mega-Projekt](unit20-enderdrache.md)
