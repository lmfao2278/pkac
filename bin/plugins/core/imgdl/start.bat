@echo off
cd %~dp0
title ImgDL
if not exist imgdl.exe curl -L https://github.com/Seklfreak/discord-image-downloader-go/releases/download/v1.34/discord-image-downloader-go-windows-amd64.exe -o %cd%\imgdl.exe
start /b /d %~dp0 imgdl.exe
pause >nul