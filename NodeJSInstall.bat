


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
if %ERRORLEVEL% EQU 0 Echo %InstallModule% installed.

:: ╔════════════════════════╗
:: ║ Using cURL and MSIExec ║
:: ╚════════════════════════╝

:: :: Set the Node.JS version to be installed
:: set NodeJSVersion=v18.16.1
::
:: echo %PATH%
:: :: Download the Node.JS installer .msi file to %USERPROFILE%\Downloads folder
:: cd %USERPROFILE%\Downloads
:: curl -kLO --retry 333 https://nodejs.org/dist/%NodeJSVersion%/node-%NodeJSVersion%-x64.msi
:: :: Install the Node.JS installer .msi file
:: msiexec.exe /i node-%NodeJSVersion%-x64.msi ADDLOCAL=ALL /qn /passive /promptrestart /L*vx %USERPROFILE%\Downloads\node-%NodeJSVersion%-x64.txt
:: echo %PATH%



:: ╔═╦═══════════════════════════╦═╗
:: ╠═╬═══════════════════════════╬═╣
:: ║ ║ Test Node.JS Installation ║ ║
:: ╠═╬═══════════════════════════╬═╣
:: ╚═╩═══════════════════════════╩═╝

:: ╔═════════════════════════════════╗
:: ║ Fix Environment Variable %PATH% ║
:: ╚═════════════════════════════════╝

:: The followings force the current shell to refresh the environment variables, especially %PATH% variable which is needed to run Node.JS
curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/ResetVariables.vbs
curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/ResetVariables.bat
call ResetVariables.bat
echo %PATH%

:: ╔═══════════════════════════╗
:: ║ Test: Get Node.JS Version ║
:: ╚═══════════════════════════╝

FOR /F %%f IN ('node -v') DO set NodeJSVersion=%%f
IF "%~NodeJSVersion" == "" (
 echo "Unable to find Node.JS !!!"
) else (
 echo "%~NodeJSVersion"
)



:: ╔═╦═════════════════╦═╗
:: ╠═╬═════════════════╬═╣
:: ║ ║ End of Document ║ ║
:: ╠═╬═════════════════╬═╣
:: ╚═╩═════════════════╩═╝


