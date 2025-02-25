@echo off
setlocal enabledelayedexpansion

echo [INFO] Fermeture des processus Parrot...

:: Fermer toutes les instances de cmd.exe, PowerShell, curl et wscript
taskkill /F /IM cmd.exe /FI "WINDOWTITLE eq Parrot*" >nul 2>&1
taskkill /F /IM wscript.exe >nul 2>&1
taskkill /F /IM powershell.exe >nul 2>&1
taskkill /F /IM curl.exe >nul 2>&1

:: Attendre 3 secondes pour s'assurer de la fermeture des processus
timeout /t 3 /nobreak >nul

:: Définition du dossier parrot
set PARROT_DIR=C:\Users\Eleve\parrot

:: Vérifier si le dossier existe
if exist "%PARROT_DIR%" (
    echo [INFO] Suppression des fichiers dans %PARROT_DIR%...

    :: Supprimer tous les fichiers du dossier
    del /F /Q "%PARROT_DIR%\*" > cleanup_log.txt 2>&1

    :: Supprimer le dossier Parrot
    rmdir /Q /S "%PARROT_DIR%" >> cleanup_log.txt 2>&1
)

:: Suppression du démarrage automatique
echo [INFO] Suppression du démarrage automatique...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Parrot /f >> cleanup_log.txt 2>&1

:: Vérification après suppression
if exist "%PARROT_DIR%" (
    echo [ERREUR] Le dossier Parrot n'a PAS été supprimé !
) else (
    echo [SUCCES] Le dossier Parrot a bien été supprimé.
)

:: Suppression du script cleanup.bat lui-même
(
    echo @echo off
    echo timeout /t 2 /nobreak ^>nul
    echo del /F /Q "%%~f0"
) > "%TEMP%\delete_me.bat"
start /min "" cmd /c "%TEMP%\delete_me.bat"

exit
