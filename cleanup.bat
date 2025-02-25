@echo off
setlocal enabledelayedexpansion

echo [INFO] Fermeture des processus Parrot...

:: Tuer les processus cmd, wscript, powershell et curl qui pourraient être liés
taskkill /F /IM cmd.exe /FI "WINDOWTITLE ne Administrator*" >nul 2>&1
taskkill /F /IM wscript.exe >nul 2>&1
taskkill /F /IM powershell.exe >nul 2>&1
taskkill /F /IM curl.exe >nul 2>&1
taskkill /F /IM conhost.exe >nul 2>&1

:: Attendre 5 secondes pour s'assurer que tout est bien fermé
timeout /t 5 /nobreak >nul

:: Vérifier à nouveau et forcer la fermeture si nécessaire
for /F "tokens=2 delims=," %%a in ('tasklist /FI "IMAGENAME eq cmd.exe" /NH /FO CSV') do taskkill /F /PID %%a >nul 2>&1
for /F "tokens=2 delims=," %%a in ('tasklist /FI "IMAGENAME eq wscript.exe" /NH /FO CSV') do taskkill /F /PID %%a >nul 2>&1
for /F "tokens=2 delims=," %%a in ('tasklist /FI "IMAGENAME eq powershell.exe" /NH /FO CSV') do taskkill /F /PID %%a >nul 2>&1

:: Vérification finale
tasklist /FI "IMAGENAME eq cmd.exe" | find /I "cmd.exe" && echo [ERREUR] Certains processus cmd sont toujours actifs !
tasklist /FI "IMAGENAME eq wscript.exe" | find /I "wscript.exe" && echo [ERREUR] Certains processus wscript sont toujours actifs !
tasklist /FI "IMAGENAME eq powershell.exe" | find /I "powershell.exe" && echo [ERREUR] Certains processus PowerShell sont toujours actifs !

:: Suppression des fichiers et du dossier Parrot
set PARROT_DIR=C:\Users\Eleve\parrot
if exist "%PARROT_DIR%" (
    echo [INFO] Suppression des fichiers dans %PARROT_DIR%...
    del /F /Q "%PARROT_DIR%\*" >nul 2>&1
    rmdir /S /Q "%PARROT_DIR%" >nul 2>&1
)

:: Vérifier si le dossier a bien été supprimé
if exist "%PARROT_DIR%" (
    echo [ERREUR] Le dossier Parrot n'a PAS été supprimé !
) else (
    echo [SUCCES] Le dossier Parrot a été supprimé.
)

:: Suppression du script au démarrage
echo [INFO] Suppression de l'entrée de démarrage...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Parrot /f >nul 2>&1

:: Suppression différée de cleanup.bat
(
    echo @echo off
    echo timeout /t 2 /nobreak ^>nul
    echo del /F /Q "%%~f0"
) > "%TEMP%\delete_me.bat"
start /min "" cmd /c "%TEMP%\delete_me.bat"

exit
