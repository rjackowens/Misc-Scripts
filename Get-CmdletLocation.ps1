function Get-CmdletLocation {
    param ([string]$Cmdlet)

    $Result = (Get-Command $Cmdlet).DLL

        if ($Result -eq $null) {
            
            $Result = Get-Command $Cmdlet 
            $Result = (Get-Module $Result.ModuleName).Path

            } 

     return $Result

}
