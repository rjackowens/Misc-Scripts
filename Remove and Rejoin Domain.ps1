# This script removes and rejoins the hunter.com domain without requiring a restart

Remove-Computer -ComputerName $env:computername -Credential jowens@hunter.com
Add-Computer -domainname hunter.com -Credential jowens@hunter.com 

$input = Read-Host("Restart PC? Enter Y or N")

if ($input.ToUpper() -eq "Y" -or $input -eq "Yes") {
    Write-Output "Restarting"
    Restart-Computer
}

else {
    Write-Output "Exiting program"
}
