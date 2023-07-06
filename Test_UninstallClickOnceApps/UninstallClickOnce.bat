echo off
cls
 
Echo MyClickOnceApplication...
cd c:\
taskkill /F /IM "AppName.exe"
cls
Echo Uninstalling MyClickOnceApplication...
cd %USERPROFILE%\Start Menu\Programs\Startup
if exist "AppName.appref-ms" del "AppName.appref-ms"
cd c:\windows
rundll32.exe dfshim.dll,ShArpMaintain AppName.Q.SSICAQ.AppNameServer.Produktiv.application, Culture=neutral, PublicKeyToken=0000000000000000, processorArchitecture=x86
pause