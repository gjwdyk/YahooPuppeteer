


set NodeJSVersion=v18.16.1



echo %PATH%
cd %USERPROFILE%\Downloads
curl -kLO --retry 333 https://nodejs.org/dist/%NodeJSVersion%/node-%NodeJSVersion%-x64.msi
msiexec.exe /i node-%NodeJSVersion%-x64.msi ADDLOCAL=ALL /qn /passive /promptrestart /L*vx %USERPROFILE%\Downloads\node-%NodeJSVersion%-x64.txt
echo %PATH%



curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/resetvars.vbs
curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/resetvars.bat
resetvars.bat

echo %PATH%


