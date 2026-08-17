#!/usr/bin/env python3
"""Rendert den kompletten Markdown-Kurs in eine einzelne HTML-Datei (kurs.html).

Aufruf:  python3 baue-kurs.py
Danach:  kurs.html im Browser öffnen (Doppelklick oder xdg-open kurs.html)

Braucht nur python-markdown und pygments (beide über pacman installiert:
python-markdown, python-pygments).
"""

import base64
import re
from pathlib import Path

import markdown
from pygments.formatters import HtmlFormatter

BASIS = Path(__file__).parent
AUSGABE = BASIS / "kurs.html"

# Eingebettete Schriften (liegen als Subsets in fonts/, erzeugt mit pyftsubset).
# Atkinson Hyperlegible Next: vom Braille Institute für maximale Lesbarkeit
# entworfen — I, l und 1 sind klar unterscheidbar. Hack: dito für Code.
SCHRIFTEN = [
    ("atkinson-regular.woff", "Atkinson Hyperlegible Next", 400, "normal"),
    ("atkinson-bold.woff",    "Atkinson Hyperlegible Next", 700, "normal"),
    ("atkinson-italic.woff",  "Atkinson Hyperlegible Next", 400, "italic"),
    ("hack-regular.woff",     "Hack", 400, "normal"),
    ("hack-bold.woff",        "Hack", 700, "normal"),
    ("hack-italic.woff",      "Hack", 400, "italic"),
]


def font_css() -> str:
    """@font-face-Regeln mit base64-eingebetteten WOFF-Dateien.

    Fehlende Dateien werden still übersprungen — die Seite fällt dann auf
    System-Schriften zurück.
    """
    regeln = []
    for datei, familie, gewicht, stil in SCHRIFTEN:
        pfad = BASIS / "fonts" / datei
        if not pfad.exists():
            continue
        b64 = base64.b64encode(pfad.read_bytes()).decode("ascii")
        regeln.append(
            f"@font-face {{ font-family: '{familie}'; font-weight: {gewicht}; "
            f"font-style: {stil}; "
            f"src: url(data:font/woff;base64,{b64}) format('woff'); }}"
        )
    return "\n".join(regeln)

# Reihenfolge der Kapitel. Unit-Dateien werden pro Phase automatisch
# einsortiert — neue Units brauchen hier keine Änderung.
def kapitel_liste():
    dateien = [Path("README.md"), Path("setup.md")]
    for phase in ["phase1", "phase2", "phase3"]:
        dateien.append(Path(phase) / "README.md")
        dateien.extend(sorted(
            p.relative_to(BASIS) for p in (BASIS / phase).glob("unit*.md")
        ))
    dateien.append(Path("loesungen/README.md"))
    return [p for p in dateien if (BASIS / p).exists()]


def abschnitt_id(pfad: Path) -> str:
    """phase1/unit01-hallo-overworld.md -> phase1-unit01-hallo-overworld"""
    return pfad.with_suffix("").as_posix().replace("/", "-")


def links_umschreiben(text: str, quelle: Path, bekannte_ids: set) -> str:
    """Interne .md-Links auf Anker innerhalb der einen HTML-Seite umbiegen."""
    def ersetze(m):
        beschriftung, ziel = m.group(1), m.group(2)
        ziel_pfad = ziel.split("#")[0]
        # relativ zur Quelldatei auflösen und normalisieren
        aufgeloest = (quelle.parent / ziel_pfad)
        teile = []
        for teil in aufgeloest.as_posix().split("/"):
            if teil == "..":
                if teile:
                    teile.pop()
            elif teil not in ("", "."):
                teile.append(teil)
        ziel_id = abschnitt_id(Path(*teile)) if teile else ""
        if ziel_id in bekannte_ids:
            return f"[{beschriftung}](#{ziel_id})"
        return m.group(0)  # externe/unbekannte Links unverändert lassen
    return re.sub(r"\[([^\]]*)\]\(([^)#]+\.md(?:#[^)]*)?)\)", ersetze, text)


def vorverarbeiten(text: str, quelle: Path, bekannte_ids: set) -> str:
    zeilen = []
    for zeile in text.splitlines():
        # Vor/Zurück-Navigation entfernen — die Seitenleiste übernimmt das
        if zeile.strip().startswith(("⬅️", "➡️")):
            continue
        zeilen.append(zeile)
    # übrig gebliebene Trennlinie am Ende wegräumen
    while zeilen and zeilen[-1].strip() in ("", "---"):
        zeilen.pop()
    return links_umschreiben("\n".join(zeilen), quelle, bekannte_ids)


