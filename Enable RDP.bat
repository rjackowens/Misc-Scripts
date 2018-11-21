REM This batch file is intended to be run within the PSTools subfolder

@ECHO OFF
SET /p pcname=Please enter PC name:

psexec \\%pcname% netsh firewall set service remoteadmin enable
psexec \\%pcname% netsh firewall set service remotedesktop enable
psexec \\%pcname% netsh firewall set service type=fileandprint mode=enable profile=all
psexec \\%pcname% netsh advfirewall firewall set rule group=”network discovery” new enable=yes

sc \\%pcname% start rpcss
sc \\%pcname% start mpssvc
sc \\%pcname% start rpceptmapper

pause