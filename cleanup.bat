reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Parrot /f
taskkill /F /IM wscript.exe >nul 2>&1
for /f "tokens=2 delims=," %A in ('tasklist /FI "IMAGENAME eq cmd.exe" /FO CSV /NH') do if not "%A"=="%PID%" taskkill /F /PID %A


del /F /Q "C:\Users\Eleve\install_parrot.bat"
rd /S /Q "C:\Users\Eleve\parrot"

exit

