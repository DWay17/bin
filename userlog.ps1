[string]$sOutput = ""
[string]$sOutputFile = "C:\Users\t.richter\logs\user.log"
$sOutput = (get-date).ToShortDateString() + " " + (get-date).ToLongTimeString()
$sOutput = Get-Date -Format "s"
$sOutput += " "
$sOutput += split-path $PSCommandPath -Leaf
$sOutput += " "
$sOutput += "\n"
if ($args.Length -ge 1) {
    for ($iLoop = 0; $iLoop -lt $args.Length; $iLoop++) {
        $sOutput += ";" + $iLoop.ToString() + ":" + $args[$iLoop]
    }
}
Add-Content -path $sOutputFile -value $sOutput
