@echo off
title Pokecord Auto Catcher^!
setlocal enabledelayedexpansion
set root=%cd%
set pl-root=%root%\bin\plugins\core
if exist "%pl-root%\spam\run.txt" del "%pl-root%\spam\run.txt"
call :plugins
echo.Welcome to Pokecord AC.
echo.
echo.Press S to start/stop.
echo.Press C to hide common.
echo.Press V to hide common-ish.
echo.Press L to load log.
echo.
choice /c SCVL >nul
if %errorlevel% == 4 call "%pl-root%\log\start.bat" "log"
if %errorlevel% == 1 call :start
if %errorlevel% == 2 call "%pl-root%\log\start.bat" "hide-common"
if %errorlevel% == 3 call "%pl-root%\log\start.bat" "hide-common-ish"
call :top

:start
if exist "%pl-root%\spam\run.txt" del "%pl-root%\spam\run.txt" & echo.Stopped. & call :top
if not exist "%pl-root%\spam\run.txt" copy NUL "%pl-root%\spam\run.txt" >nul & echo.Started. & call :top

:top
choice /C SCVL /T 7 /D L  >nul
if %errorlevel% == 4 call "%pl-root%\log\start.bat" "log"
if %errorlevel% == 1 call :start
if %errorlevel% == 2 call "%pl-root%\log\start.bat" "hide-common"
if %errorlevel% == 3 call "%pl-root%\log\start.bat" "hide-common-ish"
goto top

:plugins
cd bin
nircmd exec hide "%pl-root%\spam\start.bat"
nircmd exec hide "%pl-root%\md5convert\start.bat"
nircmd exec hide "%pl-root%\imgdl\start.bat"
nircmd exec hide "%pl-root%\background\start.bat"
@exit /b
