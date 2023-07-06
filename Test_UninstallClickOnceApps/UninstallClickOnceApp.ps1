<# Set $ISODisplayName to the visible name of the application in the Windows Start menu #>
#$ISODisplayName = "AppName"

<# Get uninstallable ClickOnce applications #>
#$InstalledApplicationNotMSI = Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall | foreach-object {Get-ItemProperty $_.PsPath}
$us = Get-childItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall" -ErrorAction SilentlyContinue | Get-ItemProperty | Where-Object {$_.DisplayName -like "*NVIDIA Graphics Driver*"} | select DisplayName, UninstallString

<# Find uninstall string for named ClickOnce application #>
<# The name is the display name visible in the Windows Start Menu #>
$UninstallString = $InstalledApplicationNotMSI | ? { $_.displayname -match $ISODisplayName } | select UninstallString 
$selectedUninstallString = $UninstallString.UninstallString

<# Launch ClickOnce uninstall command #>
$wshell.run("cmd /c $selectedUninstallString")

<# Wait 7 seconds for uninstall dialog to appear #>
Start-Sleep 7

<# Move focus and Select option "Remove the Application from this computer" #>
<# Key specifications: https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.sendkeys?view=netframework-4.7.2 #>
$wshell.sendkeys("{TAB}")
$wshell.sendkeys("{DOWN}")

<# Press the OK button #>
$wshell.sendkeys("`"OK`"~")