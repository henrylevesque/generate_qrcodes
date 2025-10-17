"""Generate QR codes (SVG + PNG) for a set of URLs.

Usage:
  python generate_qrcodes.py

This script uses segno (pure-Python) and Pillow (for PNG output). It writes
SVG and PNG files into qrcodes/ (inside this folder).
"""
from pathlib import Path
import segno

OUT_DIR = Path(__file__).parent / "qrcodes"
OUT_DIR.mkdir(parents=True, exist_ok=True)

URLS = {
    # Copy or edit entries here. Keys are used as filenames (avoid special chars).
    "github profile": "https://github.com/henrylevesque/",
}

# Visual parameters
SCALE = 12  # pixel size multiplier for PNG; SVG remains vector
BORDER = 0  # quiet zone modules


def main():
    created = []
    for name, url in URLS.items():
        # sanitize filename
        safe_name = "".join(c if c.isalnum() or c in "-_." else "-" for c in name)
        svg_path = OUT_DIR / f"{safe_name}.svg"
        png_path = OUT_DIR / f"{safe_name}.png"

        qr = segno.make(url, micro=False)
        # Save SVG (vector)
        qr.save(svg_path, scale=1, border=BORDER)
        # Save PNG (bitmap)
        qr.save(png_path, scale=SCALE, border=BORDER, kind='png')

        created.append((svg_path, png_path))
        print(f"Created {svg_path} and {png_path}")

    print(f"Done. {len(created)} QR codes written to: {OUT_DIR.resolve()}")


if __name__ == "__main__":
    main()
