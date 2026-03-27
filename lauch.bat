@echo off
title Multi-Project Launcher
setlocal enabledelayedexpansion

echo 🚀 Scan des dossiers en cours...
echo.

:: Boucle sur tous les sous-dossiers
for /d %%D in (*) do (
    :: Vérifie si le fichier package.json existe dans le dossier
    if exist "%%D\package.json" (
        echo [OK] Projet detecte : %%D
        
        :: Lance une nouvelle fenêtre d'invite de commande
        :: /d spécifie le répertoire de démarrage
        start "Projet: %%D" cmd /k "cd /d %%~fD && echo 📦 Installation et Lancement de %%D... && npm install && npm start"
        
        :: Petite pause pour éviter les conflits de ports ou de CPU
        timeout /t 1 /nobreak > nul
    ) else (
        echo [SKIP] %%D (Pas de package.json^)
    )
)

echo.
echo ✅ Toutes les fenetres ont ete lancees.
pause