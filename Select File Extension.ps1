$Package = Get-ChildItem -Path C:\ -Filter *.nupkg -recurse

$Package.Name