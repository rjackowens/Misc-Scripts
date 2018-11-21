# This script provides quick copy/paste deletion for any network folder path

# Prompts User to Enter File Path
$filepath = Read-Host "Enter UNC File Path"

if (Test-Path $filepath) {
    Write-Host "File Path Exists. Removing Item..." -ForegroundColor Green
}
else {
    Write-Host "ERROR. FILE PATH NOT FOUND" -ForegroundColor Red
    Write-Host " " # Line Break
}

# Removes Item
Remove-Item -Path $filepath
Write-Host "File" $filepath "Was Removed Successfully" -ForegroundColor Green
