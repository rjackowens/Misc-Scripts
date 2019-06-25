$CertPassword = $env:CertPassword
$Directory = $env:SYSTEM_DEFAULTWORKINGDIRECTORY

$FilePath = [IO.Path]::Combine($Directory, "_Daemon", "drop", "cert-file.pfx" )

$CertPasswordSecure = $CertPassword | ConvertTo-SecureString -AsPlainText -Force
Import-PfxCertificate -FilePath $FilePath -CertStoreLocation Cert:\LocalMachine\Root -Password $CertPasswordSecure