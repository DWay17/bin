choco outdated -r | ConvertFrom-Csv -Delimiter '|' -Header 'Package name', 'Current', 'Available', 'Pinned?' | Format-Table
