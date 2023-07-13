


cd %USERPROFILE%\Downloads
npm install puppeteer puppeteer-extra puppeteer-extra-plugin-stealth
npm install neat-csv fs ghost-cursor user-agents



:: # Edit "package.json" (example under C:\Users\HC\)
:: {
::   "type": "module",         <<<<<<<<<========= Add this line on the top most of the file, following the json structure
::   "dependencies": {
::     "puppeteer": "^20.1.1",
::   }
:: }



:: # Location of Chrome Browser:   C:\Users\HC\.cache\puppeteer\chrome\win64-113.0.5672.63\chrome-win64\chrome.exe
:: # Need to escape '\' into '\\'
:: C:\\Users\\HC\\.cache\\puppeteer\\chrome\\win64-113.0.5672.63\\chrome-win64\\chrome.exe



:: Old main '.js' file may need to be changed into '.cjs'


