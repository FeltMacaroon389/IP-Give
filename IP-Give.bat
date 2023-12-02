@echo off
setlocal enabledelayedexpansion

echo __/\\\\\\\\\\\__/\\\\\\\\\\\\\_____________________/\\\\\\\\\\\\____________________________________
echo _\/////\\\///__\/\\\/////////\\\_________________/\\\//////////_____________________________________
echo _____\/\\\_____\/\\\_______\/\\\________________/\\\______________/\\\______________________________
echo _____\/\\\_____\/\\\\\\\\\\\\\/___/\\\\\\\\\\\_\/\\\____/\\\\\\\_\///___/\\\____/\\\_____/\\\\\\\\__
echo _____\/\\\_____\/\\\/////////____\///////////__\/\\\___\/////\\\__/\\\_\//\\\__/\\\____/\\\/////\\\_ 
echo _____\/\\\_____\/\\\___________________________\/\\\_______\/\\\_\/\\\__\//\\\/\\\____/\\\\\\\\\\\__ 
echo _____\/\\\_____\/\\\___________________________\/\\\_______\/\\\_\/\\\___\//\\\\\____\//\\///////___ 
echo __/\\\\\\\\\\\_\/\\\___________________________\//\\\\\\\\\\\\/__\/\\\____\//\\\______\//\\\\\\\\\\_ 
echo _\///////////__\///_____________________________\////////////____\///______\///________\//////////__
echo (Made by FeltMacaroon389)

echo.
echo Look for a file named "IP_Addresses.txt" for log.

echo.
echo Scanning, please wait...

echo.

rem Check internet connection by pinging 8.8.8.8
ping -n 1 8.8.8.8 | find "TTL=" > nul
if errorlevel 1 (
    echo ERROR: No internet connection.
    timeout /nobreak /t 3 > nul
    goto :eof
)

if not exist IP_Addresses.txt (
    echo. > IP_Addresses.txt
)

:loop
set /a octet1=!random! %% 256
set /a octet2=!random! %% 256
set /a octet3=!random! %% 256
set /a octet4=!random! %% 256
set ip=!octet1!.!octet2!.!octet3!.!octet4!

rem Check if the IP address is already logged
findstr /x "!ip!" IP_Addresses.txt > nul
if errorlevel 1 (
    rem IP address not found in the log, proceed to check if it's reachable
    ping -n 1 -w 100 !ip! | find "TTL=" > nul
    if errorlevel 1 (
        rem IP is unreachable, do nothing
    ) else (
        echo !ip! is up.
        echo !ip! is up. Date found: %date% >> IP_Addresses.txt
    )
) else (
    echo ERROR !ip! is already logged.
)

goto loop




