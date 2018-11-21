@REM This script automatically runs unsigned PowerShell scripts within the current folder
@ECHO OFF
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command & '%~dpn0.ps1'
PAUSE