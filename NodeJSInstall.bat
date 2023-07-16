


rem +-+-----------------+-+
rem +-+-----------------+-+
rem ! ! Install Node.JS ! !
rem +-+-----------------+-+
rem +-+-----------------+-+

rem +--------------+
rem ! Using WinGet !
rem +--------------+

cd %USERPROFILE%\Downloads
set InstallModule=OpenJS.NodeJS.LTS
winget install --id %InstallModule% --accept-package-agreements --accept-source-agreements --verbose-logs --log %USERPROFILE%\Downloads\%InstallModule%.txt
if %ERRORLEVEL% EQU 0 (
 set NodeJSInstall=Success
) else (
 set NodeJSInstall=Fail
)
echo "%InstallModule% installation %NodeJSInstall% ."

rem +------------------------+
rem ! Using cURL and MSIExec !
rem +------------------------+

rem rem Set the Node.JS version to be installed
rem set NodeJSVersion=v18.16.1
rem
rem rem Download the Node.JS installer .msi file to %USERPROFILE%\Downloads folder
rem cd %USERPROFILE%\Downloads
rem curl -kLO --retry 333 -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" https://nodejs.org/dist/%NodeJSVersion%/node-%NodeJSVersion%-x64.msi
rem rem Install the Node.JS installer .msi file
rem msiexec.exe /i node-%NodeJSVersion%-x64.msi ADDLOCAL=ALL /qn /passive /promptrestart /L*vx %USERPROFILE%\Downloads\node-%NodeJSVersion%-x64.txt
rem if %ERRORLEVEL% EQU 0 (
rem  set NodeJSInstall=Success
rem ) else (
rem  set NodeJSInstall=Fail
rem )
rem Echo "%InstallModule% installation %NodeJSInstall% ."



rem +-+---------------------------+-+
rem +-+---------------------------+-+
rem ! ! Test Node.JS Installation ! !
rem +-+---------------------------+-+
rem +-+---------------------------+-+

rem +-------------------------------+
rem ! Fix Environment Variable PATH !
rem +-------------------------------+

if [%NodeJSInstall%]==[Success] (
 rem The followings force the current shell to refresh the environment variables, especially PATH variable which is needed to run Node.JS
 curl -kLO --retry 333 -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/ResetVariables.vbs
 curl -kLO --retry 333 -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/ResetVariables.bat
 call ResetVariables.bat
)
if [%NodeJSInstall%]==[Success] ( echo %PATH% )

rem +---------------------------+
rem ! Test: Get Node.JS Version !
rem +---------------------------+

rem Do NOT make the below one-liner, as the compiler may add space(s) at the end of the NodeJSInstalledVersion value (which will ruin the comparison with Empty String)
if [%NodeJSInstall%]==[Success] (
 for /F %%f in ('node -v') do set NodeJSInstalledVersion=%%f
)
if [%NodeJSInstall%]==[Success] (
 if [%NodeJSInstalledVersion%]==[] (
  echo "Installed Node.JS version is : [%NodeJSInstalledVersion%] ."
 ) else (
  echo "Installed Node.JS version is : %NodeJSInstalledVersion% ."
 )
)

rem Since both :
rem (1) Fix Environment Variable PATH and
rem (2) Test: Get Node.JS Version
rem have the same if condition test, theoretically they can be placed under the same block.
rem However, we want the block of "Fix Environment Variable PATH" to happen first and use the changed/updated value for the next block.
rem Therefore both blocks must be separated for that to happen.
rem The same reason (iteration in smaller scope) for echo the value PATH in separate block; and assign NodeJSInstalledVersion value in separate block.

rem +-----------------------+
rem ! Test: Get NPM Version !
rem +-----------------------+

rem Do NOT make the below one-liner, as the compiler may add space(s) at the end of the NPMInstalledVersion value (which will ruin the comparison with Empty String)
if [%NodeJSInstall%]==[Success] (
 for /F %%f in ('npm -v') do set NPMInstalledVersion=%%f
)
if [%NodeJSInstall%]==[Success] (
 if [%NPMInstalledVersion%]==[] (
  echo "Installed NPM version is : [%NPMInstalledVersion%] ."
 ) else (
  echo "Installed NPM version is : %NPMInstalledVersion% ."
 )
)



rem +-+-------+-+
rem +-+-------+-+
rem ! ! Notes ! !
rem +-+-------+-+
rem +-+-------+-+

rem Notes in this Repository is meant to be read when editing the script, not when executing the script.
rem When the scripts are executed, the Comments/Remarks may be shown, however the compiler may change some of the displayed text.
rem
rem Official Token for Comment is Rem .
rem Using :: for comment may emit syntax error, example within a block statement.
rem
rem Within a block statement (a parenthesised series of statements), the entire block is parsed and then executed.
rem Any %variable% within the block will be replaced by that variable's value at the time the block is parsed - before the block is executed - the same thing applies to a FOR ... DO (block).
rem Hence, IF (do-this) else (do-that) will be executed using the values of %variable% at the time the IF is encountered.
rem
rem Two common ways to overcome this are :
rem (1) to use setlocal enabledelayedexpansion and use !variable! in place of %variable% to access the changed value of variable,
rem or
rem (2) to call a subroutine to perform further processing using the changed values.



rem +-+-----------------------------+-+
rem +-+-----------------------------+-+
rem ! ! End of Node.JS Installation ! !
rem +-+-----------------------------+-+
rem +-+-----------------------------+-+


