# Get-Process and list only name and company and make it uniq
#Get-Process | Select-Object -Property Name, @{Name='Company';Expression={(Get-Process -Id $_.Id).Path | ForEach-Object { (Get-Item $_).VersionInfo.CompanyName }}} | Sort-Object Name, Company -Unique
#Get-Process | Select-Object -Property Name, Company | Sort-Object Name, Company -Unique
# Get-Process | ForEach-Object {
#     $path = $_.Path
#     if ($path) {
#         $company = (Get-Item $path).VersionInfo.CompanyName
#         [PSCustomObject]@{
#             Name    = $_.Name
#             Company = $company
#         }
#     }
# } | Sort-Object Name, Company -Unique
param (
     [string]$Filter
)
Write-Host "Running script: $($MyInvocation.MyCommand.Name)`n"

Get-Process | ForEach-Object {
    $path = $_.Path
    if ($path) {
        $company = (Get-Item $path).VersionInfo.CompanyName
        $name = $_.Name
        if (-not $Filter -or $name -like "*$Filter*" -or $company -like "*$Filter*") {
            [PSCustomObject]@{
                Name    = $name
                Company = $company
            }
        }
    }
} | Sort-Object Name, Company -Unique

