##
#!/usr/bin/env -S pwsh -file
# Source - https://stackoverflow.com/a/48218913
# Posted by Cy Rossignol, modified by community. See post 'Timeline' for change history
# Retrieved 2026-09-24, License - CC BY-SA 3.0

#!/usr/bin/env powershell -File
# Source - https://stackoverflow.com/a/48218913
# Posted by Cy Rossignol, modified by community. See post 'Timeline' for change history
# Retrieved 2026-09-24, License - CC BY-SA 3.0

#!/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -File

# rename_install.ps1
#get old name of cmd args

function handle_one {
	$fname = $args[0]
	$basename = [System.IO.Path]::GetFileNameWithoutExtension($fname)
	$ext = [System.IO.Path]::GetExtension($fname)
	# get details from file
	# (Get-Item 'C:\Path\To\YourFile.exe').VersionInfo | Select-Object ProductName, ProductVersion
	$prod_name = (Get-Item $fname).VersionInfo.ProductName
	$version = (Get-Item $fname).VersionInfo.ProductVersion
	# contruct new name
	$newname = ""
	$newname += $prod_name
	$newname += $basename
	$newname += "."
	$newname += "."
	$newname += $version
	$newname += "."
	$newname += $ext
	# clrean up space -> _ and .. -> .
	$newname = $newname -replace " ", "_"
	$newname = $newname -replace "\.\.", "."
	
	# give out names
	Write-Host "Old name: $fname"
	write-Host "New name: $newname"
	# copy file 
	Copy-Item -Path $fname -Destination $newname
}


if ($args.Length -ge 1) {
	write-Host "args $args"
	for ($iLoop = 0; $iLoop -lt $args.Length; $iLoop++) {
		handle_one $args[$iLoop]
	}    
} else {
	# read file names from pipe
    write-Host "No args, reading from pipe"
    $input | ForEach-Object {
        handle_one $_
    }
}
