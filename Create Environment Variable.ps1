# Default Scope is Machine; change to User or Process with "Type" Parameter
function New-EnvironmentVariable {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [Parameter(Mandatory=$true)]
        [string]$Value,
        [string]$Type = "Machine"
        )
    [Environment]::SetEnvironmentVariable($Name, $Value, $Type)
    }

New-EnvironmentVariable -Name NewSystemVar -Value Test
