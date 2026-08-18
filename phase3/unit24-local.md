# 🔧 Unit 24: `local` in Mods — jetzt wird's ernst

## Was lernen wir?
Die Regel kennst Du seit Phase 1: **Variablen immer mit `local` deklarieren.** Bis jetzt war das eine gute Angewohnheit. In Mods ist es **überlebenswichtig** — und hier siehst Du endlich, warum.

### Warum ist es jetzt so wichtig?
In Phase 1+2 lief Dein Code allein. Jetzt teilst Du Dir die Lua-Welt mit **allen anderen Mods** — Mineclonia allein bringt über hundert mit. Eine Variable **ohne** `local` ist **global**: Jede Mod kann sie sehen und überschreiben.

Stell Dir vor, Deine Mod benutzt eine globale Variable `zaehler` — und irgendeine andere Mod auch. Dann pfuschen sich beide gegenseitig in die Daten. Solche Bugs sind fies zu finden, weil Deine Mod alleine perfekt funktioniert.

### Faustregel
**Immer `local` davor.** Außer Du willst absichtlich etwas allen Mods bereitstellen — und das brauchst Du noch nicht.

### Beispiel
```lua
local begruessungen = 0

core.register_on_joinplayer(function(player)
  begruessungen = begruessungen + 1
  local name = player:get_player_name()
  core.chat_send_all("" .. name .. " (Beitritt Nr. " .. begruessungen .. ")")
end)
```

Beachte: `begruessungen` wird **oben in der Datei** mit `local` angelegt. Die Funktion darin darf sie trotzdem benutzen und verändern — sie "sieht" alles, was über ihr deklariert wurde.

## ⚔️ Übungsquests

### 🎯 Aufgabe
Erweitere Deine `hallowelt`-Mod um einen Zähler, der jeden Beitritt mitzählt und in der Begrüßung anzeigt.

### 🏆 Bonus
Wenn Du den Server neu startest, fängt der Zähler wieder bei 0 an. Warum? Was müsste man theoretisch tun, damit er weiterzählt? (Darauf kommen wir am Ende zurück — Stichwort "Mod Storage".)

---
⬅️ [Unit 23](unit23-chat-begruessung.md) · [Übersicht](README.md) · ➡️ [Unit 25: Chat-Befehle](unit25-chat-befehle.md)
