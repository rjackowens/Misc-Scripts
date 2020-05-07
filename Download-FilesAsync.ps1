$downloadFolder = "C:\Users\$env:USERNAME\Downloads\Docker_Tools"
if (!(Test-Path $downloadFolder -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $downloadFolder
}

$files = @(
    @{name="Docker Desktop"; url="https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe"; path="$downloadFolder\DockerDesktop.exe"}
    @{name=".NET CLI"; url="https://dot.net/v1/dotnet-install.ps1"; path="$downloadFolder\dotnet-install.ps1"}
    @{name="AWS PowerShell"; url="https://sdk-for-net.amazonwebservices.com/ps/v4/latest/AWSPowerShell.zip"; path="$downloadFolder\AWSPowerShell.zip"}
)

$files | ForEach-Object {
        
    Start-Job -name $_.name -ScriptBlock {

        param($URL, $PATH)
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Invoke-WebRequest -uri $URL -OutFile $PATH  

    } -ArgumentList $_.url, $_.path

}

function Write-Log {

    param ($title)
    $timestamp = Get-Date -UFormat "%r - %m/%d/%Y"
    Write-Host "`n -------------------" $title "------------------- `n" -ForegroundColor Green
    Write-Output $timestamp " -------------------" $title "------------------- `n" | Out-File "$downloadFolder\log.txt" -Append -Force

}

Write-Log "Downloading..."
Get-Job | Wait-Job
Write-Log "Downloads complete" -ForegroundColor Green
