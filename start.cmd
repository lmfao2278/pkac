@echo off
title Pokecord Auto Catcher^!
set root=%cd%
set pl-root=%root%\bin\plugins\core
cd bin
setlocal enabledelayedexpansion
if exist "%pl-root%\spam\run.txt" del "%pl-root%\spam\run.txt"
call :plugins
set oldsize=0
echo.Welcome to Pokecord AC.
echo.
echo.Press S to start/stop.
echo.Press C to hide common.
echo.Press V to hide common-ish.
echo.Press L to load log.
echo.
choice /c SCVL >nul
if %errorlevel% == 1 call :start
if %errorlevel% == 2 set "hide1=/c:"[COMMON]" "
if %errorlevel% == 3 set "hide2=/c:"[COMMON-ISH]" "
if %errorlevel% == 4 call :loadLog
call :top

:start
if exist "%pl-root%\spam\run.txt" del "%pl-root%\spam\run.txt" & echo.Stopped. & call :top
if not exist "%pl-root%\spam\run.txt" copy NUL "%pl-root%\spam\run.txt" >nul & echo.Started. & call :top

:hide1
if defined hide1 set hide1=& call :log & @exit /b
set "hide1=/v /c:"[COMMON]" "
call :log
@exit /b

:hide2
if defined hide2 set hide2=& call :log & @exit /b
set "hide2=/v /c:"[COMMON-ISH]" "
call :log
@exit /b

:top
choice /C SCVL /T 5 /D L  >nul
if %errorlevel% == 1 call :start
if %errorlevel% == 2 call :hide1
if %errorlevel% == 3 call :hide2
if %errorlevel% == 4 call :loadLog
goto top

:loadLog
if exist "%pl-root%\imgdl\PokecordSpawn-*.jpg" rename "%pl-root%\imgdl\PokecordSpawn-*.jpg" "PokecordSpawn.jpg"
if not exist "%root%\log.log" @exit /b
FOR /F "usebackq" %%A IN ('%root%\log.log') DO set size=%%~zA
IF "%size%" gtr "%oldsize%" call :log
set oldsize=%size%
@exit /b

:log
cls
if not defined hide1 if not defined hide2 type "%root%\log.log" & @exit /b
findstr %hide1%%hide2%"%root%\log.log"
@exit /b

:plugins
nircmd exec hide "%pl-root%\spam\start.bat"
nircmd exec hide "%pl-root%\md5convert\start.bat"
nircmd exec hide "%pl-root%\imgdl\start.bat"
nircmd exec hide "%pl-root%\background\start.bat"
@exit /b
