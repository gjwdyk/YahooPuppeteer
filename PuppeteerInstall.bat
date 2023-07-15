


cd %USERPROFILE%\Downloads

if not [%NodeJSVersion%]==[] (
 echo "NodeJS Version is [%NodeJSVersion%] ."
 call npm install puppeteer puppeteer-extra puppeteer-extra-plugin-stealth fs ghost-cursor neat-csv user-agents
)

if exist %USERPROFILE%\Downloads\package.json (
 rem Download PowerShell script to edit package.json file
 curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/EditPackageJSON.ps1
 rem Enable System to run PowerShell script
 powershell.exe -command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"
 rem Run the PowerShell script
 powershell.exe -file "%USERPROFILE%\Downloads\EditPackageJSON.ps1"
 set PuppeteerInstall=Success
) else (
 echo "Can NOT Find File %USERPROFILE%\Downloads\package.json ."
)



rem Location of Chrome Browser which is brought by Puppeteer (version may change) :
rem C:\Users\HC\.cache\puppeteer\chrome\win64-114.0.5735.133\chrome-win64\chrome.exe
rem Need to escape '\' into '\\'
rem C:\\Users\\HC\\.cache\\puppeteer\\chrome\\win64-114.0.5735.133\\chrome-win64\\chrome.exe
rem You can also use normal Chrome Browser which you install manually, which usually will be located at :
rem C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe

rem Old main '.js' file may need to be changed into '.cjs' (i.e. classic .js)


