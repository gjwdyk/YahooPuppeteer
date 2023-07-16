


rem +-+-------------------+-+
rem +-+-------------------+-+
rem ! ! Install Puppeteer ! !
rem +-+-------------------+-+
rem +-+-------------------+-+

cd %USERPROFILE%\Downloads

rem +-----------+
rem ! Using NPM !
rem +-----------+

if not [%NodeJSInstalledVersion%]==[] (
 if not [%NPMInstalledVersion%]==[] (
  echo "Puppeteer installation with NodeJS version [%NodeJSInstalledVersion%] and NPM version [%NPMInstalledVersion%] ."
  call npm install puppeteer puppeteer-extra puppeteer-extra-plugin-stealth fs ghost-cursor neat-csv user-agents
  if %ERRORLEVEL% EQU 0 (
   set PuppeteerInstall=Success
  ) else (
   set PuppeteerInstall=Fail
  )
 ) else ( echo "No NPM Detected." )
) else ( echo "No Node.JS Detected." )

if not [%NodeJSInstalledVersion%]==[] (
 if not [%NPMInstalledVersion%]==[] (
  echo "Puppeteer installation %PuppeteerInstall% ."
 )
)



rem +-+------------------------+-+
rem +-+------------------------+-+
rem ! ! Edit package.json File ! !
rem +-+------------------------+-+
rem +-+------------------------+-+

if not [%NodeJSInstalledVersion%]==[] (
 if not [%NPMInstalledVersion%]==[] (
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
)

if not [%NodeJSInstalledVersion%]==[] (
 if not [%NPMInstalledVersion%]==[] (
  if [%EditPackageJSON%]==[Success] ( echo "Edit %USERPROFILE%\Downloads\package.json File %EditPackageJSON% ." )
  if [%EditPackageJSON%]==[Fail] ( echo "Edit %USERPROFILE%\Downloads\package.json File %EditPackageJSON% ." )
  if [%EditPackageJSON%]==[NotFound] ( echo "Can NOT Find File %USERPROFILE%\Downloads\package.json ." )
  if [%EditPackageJSON%]==[NotDone] ( echo "" )
 )
)



rem +-+---------------------------------------+-+
rem +-+---------------------------------------+-+
rem ! ! Summary Puppeteer Installation Status ! !
rem +-+---------------------------------------+-+
rem +-+---------------------------------------+-+

if not [%NodeJSInstalledVersion%]==[] (
 if not [%NPMInstalledVersion%]==[] (
  if [%PuppeteerInstall%]==[Success] (
   if [%EditPackageJSON%]==[Success] (
    set PuppeteerInstall=Successful
   )
  )
 )
)

if not [%NodeJSInstalledVersion%]==[] (
 if not [%NPMInstalledVersion%]==[] (
  echo "Puppeteer installation [%PuppeteerInstall%] ."
 )
)



rem +-+-------+-+
rem +-+-------+-+
rem ! ! Notes ! !
rem +-+-------+-+
rem +-+-------+-+

rem Old main '.js' file may need to be changed into '.cjs' (i.e. classic .js).



rem +-+-------------------------------+-+
rem +-+-------------------------------+-+
rem ! ! End of Puppeteer Installation ! !
rem +-+-------------------------------+-+
rem +-+-------------------------------+-+


