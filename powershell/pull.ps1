#!/usr/bin/env pwsh

# Predefined variables
$pathToApocryptaGlobal = "$Home\Documents\apocrypta-global"
$pathToKey = "$Home\Documents\apocrypta-global\apocrypta-key"

# 0. Go to apocrypta remote repository
Set-Location "$pathToApocryptaGlobal\apocrypta"

# 1. Pull changes from remote
Invoke-Command -ScriptBlock {git fetch}
Invoke-Command -ScriptBlock {git pull}

# 2. Decrypt archive
Invoke-Command -ScriptBlock {age -d -i $pathToKey -o "../apocrypta-vault.dec.tar" "apocrypta-vault.tar.enc"}

# 2. Extract archive
Set-Location "$pathToApocryptaGlobal"
Invoke-Command -ScriptBlock {tar -xf "apocrypta-vault.dec.tar" -C "apocrypta-vault"}
