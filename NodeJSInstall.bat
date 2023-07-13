


:: Set the Node.JS version to be installed
set NodeJSVersion=v18.16.1



echo %PATH%
:: Download the Node.JS installer .msi file to %USERPROFILE%\Downloads folder
cd %USERPROFILE%\Downloads
curl -kLO --retry 333 https://nodejs.org/dist/%NodeJSVersion%/node-%NodeJSVersion%-x64.msi
:: Install the Node.JS installer .msi file
msiexec.exe /i node-%NodeJSVersion%-x64.msi ADDLOCAL=ALL /qn /passive /promptrestart /L*vx %USERPROFILE%\Downloads\node-%NodeJSVersion%-x64.txt
echo %PATH%



:: The followings force the current shell to refresh the environment variables, especially %PATH% variable which is needed to run Node.JS
curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/ResetVariables.vbs
curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/ResetVariables.bat
call ResetVariables.bat
echo %PATH%
:: Test a Node.JS command
node -v


