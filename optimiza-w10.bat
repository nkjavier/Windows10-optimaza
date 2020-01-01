@echo off
cls
echo.
echo ################################################
echo Atencion, ejecutar herramienta en modo Administrador
echo ################################################
echo.
pause
cls
echo Verificando Integridad..
echo.
Sfc /scannow
echo.
pause
cls
echo Verificando Integridad Online..
DISM.exe /Online /Cleanup-image /Scanhealth 
echo.
pause
cls
echo Optimizando con Integridad Online..
Dism.exe /Online /Cleanup-Image /CheckHealth  
echo.
pause
DISM.exe /Online /Cleanup-image /Restorehealth 
echo.
pause
Dism.exe /Online /Cleanup-Image /startComponentCleanup
echo.
echo Terminado!!
echo ***********
echo.
echo Se recomienda reiniciar la pc
echo 1-reiniciar 
echo 2-Solo salir, sin reiniciar
echo.
choice /c:12
IF %errorlevel% EQU 1 goto ini
IF %errorlevel% EQU 2 goto ini-2

:ini
echo.
echo Reiniciando en 20 segundos..
shutdown -r -t 20
sleep 10
goto fin

:ini-2
echo.
echo Fin
goto fin

:fin
