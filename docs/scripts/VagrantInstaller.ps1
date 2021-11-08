# ----------------------------------------------------
# install chocolatey
# ----------------------------------------------------

try{
    $testchoco = powershell choco -V
    if(-not($testchoco)){
        Write-Host "Chocolatey is not installed, installing now" -ForegroundColor Green
        Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
    else{
        Write-Host "Chocolatey Version $testchoco is already installed" -ForegroundColor Green
}
}Catch{
    Write-Warning -Message $("Something went wrong while installing Chocolatey. Error: "+ $_.Exception.Message)
}

# ----------------------------------------------------
# install vagrant
# ----------------------------------------------------
    
try{
    $testvagrant = powershell vagrant -v
    if(-not($testvagrant)){
        Write-Host "Vagrant is not yet installed, installing now." -ForegroundColor Green
        choco install vagrant
    }
    else{
        Write-Host "Vagrant is already installed. Version: $testvagrant" -ForegroundColor Green
    }
}Catch{
    Write-Warning -Message $("Something went wrong while installing Vagrant. Error: "+ $_.Exception.Message)
}

# ----------------------------------------------------
# install VirtualBox
# ----------------------------------------------------
Write-Host "Checking and installing if virtualbox is not installed" -ForegroundColor green
choco install virtualbox

Pause