# This script kills the ShoreTel process, uninstalls the program, and reinstalls the program via a network folder location 

# Elevates Script to Run as Admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Sets Script Policy to Run on Unsigned Machines
Set-ExecutionPolicy RemoteSigned

# Kill ShoreTel Process
$shortel_running = Get-Process ShoreTel -ErrorAction SilentlyContinue
if ($shortel_running) {
$shortel_running.CloseMainWindow()
}

# Uninstall ShoreTel
$app = Get-WmiObject -Class Win32_Product | Where-Object { 
    $_.Name -match "ShoreTel Communicator" 
}

$app.Uninstall()

# Install ShoreTel
CMD /C "\\server\example\shoretel\setup.exe" 