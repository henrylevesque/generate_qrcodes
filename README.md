# generate_qrcodes

Small utility to generate SVG and PNG QR codes from a set of URLs.

This repository contains a tiny Python script that uses segno to create
vector (SVG) and raster (PNG) QR codes and writes them into the `qrcodes/`
directory inside the project.

## Contents

- `generate_qrcodes.py` — main script. Edit the `URLS` mapping to change which
  QR codes are produced.
- `requirements.txt` — runtime dependencies for the project.
- `LICENSE` — license for this repository.
- `qrcodes/` — output folder where SVG and PNG files are written.

## Quickstart

1. Create a virtual environment (recommended) and install dependencies:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

2. Edit `generate_qrcodes.py` and update the `URLS` dictionary with the keys
   (used as filenames) and values (the target URLs).

3. Run the script from the project root:

```powershell
python generate_qrcodes.py
```

4. Find generated files in the `qrcodes/` folder. Each entry produces both an
   SVG and a PNG file.

## Configuration

- `SCALE` — controls the size of the generated PNG files (pixel multiplier).
- `BORDER` — quiet zone for the QR code (number of modules).

Open `generate_qrcodes.py` for more details and to adjust parameters.

## Dependencies

Dependencies are listed in `requirements.txt`. The script uses:

- segno — QR code generator (pure Python)
- Pillow — used by segno to write PNG files

Install them with `pip install -r requirements.txt` (see Quickstart above).

## License

This project is covered by the terms in the `LICENSE` file in this repository.
See: `LICENSE`.