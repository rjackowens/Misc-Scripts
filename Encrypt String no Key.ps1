<#
.SYNOPSIS
    Creates DPAPI-encrypted system environment variable from plain text string.
    Use ProtectedData.Unprotect to decrypt data in C# Program.
#>

$SecureString = Read-Host "Enter Password" -AsSecureString

# Converts secure string to DPAPI Encrypted String
$EncryptedPassword = ConvertFrom-SecureString -SecureString $SecureString 

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
