﻿
#Read file from global location
#Create Git folder if not exists - Clone
#If exists pull

Set-Location -Path "C:\SmartForexApp"git config --global user.email rbabu.bala@gmail.comgit config --global user.name PP-Ramif (!(Test-Path -path "C:\SmartForexApp\FxData")) {    git clone https://PP-Ram:pepsiusa10@github.com/PP-Ram/FxData.git} else {   Set-Location -Path "C:\SmartForexApp\FxData"    git pull }

Copy-Item "C:\SmartForexApp\FxData\Patch\*.*" "C:\SmartForexApp" -recurse

Set-Location -Path "C:\SmartForexApp"

& "C:\SmartForexApp\MasterSignal.Exe"

stop-process -Id $PID