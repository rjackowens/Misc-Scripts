# This script returns all local admin users from all computers in Active Directory

Import-Module ActiveDirectory

$ServersOutput = Get-ADComputer -Filter * | Select-Object -Property DNSHostName 
 
$ServersOutput.DNSHostName | ForEach-Object {
Write-Host "Server Name: $_
"
Invoke-Command -ComputerName $_ -ScriptBlock {
Get-LocalGroupMember -Group "Administrators" | Format-Table -Wrap
}
}