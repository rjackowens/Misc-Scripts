$ErrorActionPreference = "Stop"
Set-ExecutionPolicy Bypass -Scope Process -Force

$logsPath = [System.Environment]::ExpandEnvironmentVariables("C:\Users\%username%\Documents\Logs")
$logsFile = $logsPath + "\output.txt"

if (!(Test-Path($logsPath))) {
    mkdir $logsPath | Out-Null
}

function Write-Log {
    param ($_self)
    $timestamp = Get-Date -UFormat "%r - %m/%d/%Y"
    Write-Host "`n -------------------" $_self "------------------- `n" -ForegroundColor Green
    Write-Output $timestamp " -------------------" $_self "------------------- `n" | Out-File $logsFile -Append -Force
}

Write-Log "Creating test directory..."
if (!(Test-Path("C:\Test"))) {
    mkdir "C:\Test" | Out-Null
}

Write-Log "Creating test user..."
New-LocalUser -Name "TestUser" -Password "Test" -AccountNeverExpires

Write-Log "Installing Chocolatey..."
try {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
catch {
    throw "Unable to install Chocolatey."
    Write-Log "Exit code" $Error
}

Write-Log "Installing Nuget (Latest)..."
choco install nuget.commandline --confirm

Write-Log "Installing .NET Framework (Latest)..."
choco install dotnetfx --confirm

Write-Log "Installing .NET Core SDK (Latest)"
choco install dotnetcore-sdk --confirm

Write-Log "Installing NodeJS (Latest)..."
choco install nodejs --confirm