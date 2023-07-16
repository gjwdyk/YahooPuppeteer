


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



set CommonNormalChromeDefaultPathFile="C:\Program Files\Google\Chrome\Application\chrome.exe"
set InstallModule=Google.Chrome



cd %USERPROFILE%\Downloads

if exist %CommonNormalChromeDefaultPathFile% (
 echo "Chrome Browser had been installed at %CommonNormalChromeDefaultPathFile% ."
 set PreviousChromeInstallationExist=Yes
) else (
 echo "Can NOT find %CommonNormalChromeDefaultPathFile% ."
 set PreviousChromeInstallationExist=No
)

if [%PuppeteerInstall%]==[Successful] (
 if [%PreviousChromeInstallationExist%]==[Yes] (
  set DoChromeInstallation=No
 ) else (
  set DoChromeInstallation=Yes
 )
) else (
 if [%PuppeteerInstall%]==[Success] (
  if [%PreviousChromeInstallationExist%]==[Yes] (
   set DoChromeInstallation=No
  ) else (
   set DoChromeInstallation=Yes
  )
 ) else (
  set DoChromeInstallation=No
 )
)



if [%DoChromeInstallation%]==[Yes] (
 winget install --id %InstallModule% --accept-package-agreements --accept-source-agreements --verbose-logs --log %USERPROFILE%\Downloads\%InstallModule%.txt
 if %ERRORLEVEL% EQU 0 (
  set ChromeInstall=Success
 ) else (
  set ChromeInstall=Fail
 )
) else (
)
if [%DoChromeInstallation%]==[Yes] ( echo "%InstallModule% installation %ChromeInstall% ." )






rem powershell.exe -command "New-NetFirewallRule -DisplayName CommonNormalChromeBrowser -Direction Inbound -Program %CommonNormalChromeDefaultPathFile% -Action Allow"















rem +-+--------------------------------------------------+-+
rem +-+--------------------------------------------------+-+
rem ! ! End of Common/Normal Chrome Browser Installation ! !
rem +-+--------------------------------------------------+-+
rem +-+--------------------------------------------------+-+


