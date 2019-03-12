$ComputerName = hostname
$ServiceName = "vstsagent.organization." + $ComputerName

$Service = Get-Service -Name $ServiceName 

if ($Service.Status -ne "Running") {
    $Service | Start-Service
    }
