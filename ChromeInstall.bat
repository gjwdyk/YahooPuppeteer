


rem The built-in Chrome browser which Puppeteer brings-in with :
rem have a more difficult installation path to deal with in terms of scripting (i.e. have version number in the path)
rem When run, the browser actually named "Google Chrome for Testing"

rem Therefore installing normal/common Chrome Browser



rem Location of Chrome Browser which is brought by Puppeteer (version may change) :
rem C:\Users\HC\.cache\puppeteer\chrome\win64-114.0.5735.133\chrome-win64\chrome.exe
rem Need to escape '\' into '\\'
rem C:\\Users\\HC\\.cache\\puppeteer\\chrome\\win64-114.0.5735.133\\chrome-win64\\chrome.exe
rem You can also use normal Chrome Browser which you install manually, which usually will be located at :
rem C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe






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


