# Testing various use cases for splatting

$num = 3
$num_is = "Number is"
$sample_query = @{Query = Get-Service -Name Spooler -ComputerName localhost}

$color = @{
    ForegroundColor = "Black"
    BackgroundColor = "White"
}
function Write-Host-Decorated {
    param($x)
    Write-Host @color $x
    #$PSBoundParameters
}

switch ($num) {
    3 {Write-Host @color $num_is "3"}
    4 {Write-Host @color $num_is "4"}
    Default {Write-Host @color $num_is "not 3 or 4"}
}

Write-Host-Decorated "Testing parameterset" 
$sample_query.Query | Select-Object -ExpandProperty Name
