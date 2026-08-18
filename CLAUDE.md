# CLAUDE.md

## Worum es hier geht

Ein Lua-Lernkurs, den ein Vater mit seinem Sohn durcharbeitet. Ziel: am Ende
gemeinsam einen eigenen **Luanti/Mineclonia-Mod** bauen. Der Sohn ist im
Grundschulalter — alle Erklärungen müssen ohne weiterführende Mathematik
auskommen (kein "hoch", keine Gleichungen; Teilen mit Rest, Zahlenstrahl und
Einmaleins kennt er aus der Schule und sind gute Anker).

Kurssprache ist Deutsch, Anrede "Du". Die Beispielwelt ist durchgehend
Minecraft/Luanti.

## Struktur

- `setup.md` — Werkzeuge: **VSCodium + lokales Lua (5.5) im Terminal**.
  Kein Replit (bewusst abgeschafft).
- `phase1/` bis `phase3/` — eine Markdown-Datei pro Unit, **durchgehend
  nummeriert 1–40** (Phase 1: 1–10, Phase 2: 11–20, Phase 3: 21–40).
  Quest-Nummern folgen der Unit-Nummer (Unit 17 → Quest 17.1).
  Dazwischen gibt es **½-Units** (Datei `unitNNb-*.md`, Titel "Unit N½",
  Quest N½.1): kleinere Sitzungen, damit eine Unit ohne Erschöpfung in
  einem Rutsch schaffbar ist — eine Unit = ein Konzept + ein Experiment +
  eine Quest. Der Build sortiert `unit*.md` alphabetisch, `NNb` landet
  also automatisch hinter `NN`.
- `loesungen/` — Musterlösungen: `.lua`-Dateien je Unit (Phase 1+2),
  lauffähige Mod-Ordner `hallowelt`/`meinemod`/`magie` (Phase 3).
  Texturen (PNGs) fehlen absichtlich — Pixel-Art malen ist Teil des Kurses.
- `pics/` — Bild-Originale (groß, unbearbeitet). Fürs Einbinden mit
  `python3 bild-aufbereiten.py pics/NAME.jpeg phaseN/` verkleinern
  (1600 px, komprimiert, ohne Metadaten) und die erzeugte `.jpg` aus dem
  Phasen-Ordner im Markdown referenzieren — der Build bettet sie als
  data-URI in die kurs.html ein.
- `kurs.html` — der ganze Kurs als eine HTML-Seite, **wird versioniert**.
  Nach jeder Markdown-Änderung neu bauen: `python3 baue-kurs.py`
  (braucht python-markdown, pygments; bettet die Fonts aus `fonts/` ein).

## Didaktische Konventionen (wichtig!)

**Unit-Aufbau:** Erklärung → 🧪-Experiment ("erleben vor erklären", gern auch
absichtlich kaputtmachen) → 🎯-Quest → 🏆-Bonus-Quest. Mega-Projekte (Unit 10,
20, 39/40) werden in **spielbaren Ausbaustufen** gebaut, nie als
Abtipp-Vorlage. Rückverweise auf frühere Units statt Neuerklärung.

**Durchgängige Metaphern** (nicht wechseln, sie bauen aufeinander auf):

| Konzept | Metapher |
|---------|----------|
| Variable | Inventar-Slot; `=` ist ein Befehl ("leg rein"), keine Gleichung |
| String | Schild (Anführungszeichen = wortwörtlich; ohne = Name zum Nachschlagen) |
| `tonumber` | Schmelzofen (Schild rein, Zahl raus) |
| `nil` | "nichts" — roter Faden ab Unit 4 (Ofen, Zähler, leerer Slot) |
| `if`/`elseif` | Druckplatte/Türen-Gang, von oben nach unten, erste offene Tür gewinnt |
| Eingabe-Prüfung | "Türsteher" (steht vor der Rechnung) |
| `for`-Zähler `i` | Rundenzähler (Profis nennen ihn immer `i`) |
| Table | Truhe mit nummerierten Slots; parallele Tables = "Zwillings-Truhen" |
| Funktion | Crafting-Rezept: definieren = ins Buch schreiben, aufrufen = craften |
| Parameter / `return` | Lücke im Rezept / Ausgabe-Slot der Werkbank |
| `local` | Profi-Stempel — wird erst ab **Unit 3** gelehrt (Unit 1–2 ohne!) |

**Keine Emojis/Sonderzeichen in Codebeispielen** — der Sohn kann sie nicht
tippen, und der Luanti-Chat rendert sie nicht. Ersatz: Bewertungs-Sterne
(`***`/`**`/`*`), `ACHTUNG:`, `->` statt `→`, `-` statt Gedankenstrich.
Emojis in Überschriften und Erklärtext sind okay (werden nur gelesen).

**Technisch korrekt für Lua 5.5:** `//` und `%` als Team einführen, `/` gibt
immer Kommazahl (Punkt statt Komma!), `math.random` ist auto-geseedet
(`randomseed` nur als Kompatibilitätshinweis), `"12" + 1` funktioniert per
Koerzion — nicht behaupten, dass es abstürzt (Vergleiche und `..` sind die
ehrlichen Gegenbeispiele). Phase 3 nutzt das moderne `core.*`-API.

## Arbeitsweise

1. Für Unit-Überarbeitungen: **erst Vorschlag machen, auf Okay warten**,
   dann umsetzen.
2. Musterlösungen immer mitziehen und **ausführen/testen** (`lua`, `luac -p`;
   interaktive Programme mit gepipter Eingabe, auch Fehlerpfade).
3. `python3 baue-kurs.py` vor jedem Commit, `kurs.html` gehört mit hinein.
4. Committen und pushen, wenn der Nutzer es sagt (macht er praktisch immer);
   Commit-Messages auf Deutsch.
