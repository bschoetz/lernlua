#!/usr/bin/env python3
"""Bereitet Originalbilder aus pics/ für den Kurs auf.

Aufruf:   python3 bild-aufbereiten.py pics/unit01_header.jpeg phase1/
          python3 bild-aufbereiten.py pics/foo.jpeg phase2/ --breite 800

Verkleinert auf die Zielbreite (Standard 1600 px = 2x-Auflösung für die
~800 px breite Inhaltsspalte), komprimiert als progressives JPEG und
wirft Metadaten (EXIF etc.) weg. Die Kopie landet als .jpg im
Zielordner; die Originale in pics/ bleiben unangetastet.
"""

import sys
from pathlib import Path

from PIL import Image

BREITE = 1600      # Zielbreite in Pixeln
QUALITAET = 80     # JPEG-Qualität


def aufbereiten(quelle: Path, ziel: Path, breite: int = BREITE) -> Path:
    if ziel.is_dir():
        ziel = ziel / (quelle.stem + ".jpg")
    bild = Image.open(quelle)
    if bild.mode != "RGB":          # PNG mit Transparenz o.ä.
        bild = bild.convert("RGB")
    if bild.width > breite:
        hoehe = round(bild.height * breite / bild.width)
        bild = bild.resize((breite, hoehe), Image.LANCZOS)
    # ohne exif=... gehen die Metadaten beim Speichern verloren - gewollt
    bild.save(ziel, "JPEG", quality=QUALITAET, optimize=True, progressive=True)
    vorher = quelle.stat().st_size // 1024
    nachher = ziel.stat().st_size // 1024
    print(f"✅ {ziel} — {bild.width}x{bild.height}, {vorher} kB -> {nachher} kB")
    return ziel


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    breite = BREITE
    if "--breite" in sys.argv:
        breite = int(sys.argv[sys.argv.index("--breite") + 1])
        args = args[:-1] if args and args[-1] == str(breite) else args
    if len(args) != 2:
        print(__doc__)
        sys.exit(1)
    aufbereiten(Path(args[0]), Path(args[1]), breite)


if __name__ == "__main__":
    main()
