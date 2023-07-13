


cd %USERPROFILE%\Downloads
call npm install puppeteer puppeteer-extra puppeteer-extra-plugin-stealth fs ghost-cursor neat-csv user-agents



:: Download PowerShell script to edit package.json file
curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/EditPackageJSON.ps1
:: Enable System to run PowerShell script
powershell.exe -command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"
:: Run the PowerShell script
powershell.exe "%USERPROFILE%\Downloads\EditPackageJSON.ps1"



:: Location of Chrome Browser which is brought by Puppeteer (version may change) :
:: C:\Users\HC\.cache\puppeteer\chrome\win64-114.0.5735.133\chrome-win64\chrome.exe
:: Need to escape '\' into '\\'
:: C:\\Users\\HC\\.cache\\puppeteer\\chrome\\win64-114.0.5735.133\\chrome-win64\\chrome.exe
:: You can also use normal Chrome Browser which you install manually, which usually will be located at :
:: C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe



:: Old main '.js' file may need to be changed into '.cjs' (i.e. classic .js)


