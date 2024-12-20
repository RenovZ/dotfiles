@echo off
:loop
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Users\win\AppData\Roaming\helix\themes\darklight.ps1"
timeout /t 1 /nobreak > nul
goto loop
