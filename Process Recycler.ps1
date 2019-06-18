Function Run-Notepad {

    $App = Start-Process notepad.exe -PassThru

    }

Function Kill-Notepad {

    $AppID = Get-Process $App.Name | Select-Object -ExpandProperty id
    $wshell = New-Object -ComObject wscript.shell
    $wshell.AppActivate($AppID)
    $wshell.SendKeys('%{F4}')

    }
    
while ($true) {

    Run-Notepad
    Start-Sleep -Seconds 20
    Kill-Notepad
    Start-Sleep -Seconds 5

    }
