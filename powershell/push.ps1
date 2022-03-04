#!/usr/bin/env pwsh

# Predefined variables
$pathToApocryptaGlobal = "$Home\Documents\apocrypta-global"
$pathToKey = "$Home\Documents\apocrypta-global\apocrypta-key"
$currentDate = Get-Date -UFormat "%F %R"

# 0. Go to apocrypta-global
Set-Location $pathToApocryptaGlobal

# 1. Create tar archive
Invoke-Command -ScriptBlock {tar -cf "apocrypta-vault.tar" -C "apocrypta-vault" "*"}

# 2. Encrypt with `age`
Invoke-Command -ScriptBlock {age -e -i $pathToKey -o "apocrypta-vault.tar.enc" "apocrypta-vault.tar"}

# 3. Move to desired repository then commit and push to remote
Move-Item -force "apocrypta-vault.tar.enc" "apocrypta/apocrypta-vault.tar.enc"
Set-Location "$pathToApocryptaGlobal\apocrypta"
Invoke-Command -ScriptBlock {git add "apocrypta-vault.tar.enc"}
Invoke-Command -ScriptBlock {git commit -m "$currentDate"}
Invoke-Command -ScriptBlock {git push origin main}
