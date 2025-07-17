@echo off
net session >nul 2>&1
if %errorlevel% NEQ 0 (
	echo Solicitando permisos de Admninistrador...
	powershell  -Command "Start-Process '%~f0' -Verb RunAs"
	exit /b
	)
taskkill /IM AnyDesk.exe /F
cd %programdata%\Anydesk
del service.conf
if errorlevel 1 (
	echo [Error] Algo salió mal...
	goto :EOF
)
cd "%ProgramFiles(x86)%\AnyDesk"
AnyDesk.exe
