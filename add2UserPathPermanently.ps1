# add2UserPathPermanently.ps1
# This script adds specified directories to the user's PATH environment variable permanently.
param (
    [string[]]$DirectoriesToAdd = @(
        "$env:USERPROFILE\bin",
        "$env:USERPROFILE\Documents\GitHub\PowerShell-Scripts\bin"
    ),
    [string[]]$SubDirectoriesToAdd = @(
        "$env:USERPROFILE\AppData\Local\Microsoft\WinGet\Packages\"
    )
)
SubDirectoriesToAdd
# extend DirectoriesToAdd with scanning for directories containing executables in SubDirectoriesToAdd
foreach ($subDir in $SubDirectoriesToAdd) {
    # Get all directories in the specified subdirectory that contain executables
    $foundDirs = Get-ChildItem -Path $subDir -Directory -Recurse | Where-Object {
        $_.GetFiles("*.exe", [System.IO.SearchOption]::AllDirectories).Count -gt 0
    }
    foreach ($dir in $foundDirs) {
        $DirectoriesToAdd += $dir.FullName
    }
}
# Combine the main directories with the subdirectories
# Get the current user's PATH environment variable
$currentPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
# Split the current PATH into an array
$pathArray = $currentPath -split ';'
# Add each directory to the PATH if it doesn't already exist
foreach ($directory in $DirectoriesToAdd) {
    # check if directory exists
    if (( (Test-Path -Path $directory)) && -not ($pathArray -contains $directory)) {
        $pathArray += $directory
        Write-Host "Adding $directory to PATH."
    } else {
        Write-Host "$directory is already in PATH, skipping."
    }
}
# Join the updated array back into a single string
$newPath = $pathArray -join ';'
# Set the updated PATH environment variable permanently for the user
[Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)
Write-Host "Updated PATH environment variable for the user."
# Optionally, you can refresh the environment variables in the current session
$env:Path = $newPath
Write-Host "Current session PATH updated."
# End of script
# Note: This script requires administrative privileges to run successfully.