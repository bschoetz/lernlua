# 🚪 Unit 5: Türen mit Redstone — `if` und `else`

## Was lernen wir?
Manchmal soll das Programm entscheiden. Wie eine Druckplatte vor einer Tür: *Wenn* ein Spieler draufsteht, *dann* öffnet die Tür. Sonst bleibt sie zu.

### 🧪 Experiment: Stell Lua eine Frage
Bevor wir Türen bauen, probier mal das hier aus:

```lua
print(5 > 3)
print(1 > 100)
print(7 == 7)
```

Lua antwortet: `true`, `false`, `true`. Das heißt **wahr**, **falsch**, **wahr**.

Eine **Bedingung** ist also nichts Geheimnisvolles — es ist einfach eine **Frage, die Lua mit wahr oder falsch beantwortet**. Und genau solche Fragen stellen wir gleich unseren Druckplatten.

### ⚖️ Die Vergleichszeichen

| Zeichen | Die Frage | Beispiel |
|---------|-----------|----------|
| `==` | Ist es gleich? | `7 == 7` → wahr |
| `~=` | Ist es ungleich? | `3 ~= 5` → wahr |
| `<` | Ist links kleiner? | `3 < 10` → wahr |
| `>` | Ist links größer? | `3 > 10` → falsch |
| `<=` | Kleiner oder gleich? | `5 <= 5` → wahr |
| `>=` | Größer oder gleich? | `4 >= 9` → falsch |

**Das Krokodil hilft Dir bei `<` und `>`:** Du kennst das aus der Schule — das Krokodilmaul ist gierig und schnappt immer nach der **größeren** Zahl. Bei `3 < 10` zeigt das offene Maul zur 10. So merkst Du Dir die Richtung ganz von selbst.

> **⚠️ Ein `=` oder zwei `==`? Riesiger Unterschied!**
>
> - `herzen = 10` — **ein** Gleichheitszeichen ist ein **Befehl**: "Leg die 10 in den Slot `herzen`!" (kennst Du aus Unit 2)
> - `herzen == 10` — **zwei** Gleichheitszeichen sind eine **Frage**: "Ist in `herzen` eine 10?"

Wenn Du in einer Bedingung aus Versehen nur ein `=` schreibst, meckert Lua. Das passiert **jedem** am Anfang — jetzt weißt Du schon, woran es liegt.

> 💡 **Tastatur-Tipp:** Die Schlange `~` für "ungleich" tippst Du mit **AltGr + `+`** (die Taste rechts neben dem Ü).

## 🔘 Die Druckplatte: `if` ... `then` ... `else` ... `end`
```lua
if BEDINGUNG then
  -- Tür geht auf: mach das hier
else
  -- Tür bleibt zu: mach stattdessen das hier
end
```

- `if` ist die Druckplatte: Sie prüft die Frage.
- `then` — bei **wahr** geht die Tür auf, und der Code dahinter läuft.
- `else` — bei **falsch** läuft stattdessen dieser Teil. (Den kannst Du auch weglassen, wenn bei falsch einfach nichts passieren soll.)
- `end` ist wichtig — das schließt den Block ab, wie das Schließen einer Truhe.

### Beispiel
```lua
local herzen = 3

if herzen <= 2 then
  print("ACHTUNG: Wenig Leben! Iss was!")
else
  print("Alles okay, weiter abenteuern!")
end
```

Ändere die 3 mal in eine 1 und starte neu — jetzt geht die andere Tür auf. Genau so testet man beide Wege!

## ⚔️ Übungsquests

### 🎯 Quest 5.1: Der Hunger-Warner
Schreibe ein Programm mit einer Variable `hunger` (Wert 0 bis 10, der Nutzer muss die Zahl eingeben):

- Bei 3 oder weniger antwortet das Programm: "Schnell, iss ein Steak!"
- Sonst antwortet es: "Alles gut, weiter geht's!"

Teste **beide** Türen, indem Du es mehrfach startest und verschiedene Werte eingibst.

> Tipp: Die Eingabe kommt als **Schild** an (Unit 4½!) — vor dem Vergleichen erst durch den Schmelzofen, sonst beschwert sich Lua: *attempt to compare string with number*.

### 🏆 Bonus-Quest: Creeper-Alarm
Ein Creeper-Warn-Programm misst, wie viele Blöcke der Creeper entfernt ist. Du musst hier kein Programm schreiben, nur zwei Fragen beantworten:

- Bei weniger als 5 Blöcken soll das Programm Dich warnen: "RENN WEG!". Welches Vergleichszeichen brauchst Du hier?
- Bei genau 3 Blöcken Abstand fängt der Creeper zu blinken an und explodiert bald. Mit welchem Vergleichszeichen kann Dein Programm messen, ob der Creeper genau 3 Blöcke entfernt ist?

---
⬅️ [Unit 4½: Der Schmelzofen](unit04b-schmelzofen.md) · [Übersicht](README.md) · ➡️ [Unit 5½: Der Türen-Gang](unit05b-tueren-gang.md)
