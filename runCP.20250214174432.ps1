param(
    [Parameter(Mandatory=$true)]
    [string]$ProgramName
)

$found = $false

# 1. Suche im PATH
$paths = $env:Path.Split(';')
foreach ($path in $paths) {
    $exePath = Join-Path $path "$ProgramName.exe"
    if (Test-Path $exePath) {
        Write-Host "Programm gefunden in: $exePath"
        Start-Process $exePath
        $found = $true
        break
    }
}

# 2. Suche in den .lnk-Dateien des Startmenüs
if (-not $found) {
    $startMenuPaths = @(
        "$env:ProgramData\Microsoft\Windows\Start Menu\Programs",
        "$env:AppData\Microsoft\Windows\Start Menu\Programs"
    )
    foreach ($startMenuPath in $startMenuPaths) {
        if (Test-Path $startMenuPath) {
            try {
                $lnkFiles = Get-ChildItem -Path $startMenuPath -Filter "*.lnk" -Recurse -ErrorAction Stop
                foreach ($lnk in $lnkFiles) {
                    $shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($lnk.FullName)
                    if ($shortcut.TargetPath -like "*$ProgramName*") {
                        Write-Host "Programm gefunden in: $($shortcut.TargetPath)"
                        Start-Process $shortcut.TargetPath
                        $found = $true
                        break
                    }
                }
                if ($found) { break }
            } catch {
                Write-Host "Fehler beim Durchsuchen von '$startMenuPath': $_"
                continue
            }
        } else {
            Write-Host "Startmenü-Pfad '$startMenuPath' konnte nicht gefunden oder geöffnet werden."
            continue
        }
    }
}

# 3. Suche in drei konfigurierten Ordnern
if (-not $found) {
    $configFolders = @(
        "C:\Ordner1",
        "C:\Ordner2",
        "C:\Ordner3"
    )
    foreach ($folder in $configFolders) {
        if (Test-Path $folder) {
            try {
                $exeFiles = Get-ChildItem -Path $folder -Filter "*.exe" -Recurse -ErrorAction Stop
                foreach ($exe in $exeFiles) {
                    if ($exe.Name -like "*$ProgramName*") {
                        Write-Host "Programm gefunden in: $($exe.FullName)"
                        Start-Process $exe.FullName
                        $found = $true
                        break
                    }
                }
                if ($found) { break }
            } catch {
                Write-Host "Fehler beim Durchsuchen von '$folder': $_"
                continue
            }
        } else {
            Write-Host "Konfigurierter Ordner '$folder' konnte nicht gefunden oder geöffnet werden."
            continue
        }
    }
}

if (-not $found) {
    Write-Host "Programm '$ProgramName' nicht gefunden."
}
