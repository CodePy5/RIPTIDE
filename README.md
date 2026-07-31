RIPTIDE is the one-line command you can copy/paste, schedule, deploy, or type by hand to reset your Windows PC and scrub any remaining free space.

Run this command *only* on systems you're ready to remove all data from:
```
powershell -ep bypass "irm 'https://riptide.codepy.org/RSR.ps1'|iex"
```

##What do I need to run this?
All you need is a Windows 10 or 11 computer, administrator rights to launch the reset process, and an Internet connection. This command can be launched from the run box (press WIN+R), command prompt, PowerShell, or any other method to run a system command. 

##How does it work?
#Stage 1: Single Command
The single line command uses the Invoke-RestMethod (**irm**) cmdlet to download the full *RIPTIDE System Reset* script, and immediately executes it by piping it into Invoke-Expression (**iex**). It also sets the **E**xecution **P**olicy for the session to ***Bypass***, meaning for this session PowerShell will not require scripts to be digitally signed.

#Stage 2: RIPTIDE System Reset (RSR)
The RSR script contains the necessary logic to start the reset process. It starts by checking if admin privileges have already been granted and, if they haven't been yet, relaunches the process with a UAC prompt for administrator rights. Then, it saves a provisioning package to disk that is embedded into the script using base64 encoding. After attempting to remove any preexisting provisioning packages (which may interfere with the reset process, if not also persist the reset), it applies the package to the system.

#Stage 3: Provisioning Package
The provisioning package (PPKG) is configured to set the system to stay awake when powered, and initiate the reset process. The package also starts an embedded PowerShell script to scrub free space.

#Stage 4: Final Scrub
The embedded PowerShell script finds all drives attached to the system, and programmatically runs the *cipher* utility built into Windows to execute a 3-pass wipe process on all remaining free disk space.

##What if my antivirus stops RIPTIDE from running?
That means it's working! RIPTIDE is designed to be a fast, secure, and reproducible method of resetting Windows devices. To accomplish these goals, RIPTIDE uses shortened PowerShell commands, automatic application of provisioning packages, text-based file encoding, and public code hosting among many other methods and systems. While none of these things are inherently malicious, many malicious programs use these same methods, including ClickFix attacks, trojans, intentional obfuscation tactics, and malware distribution systems. In short, the same features that make RIPTIDE convenient also make it appear suspicious to security software. We encourage you to carefully inspect the code yourself for any areas of concern. If your security software flags RIPTIDE, you may need to temporarily disable the software.
