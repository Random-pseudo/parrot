@echo off
setlocal

:: Spécifier le chemin du dossier parrot
set PARROT_DIR=%USERPROFILE%\parrot

:: Arrêter les processus en cours
taskkill /F /IM "cmd.exe" /T > nul 2>&1
taskkill /F /IM "parrot_background.bat" /T > nul 2>&1
taskkill /F /IM "loop_parrot.bat" /T > nul 2>&1

:: Supprimer les fichiers téléchargés
del /F /Q "%PARROT_DIR%\cleanup.bat" > nul 2>&1
del /F /Q "%PARROT_DIR%\setup.bat" > nul 2>&1
del /F /Q "%PARROT_DIR%\loop_parrot.bat" > nul 2>&1
del /F /Q "%PARROT_DIR%\parrot_background.bat" > nul 2>&1

:: Supprimer les fichiers de démarrage (si ajoutés via Startup ou registre)
del /F /Q "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\parrot_background.bat" > nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Parrot /f > nul 2>&1

:: Supprimer le dossier Parrot (si nécessaire)
rmdir /S /Q "%PARROT_DIR%" > nul 2>&1

:: Se supprimer
del /F /Q "%~f0" > nul 2>&1

exit
