﻿#Check if the application is already opening

if(get-process | ?{$_.path -eq "C:\SmartForexApp\MasterSignal.exe"}){

    $Shell = New-Object -ComObject "WScript.Shell"
    $Button = $Shell.Popup("Please check and close, the application is already open.", 0, "Smart Forex App", 0)
    stop-process -Id $PID

} 
else
{
    #Read file from global location
    #Create Git folder if not exists - Clone
    #If exists pull

    Set-Location -Path "C:\SmartForexApp"    git config --global user.email rbabu.bala@gmail.com    git config --global user.name PP-Ram    if (!(Test-Path -path "C:\SmartForexApp\FxData")) {        git clone https://PP-Ram:pepsiusa10@github.com/PP-Ram/FxData.git    } else {       Set-Location -Path "C:\SmartForexApp\FxData"        git pull     }

    #Copy SmartForexApp patch update 
    Copy-Item "C:\SmartForexApp\FxData\Patch\*.*" "C:\SmartForexApp" -recurse


    #Open SmartForexApp exe
    Set-Location -Path "C:\SmartForexApp"

    & "C:\SmartForexApp\MasterSignal.Exe"

    #Kill process
    stop-process -Id $PID
}