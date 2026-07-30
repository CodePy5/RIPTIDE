#Simple drive sanitization script for RIPTIDE, https://riptide.codepy.org/
#Written by Benjamin Jaros

#This script uses the built in cipher.exe program on Windows to overwrite blank space on all drives. This script on it's own does not delete data; it only makes it more difficult to recover already erased data.
#This script is embedded in the provisioning package that RIPTIDE uses to reset a system, so that it scrubs all unused space after the reset has completed.

#Check if PPKG file exists (indicator of if script is running pre or post reset)
if (Test-Path -Path "C:\RIPTIDE.ppkg"){
    Write-Host "Files indicate the system has not been reset. No action will be taken until RIPTIDE completes system reset."
} else {
    #Get all connected drives
    $Drives = Get-PSDrive -PSProvider 'FileSystem'

    foreach($Drive in $drives) {
        #Scrub each drive attached
        Write-Host "Wiping " $Drive.Root
        cipher /w:$Drive.Root
    }
}


