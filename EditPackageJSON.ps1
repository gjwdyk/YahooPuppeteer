Get-Content -path $Env:USERPROFILE\Downloads\package.json
((Get-Content -path $Env:USERPROFILE\Downloads\package.json -Raw) -replace '{\n  \"dependencies\"',"{`n  `"type`": `"module`",`n  `"dependencies`"") | Set-Content -Path $Env:USERPROFILE\Downloads\package.json
Get-Content -path $Env:USERPROFILE\Downloads\package.json
