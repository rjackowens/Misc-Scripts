# This script lists all AD groups for a user in a single copyable line to enter into AD. The results are outputted to C:\groups.txt

Import-Module ActiveDirectory

$prompt = Read-Host "Enter 1 for Engineering Domain. Enter 2 for Hunter.com Domain"
$username = Read-Host "Enter Username"

if ($prompt -eq "1") {
(Get-ADPrincipalGroupMembership $username -Server engineering.hunter.com).name -join ';' | Format-Table -AutoSize | Out-File -filepath C:\groups.txt -Width 5000
}
elseif ($prompt -eq "2") {
(Get-ADPrincipalGroupMembership $username -Server hunter.com).name -join ';' | Format-Table -AutoSize | Out-File -filepath C:\groups.txt -Width 5000
}