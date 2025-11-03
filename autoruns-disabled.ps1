# 
param(
    [string[]] $Sources = @(
        'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run',
        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',
        'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run';
    ),
    [string] $Destination = 'AutorunsDisabled',
    [string] $regexpMatch = '.*(slack|teams).*'
)
foreach ($Source in $Sources) {
    Write-Host "Processing source key: $Source"
    # create destination key if it doesn't exist
    if (-not (Test-Path "$Source\$Destination")) {
        New-Item -Path "$Source\$Destination" | Out-Null
        Write-Host "Created destination key: $Source\$Destination"
    }
    $entries = Get-ItemProperty -Path $Source
    #Write-Host "Autorun entries in $Source"
    #Write-Host "$entries"
    # use foreach to iterate through each entry and print its name
    foreach ($entry in $entries.PSObject.Properties) {
        # skip the default properties
        if ($entry.Name -match '^(PSPath|PSParentPath|PSChildName|PSDrive|PSProvider)$') { 
            continue
        }
        Write-Host -ForegroundColor DarkGray "Name: $($entry.Name), Value: $($entry.Value)"
        # if name exists in destination overwrite it
        $existsInDest = Get-ItemProperty -Path "$Source\$Destination" -Name $entry.Name -ErrorAction SilentlyContinue
        if ($existsInDest) {
            Write-Host "Overwriting existing entry in destination: $($entry.Name)"
            Move-ItemProperty -Path $Source -Name $entry.Name -Destination "$Source\$Destination" -Force
        } elseif ($entry.Name -match $regexpMatch) {
            Write-Host -ForegroundColor White "Moving entry matching regex '$regexpMatch': $($entry.Name)"
            Move-ItemProperty -Path $Source -Name $entry.Name -Destination "$Source\$Destination"
        } else {
            Write-Host -ForegroundColor Gray "Keeping entry in source: $($entry.Name)"
        }
    }
    Write-Host "Finished processing source key: $Source`n"
}
