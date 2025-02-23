@echo off
taskkill /F /IM cmd.exe /T
timeout /t 2

del /F /Q loop_parrot.bat
del /F /Q parrot_background.bat
del /F /Q setup.bat
del /F /Q cleanup.bat

rd /S /Q "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\parrot_background.bat"

exit
