


rem https://blog.nullspace.io/batch.html

@echo on
cd %USERPROFILE%\Downloads

curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/NodeJSInstall.bat && call NodeJSInstall.bat
curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/PuppeteerInstall.bat && call PuppeteerInstall.bat
curl -kLO --retry 333 https://raw.githubusercontent.com/gjwdyk/YahooPuppeteer/main/ChromeInstall.bat && call ChromeInstall.bat


