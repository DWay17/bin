# 
param(
    [string] $Source = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run',
    [string] $Destination = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run\AutorunsDisabled',
    [string] $regexpMatch = '.*(slack|teams).*'
)

# list all autorun entries in the source registry key maxdepth 1
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
    $existsInDest = Get-ItemProperty -Path $Destination -Name $entry.Name -ErrorAction SilentlyContinue
    if ($existsInDest) {
        Write-Host "Overwriting existing entry in destination: $($entry.Name)"    
        Move-ItemProperty -Path $Source -Name $entry.Name -Destination $Destination -Force
    } elseif ($entry.Name -match $regexpMatch) {
        Write-Host -ForegroundColor White "Moving entry matching regex '$regexpMatch': $($entry.Name)"    
        Move-ItemProperty -Path $Source -Name $entry.Name -Destination $Destination
    } else {
        Write-Host -ForegroundColor Gray "Keeping entry in source: $($entry.Name)"    
    }
}

