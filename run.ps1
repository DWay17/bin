param(
    [Parameter(Mandatory = $true)]
    [string]$ProgramName
)

# Funktion zum Suchen und Starten eines Programms
function Start-ProgramIfExists {
    param(
        [string]$ExecutablePath
    )
    if (Test-Path $ExecutablePath) {
        Write-Host "Programm gefunden und wird gestartet: $ExecutablePath"
        Start-Process -FilePath $ExecutablePath
        return $true
    }
    return $false
}

$found = $false

# 1. Suche im PATH
Write-Host "`n--- Suche im PATH ---`n"

$PathExecutables = Get-Command -Name $ProgramName -ErrorAction SilentlyContinue
if ($PathExecutables) {
    Write-Host "Programme im PATH gefunden:"
    foreach ($Executable in $PathExecutables) {
        Write-Host "  - $($Executable.Source)"
        if (Start-ProgramIfExists -ExecutablePath $Executable.Source) {
            $found = $true
            break
        }
    }
}
else {
    Write-Host "Keine Programme im PATH mit Namen '$ProgramName' gefunden."
}

# 2. Durchsuche Startmenü-Verknüpfungen und Desktop-Ordner
if (-not $found) {
    Write-Host "`n--- Durchsuche Startmenü- und Desktop-Verknüpfungen ---`n"

    $searchPaths = @(
        "$env:UserProfile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs",
        "$env:UserProfile\Desktop"
        "$env:ProgramData\Microsoft\Windows\Start Menu\Programs",
        "$env:AppData\Microsoft\Windows\Start Menu\Programs",
        "$env:Public\Desktop"
    )

    foreach ($searchPath in $searchPaths) {
        Write-Host "Durchsuche Pfad: '$searchPath'"
        if (Test-Path $searchPath) {
            try {
                $lnkFiles = Get-ChildItem -Path $searchPath -Filter "*.lnk" -Recurse -ErrorAction SilentlyContinue
                if ($lnkFiles) {
                    foreach ($lnkFile in $lnkFiles) {
                        try {
                            # Verwende WScript.Shell zum Auflösen der .lnk-Datei
                            $Shell = New-Object -ComObject WScript.Shell
                           
                            $Shortcut = $Shell.CreateShortcut($lnkFile.FullName)
                            $TargetPath = $Shortcut.TargetPath

                            # COM-Objekte freigeben
                            if ($Shell) { [System.Runtime.InteropServices.Marshal]::ReleaseComObject($Shell) | Out-Null }
                            if ($Shortcut) { [System.Runtime.InteropServices.Marshal]::ReleaseComObject($Shortcut) | Out-Null }
                            # skip unins000.exe
                            #-like "*$ProgramName*"
                            
                            if ($TargetPath -like "*$ProgramName*") {
                                if ($lnkFile -like "*uninstall*") {
                                    Write-Host "Verknüpfung gefunden: '$($lnkFile.FullName)' ... skip"
                                    continue 
                                }
                                Write-Host "Programm gefunden in Verknüpfung: '$($lnkFile.FullName)'"
                                Write-Host "Zielpfad der Verknüpfung: '$TargetPath'"
                                # check for unins000
                                if ($TargetPath -like "*unins*") {
                                    Write-Host "uninst gefunden: '$TargetPath' ... skip"
                                    continue
                                }
                                if (Start-ProgramIfExists -ExecutablePath $TargetPath) {
                                    $found = $true
                                    break
                                }
                            }
                        }
                        catch {
                            Write-Warning "Fehler beim Verarbeiten der Verknüpfungsdatei '$($lnkFile.FullName)': $($_.Exception.Message)"
                            continue
                        }
                    }
                    if ($found) { break }
                }
                else {
                    Write-Host "Keine .lnk-Dateien in '$searchPath' gefunden."
                }
            }
            catch {
                Write-Warning "Fehler beim Durchsuchen von '$searchPath': $($_.Exception.Message)"
                continue
            }
        }
        else {
            Write-Host "Pfad '$searchPath' konnte nicht gefunden oder geöffnet werden."
            continue
        }
    }
}

# 3. Durchsuche konfigurierte Ordner
if (-not $found) {
    Write-Host "`n--- Durchsuche konfigurierte Ordner ---`n"

    $ConfiguredFolders = @(
        "C:\Programme",
        "C:\Programme (x86)",
        "C:\Programs",
        "$env:UserProfile\AppData\Local\Programs"
        #"$env:UserProfile\Downlaods"
        # Hier weitere benutzerdefinierte Ordner hinzufügen
    )

    foreach ($ConfiguredFolder in $ConfiguredFolders) {
        Write-Host "Durchsuche Ordner: '$ConfiguredFolder'"
        if (Test-Path $ConfiguredFolder) {
            try {
                $ProgramFiles = Get-ChildItem -Path $ConfiguredFolder -Filter "$ProgramName*" -Recurse -ErrorAction SilentlyContinue
                if ($ProgramFiles) {
                    foreach ($ProgramFile in $ProgramFiles) {
                        if ($ProgramFile.Extension -in (".exe", ".bat", ".cmd", ".ps1")) {
                            Write-Host "Ausführbare Datei gefunden: '$($ProgramFile.FullName)'"
                            if (Start-ProgramIfExists -ExecutablePath $ProgramFile.FullName) {
                                $found = $true
                                break
                            }
                        }
                    }
                    if ($found) { break }
                }
                else {
                    Write-Host "Keine Dateien mit Namen '$ProgramName' in '$ConfiguredFolder' gefunden."
                }
            }
            catch {
                Write-Warning "Fehler beim Durchsuchen von '$ConfiguredFolder': $($_.Exception.Message)"
                continue
            }
        }
        else {
            Write-Host "Ordner '$ConfiguredFolder' konnte nicht gefunden oder geöffnet werden."
            continue
        }
    }
}

if (-not $found) {
    Write-Host "Programm '$ProgramName' nicht gefunden."
}
