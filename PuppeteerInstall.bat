


cd %USERPROFILE%\Downloads

if not [%NodeJSVersion%]==[] (
 echo "Puppeteer installation with NodeJS version [%NodeJSVersion%] ."
 call npm install puppeteer puppeteer-extra puppeteer-extra-plugin-stealth fs ghost-cursor neat-csv user-agents
 if %ERRORLEVEL% EQU 0 (
  set PuppeteerInstall=Success
 ) else (
  set PuppeteerInstall=Fail
 )
)
if not [%NodeJSVersion%]==[] ( echo "Puppeteer installation %PuppeteerInstall% ." )



if not [%NodeJSVersion%]==[] (
 if [%PuppeteerInstall%]==[Success] (
  if exist %USERPROFILE%\Downloads\package.json (
   rem Download PowerShell script to edit package.json file
   curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/EditPackageJSON.ps1
   rem Enable System to run PowerShell script
   powershell.exe -command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"
   rem Run the PowerShell script
   powershell.exe -file "%USERPROFILE%\Downloads\EditPackageJSON.ps1"
   if %ERRORLEVEL% EQU 0 (
    set EditPackageJSON=Success
   ) else (
    set EditPackageJSON=Fail
   )
  ) else (
   set EditPackageJSON=NotFound
  )
 ) else (
  set EditPackageJSON=NotDone
 )
)
if not [%NodeJSVersion%]==[] (
  if [%EditPackageJSON%]==[Success] ( echo "Edit %USERPROFILE%\Downloads\package.json File %EditPackageJSON% ." )
  if [%EditPackageJSON%]==[Fail] ( echo "Edit %USERPROFILE%\Downloads\package.json File %EditPackageJSON% ." )
  if [%EditPackageJSON%]==[NotFound] ( echo "Can NOT Find File %USERPROFILE%\Downloads\package.json ." )
  if [%EditPackageJSON%]==[NotDone] ( echo "" )
)



if not [%NodeJSVersion%]==[] (
 if [%PuppeteerInstall%]==[Success] (
  if [%EditPackageJSON%]==[Success] (
   set PuppeteerInstall=Successful
  )
 )
)

if not [%NodeJSVersion%]==[] ( echo "Puppeteer installation [%PuppeteerInstall%] ." )



rem Location of Chrome Browser which is brought by Puppeteer (version may change) :
rem C:\Users\HC\.cache\puppeteer\chrome\win64-114.0.5735.133\chrome-win64\chrome.exe
rem Need to escape '\' into '\\'
rem C:\\Users\\HC\\.cache\\puppeteer\\chrome\\win64-114.0.5735.133\\chrome-win64\\chrome.exe
rem You can also use normal Chrome Browser which you install manually, which usually will be located at :
rem C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe

rem Old main '.js' file may need to be changed into '.cjs' (i.e. classic .js)


