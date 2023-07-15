


:: ╔═╦═════════════════╦═╗
:: ╠═╬═════════════════╬═╣
:: ║ ║ Install Node.JS ║ ║
:: ╠═╬═════════════════╬═╣
:: ╚═╩═════════════════╩═╝

:: ╔══════════════╗
:: ║ Using WinGet ║
:: ╚══════════════╝

cd %USERPROFILE%\Downloads
set InstallModule=OpenJS.NodeJS.LTS
winget install --id %InstallModule% --accept-package-agreements --accept-source-agreements --verbose-logs --log %USERPROFILE%\Downloads\%InstallModule%.txt
if %ERRORLEVEL% EQU 0 (
 set NodeJSInstall=Success
) else (
 set NodeJSInstall=Fail
)
echo "%InstallModule% installation %NodeJSInstall% ."

:: ╔════════════════════════╗
:: ║ Using cURL and MSIExec ║
:: ╚════════════════════════╝

:: :: Set the Node.JS version to be installed
:: set NodeJSVersion=v18.16.1
::
:: :: Download the Node.JS installer .msi file to %USERPROFILE%\Downloads folder
:: cd %USERPROFILE%\Downloads
:: curl -kLO --retry 333 https://nodejs.org/dist/%NodeJSVersion%/node-%NodeJSVersion%-x64.msi
:: :: Install the Node.JS installer .msi file
:: msiexec.exe /i node-%NodeJSVersion%-x64.msi ADDLOCAL=ALL /qn /passive /promptrestart /L*vx %USERPROFILE%\Downloads\node-%NodeJSVersion%-x64.txt
:: if %ERRORLEVEL% EQU 0 (
::  set NodeJSInstall=Success
:: ) else (
::  set NodeJSInstall=Fail
:: )
:: Echo "%InstallModule% installation %NodeJSInstall% ."



:: ╔═╦═══════════════════════════╦═╗
:: ╠═╬═══════════════════════════╬═╣
:: ║ ║ Test Node.JS Installation ║ ║
:: ╠═╬═══════════════════════════╬═╣
:: ╚═╩═══════════════════════════╩═╝

if [%NodeJSInstall%] == [Success] (

:: ╔═══════════════════════════════╗
:: ║ Fix Environment Variable PATH ║
:: ╚═══════════════════════════════╝

:: The followings force the current shell to refresh the environment variables, especially %PATH% variable which is needed to run Node.JS
 curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/ResetVariables.vbs
 curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/ResetVariables.bat
 call ResetVariables.bat
 echo %PATH%

:: ╔═══════════════════════════╗
:: ║ Test: Get Node.JS Version ║
:: ╚═══════════════════════════╝

 for /F %%f in ('node -v') do set NodeJSVersion=%%f
 if [%NodeJSVersion%]==[] (
  echo "Installed Node.JS version is : [%NodeJSVersion%] ."
 ) else (
  echo "Installed Node.JS version is : %NodeJSVersion% ."
 )

) else (
 echo "No Node.JS Test Done, Since %InstallModule% installation %NodeJSInstall% ."
)



:: ╔═╦═════════════════╦═╗
:: ╠═╬═════════════════╬═╣
:: ║ ║ End of Document ║ ║
:: ╠═╬═════════════════╬═╣
:: ╚═╩═════════════════╩═╝


