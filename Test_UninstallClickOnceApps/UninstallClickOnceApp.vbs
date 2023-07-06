On Error Resume Next
Set objShell = WScript.CreateObject("WScript.Shell")
objShell.Run "taskkill /f /im BabtecQ (Produktiv) *"
objShell.Run "rundll32.exe dfshim.dll,ShArpMaintain Babtec.Q.SSICAQ.BabtecServer.Produktiv.application, Culture=neutral, PublicKeyToken=0000000000000000, processorArchitecture=x86"
Do Until Success = True
Success = objShell.AppActivate("BabtecQ (Produktiv)")
Wscript.Sleep 200
Loop
objShell.SendKeys "OK"