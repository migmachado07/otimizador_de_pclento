@echo off
:: ============================================================
::  Otimizador de PC - Miguel Machado
::  Launcher com elevacao automatica de administrador
:: ============================================================

:: Verifica se ja esta rodando como administrador
net session >nul 2>&1
if %errorlevel% == 0 goto :JaAdmin

:: Solicita elevacao automatica via PowerShell
echo Solicitando permissao de administrador...
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
  "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c \"%~f0\"' -Verb RunAs"
exit /b

:JaAdmin
:: Ja e admin - executa o otimizador diretamente
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Otimizador_MMachado.ps1"
