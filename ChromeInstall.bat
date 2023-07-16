


rem +-+--------------------------------------+-+
rem +-+--------------------------------------+-+
rem ! ! Install Common/Normal Chrome Browser ! !
rem +-+--------------------------------------+-+
rem +-+--------------------------------------+-+

rem The built-in Chrome browser which Puppeteer brings-in with :
rem (1) Have a more difficult installation path to deal with in terms of scripting (i.e. have version number in the path).
rem (2) When run, the browser actually named "Google Chrome for Testing".
rem
rem Therefore installing normal/common Chrome browser.
rem
rem Location of Chrome browser which is brought by Puppeteer (version may change) :
rem C:\Users\HC\.cache\puppeteer\chrome\win64-114.0.5735.133\chrome-win64\chrome.exe
rem When used in Puppeteer script(s), you may need to escape '\' into '\\'
rem C:\\Users\\HC\\.cache\\puppeteer\\chrome\\win64-114.0.5735.133\\chrome-win64\\chrome.exe
rem
rem You can use common/normal Chrome browser which you (commonly/normally) install manually, which usually will be located at :
rem C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe

@echo on

set CommonNormalChromeDefaultPathFile="C:\Program Files\Google\Chrome\Application\chrome.exe"
cd %USERPROFILE%\Downloads



if exist %CommonNormalChromeDefaultPathFile% (
 echo "Chrome Browser had been installed at %CommonNormalChromeDefaultPathFile% ."
 set PreviousChromeInstallationExist=Yes
) else (
 echo "Can NOT find %CommonNormalChromeDefaultPathFile% ."
 set PreviousChromeInstallationExist=No
)

rem The below block does not have any logical flaw nor syntax flaw. However it does not work.
rem On the Internet, there are references stating that Microsoft Windows' Command Line Batch does NOT support nested if else statements.
rem The setlocal enabledelayedexpansion on nested block statement, also won't propagate update to too-far-outside scope.
rem So if you're doing nested block statements with the delayed expansion, you need to be careful that your update won't be propagated to the outer scope if it has to travel too far out.
rem
rem It's amazing such a bad product were allowed to be sold to public and not fixed since 1980-something. While the company declare profit records for such a long time.
rem What a true reflection of the corrupted god who created those people.

rem if [%PuppeteerInstall%]==[Successful] (
rem  if [%PreviousChromeInstallationExist%]==[Yes] (
rem   set DoChromeInstallation=No
rem  ) else (
rem   set DoChromeInstallation=Yes
rem  )
rem ) else (
rem  if [%PuppeteerInstall%]==[Success] (
rem   if [%PreviousChromeInstallationExist%]==[Yes] (
rem    set DoChromeInstallation=No
rem   ) else (
rem    set DoChromeInstallation=Yes
rem   )
rem  ) else (
rem   set DoChromeInstallation=No
rem  )
rem )

set DoChromeInstallation=No
rem Do NOT make the below one-liner, as the compiler may add space(s) at the end of the assigned value (which will ruin the comparison later on)
if [%PuppeteerInstall%]==[Successful] (
 set DoChromeInstallation=Yes
)
rem Do NOT make the below one-liner, as the compiler may add space(s) at the end of the assigned value (which will ruin the comparison later on)
if [%PuppeteerInstall%]==[Success] (
 set DoChromeInstallation=Yes
)
rem Do NOT make the below one-liner, as the compiler may add space(s) at the end of the assigned value (which will ruin the comparison later on)
if [%PreviousChromeInstallationExist%]==[Yes] (
 set DoChromeInstallation=No
)



rem +--------------+
rem ! Using WinGet !
rem +--------------+

set InstallModule=Google.Chrome

if [%DoChromeInstallation%]==[Yes] (
 winget install --id %InstallModule% --accept-package-agreements --accept-source-agreements --verbose-logs --log %USERPROFILE%\Downloads\%InstallModule%.txt
 if %ERRORLEVEL% EQU 0 (
  set ChromeInstall=Success
 ) else (
  set ChromeInstall=Fail
 )
)
if [%DoChromeInstallation%]==[Yes] ( echo "%InstallModule% installation %ChromeInstall% ." )



rem In some cases you need to allow (open Windows' Firewall) for Chrome :
rem powershell.exe -command "New-NetFirewallRule -DisplayName CommonNormalChromeBrowser -Direction Inbound -Program %CommonNormalChromeDefaultPathFile% -Action Allow"



rem +-+--------------------------------------------------+-+
rem +-+--------------------------------------------------+-+
rem ! ! End of Common/Normal Chrome Browser Installation ! !
rem +-+--------------------------------------------------+-+
rem +-+--------------------------------------------------+-+


