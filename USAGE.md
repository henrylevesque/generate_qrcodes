run.ps1 - convenience helper

This repository includes a helper PowerShell script `run.ps1` that automates:

- creating the `.venv` virtual environment (if missing)
- activating the venv for the script
- upgrading pip and installing `requirements.txt`
- running `generate_qrcodes.py`

Basic usage (from the repository root):

```powershell
.\run.ps1
```

If you want the venv to remain active afterwards (so you can run further
commands interactively), dot-source the helper instead:

```powershell
. .\run.ps1
```

Notes and flags:

- To only install dependencies (skip running the generator):
  ```powershell
  .\run.ps1 -InstallOnly
  ```

- To skip the install step (assume dependencies are already installed):
  ```powershell
  .\run.ps1 -NoInstall
  ```

- If PowerShell blocks scripts, allow them for this session:
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
  ```

- If you prefer not to activate the venv, you can always run the venv python
  directly:
  ```powershell
  .\.venv\Scripts\python.exe generate_qrcodes.py
  ```

This helper is intended for local use only; it will not push anything to
remotes.