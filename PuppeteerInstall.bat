


cd %USERPROFILE%\Downloads
npm install puppeteer puppeteer-extra puppeteer-extra-plugin-stealth fs ghost-cursor neat-csv user-agents

curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/EditPackageJSON.ps1

powershell.exe "%USERPROFILE%\Downloads\EditPackageJSON.ps1"

:: # Edit "package.json" (example under C:\Users\HC\)
:: {
::   "type": "module",         <<<<<<<<<========= Add this line on the top most of the file, following the json structure
::   "dependencies": {
::     "puppeteer": "^20.1.1",
::   }
:: }

:: ((Get-Content -path %USERPROFILE%\Downloads\package.json -Raw) -replace '{\n  \"dependencies\"','{\n  \"type\": \"module\",\n  \"dependencies\"') | Set-Content -Path %USERPROFILE%\Downloads\package.json

:: C:\Users\HC\Downloads>powershell.exe -command "( (Get-Content -path %USERPROFILE%\Downloads\package.json -Raw) -match '{\n  \"dependencies\"' )"
:: True

:: PS C:\Users\HC\Downloads> Get-Content -path C:\Users\HC\Downloads\package.json
:: {
::   "dependencies": {
::     "fs": "^0.0.1-security",
::     "ghost-cursor": "^1.1.18",
::     "neat-csv": "^7.0.0",
::     "puppeteer": "^20.8.2",
::     "puppeteer-extra": "^3.3.6",
::     "puppeteer-extra-plugin-stealth": "^2.11.2",
::     "user-agents": "^1.0.1439"
::   }
:: }
:: PS C:\Users\HC\Downloads> ((Get-Content -path C:\Users\HC\Downloads\package.json -Raw) -replace '{\n  \"dependencies\"',"{`n  `"type`": `"module`",`n  `"dependencies`"") | Set-Content -Path C:\Users\HC\Downloads\package.json
:: PS C:\Users\HC\Downloads> Get-Content -path C:\Users\HC\Downloads\package.json
:: {
::   "type": "module",
::   "dependencies": {
::     "fs": "^0.0.1-security",
::     "ghost-cursor": "^1.1.18",
::     "neat-csv": "^7.0.0",
::     "puppeteer": "^20.8.2",
::     "puppeteer-extra": "^3.3.6",
::     "puppeteer-extra-plugin-stealth": "^2.11.2",
::     "user-agents": "^1.0.1439"
::   }
:: }



:: # Location of Chrome Browser:   C:\Users\HC\.cache\puppeteer\chrome\win64-113.0.5672.63\chrome-win64\chrome.exe
:: # Need to escape '\' into '\\'
:: C:\\Users\\HC\\.cache\\puppeteer\\chrome\\win64-113.0.5672.63\\chrome-win64\\chrome.exe



:: Old main '.js' file may need to be changed into '.cjs'


