# This script gets the WINS primary and secondary server for all machines on the domain

Get-ADComputer -Filter * -Properties * | Select-Object Name, OperatingSystem -Unique |
ForEach-Object {
    $wins = Get-WmiObject win32_networkadapterconfiguration -ComputerName $_.Name | Where-Object IPEnabled -eq $true | Select-Object WINSPrimaryServer, WINSSecondaryServer | Out-String 
    Write-Host ($_.Name) ($wins)
}