@echo off
title Windows Update Toggle
color 0A
:MENU
    cls
    echo ====
    echo      Windows Update Toggle Script
    echo ====
    echo.
    echo 1. Disable Windows Update
    echo 2. Enable Windows Update
    echo 3. Exit
    echo.
    set /p choice="Enter your choice (1-3): "
    if "%choice%"=="1" goto DISABLE
    if "%choice%"=="2" goto ENABLE
    if "%choice%"=="3" exit
    goto MENU
:DISABLE
    echo Disabling Windows Update service...
    sc stop wuauserv
    sc config wuauserv start= disabled
    echo Windows Update has been disabled.
    pause
    goto MENU
:ENABLE
    echo Enabling Windows Update service...
    sc config wuauserv start= auto
    sc start wuauserv
    echo Windows Update has been enabled.
    pause
    goto MENU
