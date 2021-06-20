@echo off
if not "%minimized%"=="" goto :minimized
set minimized=true
start /min cmd /C "%~dpnx0"
goto :EOF
:minimized
pushd "%~dp0"
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "BAO" /t REG_SZ /d "%~dp0run.bat" /f
IF %PROCESSOR_ARCHITECTURE% == x86 (IF NOT DEFINED PROCESSOR_ARCHITEW6432 goto bit32)
goto bit64
:bit32
Outils\AutoIt3.exe BAO.a3x
goto :end
:bit64
Outils\AutoIt3_x64.exe BAO_x64.a3x
:end
popd