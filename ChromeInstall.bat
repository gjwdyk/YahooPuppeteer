


:: The built-in Chrome browser which Puppeteer brings-in with :
:: have a more difficult installation path to deal with in terms of scripting (i.e. have version number in the path)
:: When run, the browser actually named "Google Chrome for Testing"

:: Therefore installing normal/common Chrome Browser



set NormalChromeDefaultPathFile="C:\Program Files\Google\Chrome\Application\chrome.exe"



cd %USERPROFILE%\Downloads

IF EXIST %NormalChromeDefaultPathFile% (
 echo "Chrome Browser had been installed at %NormalChromeDefaultPathFile% ."
) ELSE (
 echo "Can NOT Find %NormalChromeDefaultPathFile% . Try to download and install common normal Chrome browser."
 powershell.exe -command "winget install google.chrome"

 IF EXIST %NormalChromeDefaultPathFile% (
  echo "Chrome Browser had been installed at %NormalChromeDefaultPathFile% ."
  powershell.exe -command "New-NetFirewallRule -DisplayName CommonNormalChromeBrowser -Direction Inbound -Program %NormalChromeDefaultPathFile% -Action Allow"
 ) ELSE (
  echo "Apparently installation of Chrome Browser had failed."
 )
)