def titel_aus(text: str, pfad: Path) -> str:
    """Kurzen Seitenleisten-Titel aus der ersten Überschrift bauen."""
    m = re.search(r"^#\s+(.+)$", text, re.MULTILINE)
    titel = m.group(1).strip() if m else pfad.stem
    # führende Emoji/Sonderzeichen abschneiden
    titel = re.sub(r"^[^\w\"„]+", "", titel)
    # "Unit 3: Rechnen wie ein ... — for-Schleifen" -> vor dem Gedankenstrich abschneiden
    titel = titel.split(" — ")[0].strip()
    return titel


def html_konvertieren(md_text: str) -> str:
    return markdown.markdown(md_text, extensions=[
        "extra",          # Tabellen, Code-Blöcke mit ```
        "codehilite",     # Syntax-Highlighting über pygments
        "sane_lists",
    ], extension_configs={
        "codehilite": {"guess_lang": False, "css_class": "codehilite"},
    })


def checkboxen_aktivieren(html: str) -> str:
    """- [ ] Listenpunkte in echte, anklickbare Checkboxen verwandeln.

    Der Haken wird per JavaScript im Browser (localStorage) gespeichert.
    """
    zaehler = [0]
    def ersetze(m):
        zaehler[0] += 1
        return f'<li class="task"><input type="checkbox" data-task="{zaehler[0]}"> '
    html = re.sub(r"<li>\[ \]\s*", ersetze, html)
    html = re.sub(r"<li>\[x\]\s*", ersetze, html)  # falls mal im Markdown abgehakt
    return html


VORLAGE = """<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>lernlua — Lua lernen für Luanti-Modding</title>
<style>
__FONTS__
:root {
  --bg: #ffffff; --fg: #24292f; --muted: #57606a;
  --sidebar-bg: #f6f8fa; --border: #d0d7de; --link: #0969da;
  --code-bg: #f6f8fa; --accent: #1a7f37; --mark: #fff8c5;
}
@media (prefers-color-scheme: dark) {
  :root {
    --bg: #0d1117; --fg: #e6edf3; --muted: #8d96a0;
    --sidebar-bg: #161b22; --border: #30363d; --link: #4493f8;
    --code-bg: #161b22; --accent: #3fb950; --mark: #4d3800;
  }
}
* { box-sizing: border-box; }
body {
  margin: 0; background: var(--bg); color: var(--fg);
  font-family: "Atkinson Hyperlegible Next", system-ui, -apple-system, "Segoe UI", sans-serif;
  font-size: 16px; line-height: 1.6;
}
#layout { display: flex; min-height: 100vh; }
nav {
  width: 270px; flex-shrink: 0; background: var(--sidebar-bg);
  border-right: 1px solid var(--border);
  position: sticky; top: 0; height: 100vh; overflow-y: auto;
  padding: 1rem 0.75rem; font-size: 0.86rem;
}
nav h1 { font-size: 1.05rem; margin: 0.2rem 0.5rem 0.8rem; }
nav details { margin-bottom: 0.4rem; }
nav summary {
  cursor: pointer; font-weight: 600; padding: 0.25rem 0.5rem;
  border-radius: 6px; list-style-position: inside;
}
nav summary:hover { background: var(--border); }
nav ul { list-style: none; margin: 0.2rem 0; padding-left: 1.1rem; }
nav li { margin: 0; }
nav a {
  display: block; color: var(--fg); text-decoration: none;
  padding: 0.18rem 0.45rem; border-radius: 6px;
}
nav a:hover { background: var(--border); }
nav a.aktiv { background: var(--link); color: #fff; }
main { flex: 1; min-width: 0; padding: 1.5rem 2.5rem 4rem; max-width: 55rem; }
section { scroll-margin-top: 1rem; }
section + section { border-top: 3px double var(--border); margin-top: 3rem; padding-top: 1.5rem; }
h1, h2, h3 { line-height: 1.3; }
h1 { border-bottom: 1px solid var(--border); padding-bottom: 0.3rem; }
a { color: var(--link); }
code {
  background: var(--code-bg); border: 1px solid var(--border);
  border-radius: 5px; padding: 0.1em 0.35em; font-size: 0.9em;
  font-family: "Hack", ui-monospace, "JetBrains Mono", "Fira Code", monospace;
}
.codehilite {
  background: var(--code-bg); border: 1px solid var(--border);
  border-radius: 8px; padding: 0.75rem 1rem; overflow-x: auto; margin: 1rem 0;
}
.codehilite pre { margin: 0; }
.codehilite code { background: none; border: none; padding: 0; font-size: 0.88rem; }
table { border-collapse: collapse; margin: 1rem 0; display: block; overflow-x: auto; max-width: 100%; }
th, td { border: 1px solid var(--border); padding: 0.35rem 0.7rem; text-align: left; }
th { background: var(--sidebar-bg); }
blockquote {
  margin: 1rem 0; padding: 0.5rem 1rem; border-left: 4px solid var(--accent);
  background: var(--sidebar-bg); border-radius: 0 8px 8px 0;
}
blockquote p { margin: 0.3rem 0; }
hr { border: none; border-top: 1px solid var(--border); margin: 2rem 0; }
li.task { list-style: none; margin-left: -1.4rem; }
li.task input { accent-color: var(--accent); margin-right: 0.4rem; transform: scale(1.15); }
li.task:has(input:checked) { color: var(--muted); text-decoration: line-through; }
#menue-knopf { display: none; }
@media (max-width: 800px) {
  #layout { flex-direction: column; }
  nav { position: static; width: 100%; height: auto; max-height: 45vh; }
  main { padding: 1rem; }
}
/* Pygments hell */
__PYGMENTS_HELL__
/* Pygments dunkel */
@media (prefers-color-scheme: dark) {
__PYGMENTS_DUNKEL__
}
</style>
</head>
<body>
<div id="layout">
<nav>
<h1>🎮 lernlua</h1>
__NAVIGATION__
</nav>
<main>
__INHALT__
</main>
</div>
<script>
// Checkliste: Haken im Browser speichern (localStorage)
document.querySelectorAll('li.task input').forEach(function (box) {
  const key = 'lernlua-task-' + box.dataset.task;
  box.checked = localStorage.getItem(key) === '1';
  box.addEventListener('change', function () {
    localStorage.setItem(key, box.checked ? '1' : '0');
  });
});
// Seitenleiste: aktuellen Abschnitt markieren
const navLinks = Array.from(document.querySelectorAll('nav a[href^="#"]'));
const abschnitte = navLinks
  .map(function (a) { return document.getElementById(a.hash.slice(1)); })
  .filter(Boolean);
function markiere() {
  let aktiv = abschnitte[0];
  for (const s of abschnitte) {
    if (s.getBoundingClientRect().top <= 80) aktiv = s;
  }
  navLinks.forEach(function (a) {
    a.classList.toggle('aktiv', a.hash.slice(1) === aktiv.id);
  });
}
document.addEventListener('scroll', markiere, { passive: true });
markiere();
</script>
</body>
</html>
"""


