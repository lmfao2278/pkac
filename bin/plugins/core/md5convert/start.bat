@echo off
title MD5 Converter
cd ..
set log-root=%cd%
cd bin
set root=%cd%
set pl-root=%root%\plugins\core
setlocal enabledelayedexpansion
:top
@for /f "tokens=*" %%p in ('CertUtil -hashfile "%pl-root%\imgdl\imgs\PokecordSpawn.jpg" MD5 ^| find /i /v "md5" ^| find /i /v "certutil"') do @for /f "tokens=*" %%i in ('type $pokemons.txt ^| findstr "%%p"') do set pokename=%%i
@if not defined pokename goto wait
set pokename=%pokename:~32%
@if exist "%pl-root%\imgdl\imgs\PokecordSpawn.jpg" @del /q "%pl-root%\imgdl\imgs\PokecordSpawn.jpg"
echo.p^^!catch %pokename%> "%pl-root%\spam\catch.txt"
call :log
set pokename=

:wait
@goto top

:log
type %root%\common-ish.txt | findstr /x /c:"%pokename%"
if %errorlevel% == 0 set label=EH OKAY IG
type %root%\common.txt | findstr /x /c:"%pokename%"
if %errorlevel% == 0 set label=BORING
type %root%\rare-ish.txt | findstr /x /c:"%pokename%"
if %errorlevel% == 0 set label=KINDA HOT
type %root%\rare.txt | findstr /x /c:"%pokename%"
if %errorlevel% == 0 set label=BLAZIN HOT
echo.^[%date:~7,2%-%date:~4,2%-%date:~12,4%^] ^[%TIME:~0,8%^] ^[%label%^] %pokename% has been caught. >> %log-root%\log.log
@exit /b
