#Welcome to RIPTIDE System Reset!
#WARNING: THIS SCRIPT IS DESIGNED TO RESET YOUR PC AS QWUICKLY AS POSSIBLE, THEN EXECUTE A DATA SCRUBBING SCRIPT
#WARNING: ALL DATA ON THIS DEVICE WILL BE ERASED IF YOU RUN THIS SCRIPT.

#This script is a fast launcher to apply the RIPTIDE provisioning package. Once the package is applied, Windows will restart and reset itself, removing all data.
#After retting, the RIPTIDE package will also disable sleep mode (if plugged in) and launch a data scrubbing program to overwrite free space on all connected drives.
#RIPTIDE: https://riptide.codepy.org/

#This is the RIPTIDE provisioning package encoded in base64 
$base64EncodedString = ""
$bytes = [System.Convert]::FromBase64String($base64EncodedString)
Set-Content -Path "C:\RIPTIDE.ppkg" -Value $bytes -Encoding Byte

#This removes existing provisioning packages to ensure a fresh start and prevent any conflicts, especially on Windows 10
Uninstall-ProvisioningPackage -AllInstalledPackages
#This applies the provisioning package without prompting
Install-ProvisioningPackage -PackagePath C:\waste.ppkg -QuietInstall -ForceInstall