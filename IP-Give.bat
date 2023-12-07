@echo off
setlocal enabledelayedexpansion

:start
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
rem Check internet connection by pinging 8.8.8.8
ping -n 1 8.8.8.8 | find "TTL=" > nul
if errorlevel 1 (
    echo ERROR: No internet connection.
    timeout /nobreak /t 3 > nul
    goto :eof
)

:Task

echo.
echo 1. View my IP Addresses
echo 2. Start random IP giver
echo 3. Get IP Address of a Domain
echo 99. Exit
echo.
set /p Task=" "

echo.
if /i "%Task%"=="1" (
    goto GetMyIPs
)

if /i "%Task%"=="2" (
    goto Random-IP-Giver
)

if /i "%Task%"=="3" (
    goto GetDomainIP
)

if /i "%Task%"=="99" (
    goto 99Selected
)

if not defined Task (
    echo.
    echo Please select a task.
    goto Task
)

echo Please select a task.
goto Task

:GetMyIPs
echo Getting IP addresses...
timeout /nobreak /t 1 > nul

echo.
rem Get private IP address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| find "IPv4 Address"') do set private_ip=%%a

set private_ip=%private_ip:~1%

rem Get public IP address
curl -s ipinfo.io/ip > temp_ip.txt
set /p public_ip=<temp_ip.txt
del temp_ip.txt

echo Your Public IP address: %public_ip%
echo Your Private IP address: %private_ip%

echo.
pause
cls
goto start

:Random-IP-Giver
echo Starting Random IP Giver...
timeout /nobreak /t 1 > nul

cls
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
:UserInput
echo.
echo Random IP-Address giver

echo.
set /p saveToFile="Do you want to save IP addresses to a file? (Y/N): "
if /i "%saveToFile%"=="N" (
    goto :SkipFilePrompts
) else if /i "%saveToFile%"=="Y" (
    :Naming
    echo.
    set /p customFileName="Enter the desired file name to save IP addresses to: "
    set "fileExt="
    if not defined customFileName (
        echo.
        echo Invalid input. File name is required.
        goto Naming
    )
    goto StartFileNaming
) else (
    echo Invalid input. Please enter 'Y' or 'N'.
    goto :UserInput
)

:StartFileNaming
echo.
echo Choose a file format:
echo 1. Text (.txt)
echo 2. Comma-Separated Values (.csv)
echo 3. Tab-Separated Values (.tsv)
echo 4. Log File (.log)
echo 5. Markdown (.md)
echo 6. JSON (.json)
set /p fileFormat="Enter the number corresponding to your choice: "

if "%fileFormat%"=="1" set fileExt=".txt"
if "%fileFormat%"=="2" (
    set fileExt=".csv"
    echo You chose CSV format. Make sure to use a spreadsheet program like Excel to open the file.
)
if "%fileFormat%"=="3" set fileExt=".tsv"
if "%fileFormat%"=="4" set fileExt=".log"
if "%fileFormat%"=="5" set fileExt=".md"
if "%fileFormat%"=="6" set fileExt=".json"

if not defined fileExt (
    echo.
    echo Invalid input. File extension is required.
    goto StartFileNaming
)

rem Concatenate the file name and extension
set "customFileName=!customFileName!!fileExt!"

if not exist "!customFileName!" (
    rem Create the file if it doesn't exist
    echo Here you will see all logged IP addresses. > "!customFileName!"
    echo. >> "!customFileName!"
)
echo.
echo File will be saved as: !customFileName! Starting scanner...
timeout /nobreak /t 3 > nul

:SkipFilePrompts

cls
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
echo Scanning, please wait...

echo.
:MainLoop
set /a octet1=!random! %% 256
set /a octet2=!random! %% 256
set /a octet3=!random! %% 256
set /a octet4=!random! %% 256
set ip=!octet1!.!octet2!.!octet3!.!octet4!

if /i "%saveToFile%"=="Y" (
    rem Check if the IP address is already logged
    findstr /x "!ip!" "!customFileName!" > nul
    if errorlevel 1 (
        rem IP address not found in the log, proceed to check if it's reachable
        ping -n 1 -w 100 !ip! | find "TTL=" > nul
        if errorlevel 1 (
            rem IP is unreachable, do nothing
        ) else (
            echo !ip! is up.
            echo !ip! is up. Date and time found: !date! !time! >> "!customFileName!"
        )
    ) else (
        echo ERROR !ip! is already logged.
    )
) else (
    rem If not saving to a file, simply echo the IP address
    ping -n 1 -w 100 !ip! | find "TTL=" > nul
    if errorlevel 1 (
        rem IP is unreachable, do nothing
    ) else (
        echo !ip! is up.
    )
)

goto MainLoop

:99Selected

echo Exiting...
timeout /nobreak /t 1 > nul
goto eof

:GetDomainIP

set /p domain=Enter a domain name: 
for /f "tokens=2 delims=[]" %%a in ('ping -n 1 %domain%') do set ip=%%a
echo The IP address of %domain% is %ip%
pause
cls
goto Start

