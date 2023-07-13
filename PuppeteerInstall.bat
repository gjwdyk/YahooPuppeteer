


cd %USERPROFILE%\Downloads
npm install puppeteer puppeteer-extra puppeteer-extra-plugin-stealth fs ghost-cursor neat-csv user-agents

powershell.exe -command "((Get-Content -path %USERPROFILE%\Downloads\package.json -Raw) -replace '{\r\n  \"dependencies\"','{\r\n  \"type\": \"module\",\r\n  \"dependencies\"') | Set-Content -Path %USERPROFILE%\Downloads\package.json"



:: # Edit "package.json" (example under C:\Users\HC\)
:: {
::   "type": "module",         <<<<<<<<<========= Add this line on the top most of the file, following the json structure
::   "dependencies": {
::     "puppeteer": "^20.1.1",
::   }
:: }

:: ((Get-Content -path %USERPROFILE%\Downloads\package.json -Raw) -replace '{\r\n  \"dependencies\"','{\r\n  \"type\": \"module\",\r\n  \"dependencies\"') | Set-Content -Path %USERPROFILE%\Downloads\package.json



:: # Location of Chrome Browser:   C:\Users\HC\.cache\puppeteer\chrome\win64-113.0.5672.63\chrome-win64\chrome.exe
:: # Need to escape '\' into '\\'
:: C:\\Users\\HC\\.cache\\puppeteer\\chrome\\win64-113.0.5672.63\\chrome-win64\\chrome.exe



:: Old main '.js' file may need to be changed into '.cjs'


