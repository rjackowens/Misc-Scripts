$ServerList = Get-Content -Path "C:\ServerList.txt"

$ExcelObjects = @()

$ServerList | ForEach-Object {

    $ComputerName = Invoke-Command -ComputerName $_ -ScriptBlock {$env:COMPUTERNAME}
    $Win32 = Get-WmiObject -Computer $_ -Class Win32_OperatingSystem -ErrorAction Continue

    $ExcelObjects += [PSCustomObject] @{

        Server = $ComputerName.PSComputerName
        Version = $Win32.Version
        Build = $Win32.BuildNumber
           
    }
}

$ExcelObjects | Export-Csv -Path "C:\VersionList.csv"