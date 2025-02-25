@echo off
setlocal

:: Forcer l'arrêt des processus liés à Parrot
echo Fermeture des processus...
taskkill /F /IM wscript.exe >nul 2>&1
taskkill /F /IM cmd.exe /T

:: Fermer toutes les instances cachées de cmd
for /f "tokens=2 delims=," %%a in ('tasklist /FI "IMAGENAME eq cmd.exe" /FO CSV /NH') do taskkill /F /PID %%a >nul 2>&1

:: Pause pour s'assurer que les processus sont bien arrêtés
timeout /t 3 /nobreak >nul

:: Définir le chemin du dossier "parrot"
set PARROT_DIR=C:\Users\Eleve\parrot

:: Vérifier si le dossier existe avant suppression
if exist "%PARROT_DIR%" (
    echo Suppression des fichiers...
    del /F /Q "%PARROT_DIR%\cleanup.bat" >nul 2>&1
    del /F /Q "%PARROT_DIR%\setup.bat" >nul 2>&1
    del /F /Q "%PARROT_DIR%\loop_parrot.bat" >nul 2>&1
    del /F /Q "%PARROT_DIR%\parrot_background.bat" >nul 2>&1
    del /F /Q "%PARROT_DIR%\parrot_launcher.vbs" >nul 2>&1

    :: Supprimer le dossier Parrot s'il est vide
    rmdir /Q /S "%PARROT_DIR%" >nul 2>&1
)

:: Supprimer l’entrée du registre pour éviter le démarrage au boot
echo Suppression du démarrage automatique...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Parrot /f >nul 2>&1

:: Auto-suppression du cleanup.bat
(
    echo @echo off
    echo timeout /t 2 /nobreak ^>nul
    echo del /F /Q "%%~f0"
) > "%TEMP%\delete_me.bat"
start /min "" cmd /c "%TEMP%\delete_me.bat"

exit
