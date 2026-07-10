#Simple drive sanitization script for RIPTIDE, https://riptide.codepy.org/
#Written by Benjamin Jaros

#This script uses the built in cipher.exe program on Windows to overwrite blank space on all drives. This script on it's own does not delete data; it only makes it more difficult to recover already erased data.
#This script is embedded in the provisioning package that RIPTIDE uses to reset a system, so that it scrubs all unused space after the reset has completed.

#Get all connected drives
$Drives = Get-PSDrive -PSProvider 'FileSystem'

foreach($Drive in $drives) {
    #Scrub each drive attached
    Write-Host "Wiping " $Drive.Root
    cipher /w:$Drive.Root
}
