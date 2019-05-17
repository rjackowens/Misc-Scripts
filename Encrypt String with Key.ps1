<#
.SYNOPSIS
    Creates AES-encrypted system environment variable from plain text string.
    Writes decryption key to console. 
#>

#Create Random Decryption Key
Function Create-Key {
     $RKey = @()
     For ($i=1; $i -le 16; $i++) {
        [Byte]$RByte = Get-Random -Minimum 0 -Maximum 256
        $RKey += $RByte
     }
     $RKey
}

$Key = Create-Key

$SecureString = Read-Host "Enter Password" -AsSecureString

# Converts secure string to AES Encrypted String
$EncryptedPassword = ConvertFrom-SecureString -SecureString $SecureString -Key $Key

function New-EnvironmentVariable {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [string]$Value,
        [string]$Scope = "Machine"
        )
    [Environment]::SetEnvironmentVariable($Name, $Value, $Scope)
    }

$EnvVarName = Read-Host "Enter Environment Variable Name"
New-EnvironmentVariable -Name $EnvVarName -Value $EncryptedPassword

Write-Host "Decryption Key:" $Key -NoNewline `n
