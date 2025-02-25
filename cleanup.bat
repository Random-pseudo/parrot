taskkill /F /IM wscript.exe >nul 2>&1
taskkill /F /IM cmd.exe /T

timeout /t 5 /nobreak >nul

taskkill /F /IM cmd.exe /T

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Parrot /f


del /F /Q "C:\Users\Eleve\install_parrot.bat"
rd /S /Q "C:\Users\Eleve\parrot"
