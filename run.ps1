#!/usr/bin/env pwsh
<#
run.ps1 - convenience script to create / activate the virtualenv,
install dependencies and run the QR code generator.

Usage (from repo root):
  .\run.ps1            # run the script (may run in a child scope)
  . .\run.ps1          # dot-source to run in the current shell and keep venv active

Notes:
 - If your PowerShell blocks scripts, run:
     Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
   before running this script.
 - Dot-sourcing (leading dot + space) runs the script in the current shell so
   the virtual environment activation will remain active after the script
   completes. Running the script normally executes it in a child scope and the
   activation will only apply inside the script.
#>

param(
    [switch]$InstallOnly,
    [switch]$NoInstall
)

Write-Output "run.ps1: starting (InstallOnly=$InstallOnly, NoInstall=$NoInstall)"

$venvPath = Join-Path $PSScriptRoot '.venv'

if (-not (Test-Path $venvPath)) {
    Write-Output "Creating virtual environment at $venvPath..."
    python -m venv $venvPath
}

# Activate the venv in this script's scope (dot-source the activation script)
$activate = Join-Path $venvPath 'Scripts\Activate.ps1'
if (-not (Test-Path $activate)) {
    Write-Error "Activation script not found at $activate"
    exit 1
}

Write-Output "Activating virtual environment..."
. $activate

if (-not $NoInstall) {
    Write-Output "Upgrading pip and installing requirements..."
    python -m pip install --upgrade pip
    pip install -r "$PSScriptRoot\requirements.txt"
}

if (-not $InstallOnly) {
    Write-Output "Running generator..."
    python "$PSScriptRoot\generate_qrcodes.py"
}

Write-Output "run.ps1: finished. To activate venv in your interactive shell run: .\ .venv\Scripts\Activate.ps1"
