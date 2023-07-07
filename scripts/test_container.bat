@echo off
setlocal

set count=0
set started=false

:loop
set /a count+=1
echo [%STAGE_NAME%] Starting container [Attempt: %count%]

powershell -Command "& {$testStart = Invoke-WebRequest -Uri http://localhost:8080; exit $testStart.StatusCode}"

if %errorlevel% equ 0 (
    set started=true
) else (
    timeout /t 1 /nobreak >nul
)

if not %started%==true (
    if %count%==3 (
        exit /b 1
    ) else (
        goto loop
    )
)

