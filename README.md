Generate QR codes (SVG + PNG)

This small tool generates QR codes from a dictionary of URLs. It uses `segno` to
produce SVG and PNG output (Pillow is used by segno for PNG output).

Quick start

1. Create a virtual environment and install dependencies:

```powershell
python -m venv .venv; .\.venv\Scripts\Activate.ps1; pip install -r requirements.txt
```

2. Edit `generate_qrcodes.py` to add or change URLs.
3. Run:

```powershell
python generate_qrcodes.py
```

Output files are written to the `qrcodes/` folder.

Running on GitHub

You can push this folder as its own repository. There's a GitHub Actions workflow
that runs the script on push to `main` to validate it runs (doesn't push artifacts).
For interactive running in the cloud, use GitHub Codespaces or a self-hosted runner.
