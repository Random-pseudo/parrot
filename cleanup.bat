@echo off
setlocal

:: Fermer tous les processus liés à Parrot
taskkill /F /IM cmd.exe /FI "WINDOWTITLE eq Parrot*" >nul 2>&1
taskkill /F /IM wscript.exe >nul 2>&1
taskkill /F /IM powershell.exe >nul 2>&1

:: Attendre un peu pour s'assurer que les processus sont bien arrêtés
timeout /t 2 /nobreak >nul

:: Définir le chemin du dossier "parrot"
set PARROT_DIR=C:\Users\Eleve\parrot

:: Supprimer les fichiers
del /F /Q "%PARROT_DIR%\cleanup.bat"
del /F /Q "%PARROT_DIR%\setup.bat"
del /F /Q "%PARROT_DIR%\loop_parrot.bat"
del /F /Q "%PARROT_DIR%\parrot_background.bat"
del /F /Q "%PARROT_DIR%\parrot_launcher.vbs"

:: Supprimer le dossier Parrot si vide
rmdir /Q /S "%PARROT_DIR%" >nul 2>&1

:: Supprimer l’entrée de démarrage dans le registre
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Parrot /f >nul 2>&1

:: S'auto-supprimer proprement
echo cleanup terminé.
(
    echo @echo off
    echo del /F /Q "%%~f0"
) > "%TEMP%\delete_me.bat"
start /min "" cmd /c "%TEMP%\delete_me.bat"

exit
