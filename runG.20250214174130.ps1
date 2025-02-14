param(
    [string]$ProgramName
)

# Funktion zum Suchen und Starten eines Programms
function Start-ProgramIfExists {
    param(
        [string]$ExecutablePath
    )
    Write-Host "  Prüfe Existenz: '$ExecutablePath'" # Ausgabe hinzugefügt
    if (Test-Path $ExecutablePath) {
        Write-Host "  Programm gefunden und wird gestartet: $ExecutablePath"
        Start-Process -FilePath $ExecutablePath
        return $true
    }
    Write-Host "  Programm nicht gefunden unter: '$ExecutablePath'" # Ausgabe hinzugefügt
    return $false
}

# 1. Durchsuche den Pfad
Write-Host "Durchsuche den Pfad..."
$PathExecutables = Get-Command -Name $ProgramName -ErrorAction SilentlyContinue
if ($PathExecutables) {
    Write-Host "  Programme im Pfad gefunden:" # Ausgabe hinzugefügt
    foreach ($Executable in $PathExecutables) {
        Write-Host "    - $($Executable.Source)" # Ausgabe hinzugefügt
        if (Start-ProgramIfExists -ExecutablePath $Executable.Source) {
            return
        }
    }
} else {
    Write-Host "  Keine Programme im Pfad mit Namen '$ProgramName' gefunden." # Ausgabe hinzugefügt
}

# 2. Durchsuche .lnk-Dateien im Startmenü
Write-Host "Durchsuche Startmenü..."
$StartMenuFolders = @(
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs",
    "$env:UserProfile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
)

foreach ($StartMenuFolder in $StartMenuFolders) {
    Write-Host "  Durchsuche Ordner: '$StartMenuFolder'" # Ausgabe hinzugefügt
    $lnkFiles = Get-ChildItem -Path $StartMenuFolder -Filter "*.lnk" -Recurse -ErrorAction SilentlyContinue
    if ($lnkFiles) {
        Write-Host "    .lnk-Dateien gefunden:" # Ausgabe hinzugefügt
        foreach ($lnkFile in $lnkFiles) {
            Write-Host "      - '$($lnkFile.FullName)'" # Ausgabe hinzugefügt
            try {
                # Verwende WScript.Shell zum Auflösen der .lnk-Datei
                $Shell = New-Object -ComObject WScript.Shell
                if ($Shell -eq $null) { # Check if $Shell is null
                    Write-Warning "Fehler: WScript.Shell COM-Objekt konnte nicht erstellt werden!"
                    continue # Skip to the next .lnk file if WScript.Shell creation fails
                }
                $null = $Shell.CreateShortcut($lnkFile.FullName) # Ergebnis verwerfen
                $TargetPath = $Shortcut.TargetPath
                [System.Runtime.InteropServices.Marshal]::ReleaseComObject($Shell) # COM-Objekt freigeben
                [System.Runtime.InteropServices.Marshal]::ReleaseComObject($Shortcut) # COM-Objekt freigeben

                Write-Host "        Zielpfad der Verknüpfung: '$TargetPath'" # Ausgabe hinzugefügt
                if ($TargetPath -like "*$ProgramName*") {
                    Write-Host "        Zielpfad enthält Programmnamen." # Ausgabe hinzugefügt
                     if (Start-ProgramIfExists -ExecutablePath $TargetPath) {
                        return
                    }
                } else {
                    Write-Host "        Zielpfad enthält NICHT Programmnamen." # Ausgabe hinzugefügt
                }
            }
            catch {
                Write-Warning "Fehler beim Verarbeiten der Verknüpfungsdatei '$($lnkFile.FullName)': $_"
                # Fehler beim Zugriff auf die Verknüpfungsdatei ignorieren und fortfahren
            }

        }
    } else {
        Write-Host "    Keine .lnk-Dateien in '$StartMenuFolder' gefunden." # Ausgabe hinzugefügt
    }
}


# 3. Durchsuche konfigurierte Ordner
Write-Host "Durchsuche konfigurierte Ordner..."
$ConfiguredFolders = @(
    "C:\Programme",
    "C:\Programme (x86)",
    "C:\Tools" # Hier Ihre benutzerdefinierten Ordner hinzufügen
)

foreach ($ConfiguredFolder in $ConfiguredFolders) {
    Write-Host "  Durchsuche Ordner: '$ConfiguredFolder'" # Ausgabe hinzugefügt
    $ProgramFiles = Get-ChildItem -Path $ConfiguredFolder -Filter "$ProgramName*" -Recurse -ErrorAction SilentlyContinue
    if ($ProgramFiles) {
        Write-Host "    Programmdateien gefunden:" # Ausgabe hinzugefügt
        foreach ($ProgramFile in $ProgramFiles) {
            Write-Host "      - '$($ProgramFile.FullName)'" # Ausgabe hinzugefügt
            if ($ProgramFile.Extension -in (".exe", ".bat", ".cmd", ".ps1")) { # Ausführbare Dateitypen
                Write-Host "        Ausführbare Datei gefunden." # Ausgabe hinzugefügt
                if (Start-ProgramIfExists -ExecutablePath $ProgramFile.FullName) {
                    return
                }
            } else {
                Write-Host "        Keine ausführbare Datei (Erweiterung: $($ProgramFile.Extension))" # Ausgabe hinzugefügt
            }
        }
    } else {
        Write-Host "    Keine Programmdateien mit Namen '$ProgramName' in '$ConfiguredFolder' gefunden." # Ausgabe hinzugefügt
    }
}

Write-Host "Programm '$ProgramName' nicht gefunden."
