# This script lists DNS information from all computers within Active Directory

Import-Module ActiveDirectory

$Workstations = Get-ADComputer -Filter * | ForEach-Object {
$DNS = Get-DnsClientServerAddress -CimSession $_.DNSHostName 
$ComputerName = Get-WmiObject Win32_Computersystem -ComputerName $_.DNSHostName | Select-Object Name

Write-Host "DNS:" $DNS.DNSDomain "Computer Name: " $ComputerName
}