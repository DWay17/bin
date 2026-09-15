param(
    [string]$ProgramName
)

# Funktion zum Suchen und Starten eines Programms
function Start-ProgramIfExists {
    param(
        [string]$ExecutablePath
    )
    #Write-Host "  Prüfe Existenz: '$ExecutablePath'" # Ausgabe entfernt (optional wieder hinzufügen)
    if (Test-Path $ExecutablePath) {
        Write-Host "  Programm gefunden und wird gestartet: $ExecutablePath"
        Start-Process -FilePath $ExecutablePath
        return $true
    }
    #Write-Host "  Programm nicht gefunden unter: '$ExecutablePath'" # Ausgabe entfernt (optional wieder hinzufügen)
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
    Write-Host "  Durchsuche Startmenü-Ordner: '$StartMenuFolder'" # Ausgabe hinzugefügt
    $lnkFiles = Get-ChildItem -Path $StartMenuFolder -Filter "*.lnk" -Recurse -ErrorAction SilentlyContinue
    if ($lnkFiles) {
        #Write-Host "    .lnk-Dateien gefunden in Ordner '$StartMenuFolder':" # Ausgabe entfernt
        foreach ($lnkFile in $lnkFiles) {
            #Write-Host "      - '$($lnkFile.FullName)'" # Ausgabe entfernt
            try {
                # Verwende WScript.Shell zum Auflösen der .lnk-Datei
                $null = New-Object -ComObject WScript.Shell
                if ($Shell -eq $null) { # Prüfe, ob $Shell null ist
                    #Write-Warning "Fehler: WScript.Shell COM-Objekt konnte nicht erstellt werden! Datei: '$($lnkFile.FullName)'" # Warnung bleibt, aber optional entfernen
                    continue # Überspringe diese .lnk-Datei, falls die COM-Objekterstellung fehlschlägt
                }
                $null = $Shell.CreateShortcut($lnkFile.FullName) # Shortcut-Objekt erstellen
                $TargetPath = $Shortcut.TargetPath

                # COM-Objekte freigeben, aber nur wenn sie nicht null sind
                if ($Shell) { $null = [System.Runtime.InteropServices.Marshal]::ReleaseComObject($Shell) } # Ausgabe verwerfen
                if ($Shortcut) { $null = [System.Runtime.InteropServices.Marshal]::ReleaseComObject($Shortcut) } # Ausgabe verwerfen


                #Write-Host "        Zielpfad der Verknüpfung: '$TargetPath'" # Ausgabe entfernt
                if ($TargetPath -like "*$ProgramName*") {
                    Write-Host "        Starte Programm über Verknüpfung: '$($lnkFile.FullName)' -> '$TargetPath'" # Erfolgsmeldung mit Link- und Zielpfad
                     if (Start-ProgramIfExists -ExecutablePath $TargetPath) {
                        return
                    }
                } #else { # Der "nicht gefunden" Fall ist jetzt still
                #    Write-Host "        Zielpfad enthält NICHT Programmnamen." # Ausgabe entfernt
                #}
            }
            catch {
                Write-Warning "Fehler beim Verarbeiten der Verknüpfungsdatei '$($lnkFile.FullName)': $_ - $($_.Exception.Message)" # Warnung bleibt, aber optional entfernen
                # Fehler beim Zugriff auf die Verknüpfungsdatei ignorieren und fortfahren
            }
        }
    } else {
        Write-Host "    Keine .lnk-Dateien in Ordner '$StartMenuFolder' gefunden." # Ausgabe hinzugefügt
    }
}


# 3. Durchsuche konfigurierte Ordner
Write-Host "Durchsuche konfigurierte Ordner..."
$ConfiguredFolders = @(
    "C:\Programme",
    "C:\Programme (x86)",
    "C:\Tools", # Hier Ihre benutzerdefinierten Ordner hinzufügen
    "C:\Program Files\Google\Chrome\Application",  # Typischer Chrome Installationspfad (64-bit)
    "C:\Program Files (x86)\Google\Chrome\Application" # Typischer Chrome Installationspfad (32-bit)
)

foreach ($ConfiguredFolder in $ConfiguredFolders) {
    Write-Host "  Durchsuche konfigurierte Ordner: '$ConfiguredFolder'" # Ausgabe hinzugefügt
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
