$credentials_file = "C:\Users\$env:USERNAME\.aws\credentials"

if (Test-Path $credentials -PathType leaf) { #use -PathType container for folder
    Remove-Item -Path $credentials_file -Force
    }
