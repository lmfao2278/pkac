@echo off
title Background Watcher
cd %~dp0
:top
timeout 3
FOR /F %%x IN ('tasklist /NH /FI "WINDOWTITLE eq Pokecord Auto Catcher!"') DO IF %%x == cmd.exe goto top
taskkill /f /fi "WINDOWTITLE EQ AfkSpam"
taskkill /f /fi "WINDOWTITLE EQ ImgDL"
taskkill /f /fi "WINDOWTITLE EQ MD5 Converter"
taskkill /f /im node.exe
taskkill /f /im imgdl.exe
exit
