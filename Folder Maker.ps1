$Folders = @(
"Authentication",
"Commissions",
"Configuration",
"Customer",
"Distributor",
"Equipment",
"EventService",
"FieldRep",
"FileHandler",
"LaunchPad",
"Order",
"Parts",
"Reporting", 
"Underwriting",
"User"
)

$Path = Read-Host "Enter path to create folder(s)"

# Adds \ break in path if necessary
if ($Path.EndsWith("\") -eq $false) {
        $Path = $Path + "\"
    }

$Folders | ForEach-Object {
    $NewPath = $Path + $_
        try {
                New-Item -Path $NewPath -ItemType Directory -ErrorAction Stop > $null # Remove stdout
                Write-Host "Created folder" $NewPath -ForegroundColor Green
            }
            catch [System.IO.IOException] {
                    Write-Host $NewPath "already exists" -ForegroundColor Red
            }
    }
