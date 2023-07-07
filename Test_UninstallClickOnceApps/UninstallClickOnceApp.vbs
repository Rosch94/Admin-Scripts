On Error Resume Next
Set objShell = WScript.CreateObject("WScript.Shell")
objShell.Run "taskkill /f /im AppName *"
objShell.Run "rundll32.exe dfshim.dll,ShArpMaintain AppName, Culture=neutral, PublicKeyToken=0000000000000000, processorArchitecture=x86"
Do Until Success = True
Success = objShell.AppActivate("AppName")
Wscript.Sleep 200
Loop
objShell.SendKeys "OK"