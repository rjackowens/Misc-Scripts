function Dotnet-Push {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Package
        )
    $Arguments = "nuget push " + $Package + " -k {12345...} -s https://localhost:5000"
    Start-Process dotnet.exe -ArgumentList $Arguments
    }

$Directory = $env:SYSTEM_ARTIFACTSDIRECTORY + "\_Extensions\drop"

$Package = Get-ChildItem -Path $Directory  -Filter *.nupkg -recurse

$Package.FullName | ForEach-Object {
    Write-Host "Publishing package" $_
    Dotnet-Push -Package $_
    }
