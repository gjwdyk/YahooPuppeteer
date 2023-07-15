


:: The built-in Chrome browser which Puppeteer brings-in with :
:: have a more difficult installation path to deal with in terms of scripting (i.e. have version number in the path)
:: When run, the browser actually named "Google Chrome for Testing"

:: Therefore installing normal/common Chrome Browser



set CommonNormalChromeDefaultPathFile="C:\Program Files\Google\Chrome\Application\chrome.exe"



cd %USERPROFILE%\Downloads

if exist %CommonNormalChromeDefaultPathFile% (
 echo "Chrome Browser had been installed at %CommonNormalChromeDefaultPathFile% ."
) else (
 echo "Can NOT Find %CommonNormalChromeDefaultPathFile% . Try to download and install common normal Chrome browser."
 powershell.exe -command "winget install google.chrome"

 if exist %CommonNormalChromeDefaultPathFile% (
  echo "Chrome Browser had been installed at %CommonNormalChromeDefaultPathFile% ."
  powershell.exe -command "New-NetFirewallRule -DisplayName CommonNormalChromeBrowser -Direction Inbound -Program %CommonNormalChromeDefaultPathFile% -Action Allow"
 ) else (
  echo "Apparently installation of Chrome Browser had failed."
 )
)


