Remove-WebConfigurationProperty -PSPath "MACHINE/WEBROOT/APPHOST/Default Web Site/" -Name . -Filter system.webServer/httpProtocol/customHeaders -AtElement @{name='ETag'}

$MD5 = Get-FileHash "C:\inetpub\file.js" -Algorithm MD5

Write-Host "Setting ETag header to" $MD5.hash

Add-WebConfigurationProperty -PSPath "MACHINE/WEBROOT/APPHOST/Default Web Site/" -Name . -Filter system.webServer/httpProtocol/customHeaders -AtElement @{name="ETag";value=$MD5.Hash}