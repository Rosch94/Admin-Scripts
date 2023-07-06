echo off
cls
 
Echo MyClickOnceApplication...
cd c:\
taskkill /F /IM "AppNameQ (Produktiv).exe"
cls
Echo Uninstalling MyClickOnceApplication...
cd %USERPROFILE%\Start Menu\Programs\Startup
if exist "AppNameQ (Produktiv).appref-ms" del "AppNameQ (Produktiv).appref-ms"
cd c:\windows
rundll32.exe dfshim.dll,ShArpMaintain AppName.Q.SSICAQ.AppNameServer.Produktiv.application, Culture=neutral, PublicKeyToken=0000000000000000, processorArchitecture=x86
pause