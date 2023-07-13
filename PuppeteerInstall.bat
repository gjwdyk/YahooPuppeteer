


cd %USERPROFILE%\Downloads
call npm install puppeteer puppeteer-extra puppeteer-extra-plugin-stealth fs ghost-cursor neat-csv user-agents



:: Download PowerShell script to edit package.json file
curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/EditPackageJSON.ps1
:: Enable System to run PowerShell script
powershell.exe -command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"
:: Run the PowerShell script
powershell.exe "%USERPROFILE%\Downloads\EditPackageJSON.ps1"



:: # Location of Chrome Browser:   C:\Users\HC\.cache\puppeteer\chrome\win64-113.0.5672.63\chrome-win64\chrome.exe
:: # Need to escape '\' into '\\'
:: C:\\Users\\HC\\.cache\\puppeteer\\chrome\\win64-113.0.5672.63\\chrome-win64\\chrome.exe



:: Old main '.js' file may need to be changed into '.cjs'


