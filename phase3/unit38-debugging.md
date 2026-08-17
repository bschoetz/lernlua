# 🐛 Unit 38: Bugs finden — Logs lesen und debuggen

### Was lernen wir?
Sobald Code länger wird, gehen Sachen schief. **Profis suchen Bugs systematisch**, nicht durch Raten.

### Die Logdatei
Bei Fehlern schreibt Luanti in `debug.txt` im User-Data-Verzeichnis. Beispiel:
```
ERROR[Main]: ServerError: AsyncErr: ...
mods/meinemod/init.lua:14: attempt to index a nil value (global 'mcl_sounds')
```

Bedeutung: In Zeile 14 wurde `mcl_sounds` benutzt, aber es existiert nicht. Wahrscheinlich `depends = mcl_sounds` in `mod.conf` vergessen.

### Debug-Ausgaben einbauen
Wenn etwas nicht funktioniert, ein paar `core.log` reinstreuen:
```lua
core.register_on_dignode(function(pos, oldnode, digger)
  core.log("action", "[meinemod] Block abgebaut: " .. oldnode.name)
  if oldnode.name == "meinemod:leuchtstein" then
    core.log("action", "[meinemod] Es war ein Leuchtstein!")
  end
end)
```

Dann in der Logdatei nachschauen, ob die Meldungen kommen. Wenn nicht, weißt Du: Der Code wird gar nicht erreicht.

### Häufige Anfänger-Bugs
| Fehler | Wahrscheinliche Ursache |
|--------|--------------------------|
| `attempt to index nil` | Du benutzt etwas, das nicht existiert (Tippfehler? Mod fehlt in `depends`?) |
| `attempt to call nil` | Funktionsname falsch geschrieben |
| `'end' expected` | Ein `end` für `function`/`if`/`for` fehlt |
| Block ist pink-schwarz | Textur fehlt oder Dateiname falsch |
| Mod erscheint nicht | Ordnername ≠ `name` in `mod.conf`, oder Mod in der Welt nicht aktiviert |
| Crafting funktioniert nicht | Item-Namen tippfehlerhaft (Groß-/Kleinschreibung!) |

### 🎯 Aufgabe
Bug-Jagd: Mache absichtlich Tippfehler (z.B. `core.register_nooode`), starte die Welt, finde den Fehler in `debug.txt`, reparier ihn.

### 🏆 Bonus
Eigener Debug-Befehl `/pos`, der die aktuellen Koordinaten zeigt:
```lua
core.register_chatcommand("pos", {
  description = "Zeigt Deine Position",
  func = function(name, param)
    local player = core.get_player_by_name(name)
    local pos = player:get_pos()
    return true, string.format("Position: X=%.1f, Y=%.1f, Z=%.1f", pos.x, pos.y, pos.z)
  end,
})
```

(`string.format` ist neu: `%.1f` heißt "Kommazahl mit 1 Nachkommastelle".)

---
⬅️ [Unit 37](unit37-globalstep-abm.md) · [Übersicht](README.md) · ➡️ [Unit 39: Magie-Mod Teil 1](unit39-magie-mod-teil1.md)