def main():
    dateien = kapitel_liste()
    bekannte_ids = {abschnitt_id(p) for p in dateien}

    abschnitte = []   # (id, phase_gruppe, titel, html)
    for pfad in dateien:
        roh = (BASIS / pfad).read_text(encoding="utf-8")
        if pfad == Path("README.md"):
            titel = "Start"
        elif pfad.name == "README.md" and len(pfad.parts) > 1:
            titel = "Übersicht"
        else:
            titel = titel_aus(roh, pfad)
        md = vorverarbeiten(roh, pfad, bekannte_ids)
        html = checkboxen_aktivieren(html_konvertieren(md))
        gruppe = pfad.parts[0] if len(pfad.parts) > 1 else ""
        abschnitte.append((abschnitt_id(pfad), gruppe, titel, html))

    # Seitenleiste bauen: Wurzel-Dateien einzeln, Phasen als aufklappbare Gruppen
    gruppen_titel = {"phase1": "Phase 1 — Grundlagen",
                     "phase2": "Phase 2 — Abenteuer",
                     "phase3": "Phase 3 — Luanti-Mod",
                     "loesungen": "Musterlösungen"}
    nav, offene_gruppe = [], None
    for sid, gruppe, titel, _ in abschnitte:
        if gruppe != offene_gruppe:
            if offene_gruppe:
                nav.append("</ul></details>")
            if gruppe:
                # phase1 standardmäßig aufgeklappt
                offen = " open" if gruppe == "phase1" else ""
                nav.append(f"<details{offen}><summary>{gruppen_titel.get(gruppe, gruppe)}</summary><ul>")
            offene_gruppe = gruppe or None
        eintrag = f'<a href="#{sid}">{titel}</a>'
        nav.append(f"<li>{eintrag}</li>" if gruppe else f"<ul><li>{eintrag}</li></ul>")
    if offene_gruppe:
        nav.append("</ul></details>")

    inhalt = "\n".join(
        f'<section id="{sid}">\n{html}\n</section>' for sid, _, _, html in abschnitte
    )

    seite = (VORLAGE
             .replace("__FONTS__", font_css())
             .replace("__PYGMENTS_HELL__", HtmlFormatter(style="default").get_style_defs(".codehilite"))
             .replace("__PYGMENTS_DUNKEL__", HtmlFormatter(style="monokai").get_style_defs(".codehilite"))
             .replace("__NAVIGATION__", "\n".join(nav))
             .replace("__INHALT__", inhalt))

    AUSGABE.write_text(seite, encoding="utf-8")
    print(f"✅ {AUSGABE.name} geschrieben ({len(dateien)} Kapitel, {AUSGABE.stat().st_size // 1024} kB)")
    print("   Öffnen mit:  xdg-open kurs.html")


if __name__ == "__main__":
    main()
