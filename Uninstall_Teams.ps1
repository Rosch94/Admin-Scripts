

function unInstallTeams($path) {
    $clientInstaller = "$($path)\Update.exe"
    
     try {
          $process = Start-Process -FilePath "$clientInstaller" -ArgumentList "--uninstall /s" -PassThru -Wait -ErrorAction STOP
          if ($process.ExitCode -ne 0)
      {
        Write-Error "UnInstallation failed with exit code  $($process.ExitCode)."
          }
      }
      catch {
          Write-Error $_.Exception.Message
      }
  }
  # Remove Teams Machine-Wide Installer
  Write-Host "Removing Teams Machine-wide Installer" -ForegroundColor Yellow
  $MachineWide = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Teams Machine-Wide Installer"}
  $MachineWide.Uninstall()
  # Remove Teams for Current Users
  $localAppData = "$($env:LOCALAPPDATA)\Microsoft\Teams"
  $programData = "$($env:ProgramData)\$($env:USERNAME)\Microsoft\Teams"
  If (Test-Path "$($localAppData)\Current\Teams.exe") 
  {
    unInstallTeams($localAppData)
      
  }
  elseif (Test-Path "$($programData)\Current\Teams.exe") {
    unInstallTeams($programData)
  }
  else {
    Write-Warning  "Teams installation not found"
  }

  #Source:https://lazyadmin.nl/powershell/microsoft-teams-uninstall-reinstall-and-cleanup-guide-scripts/