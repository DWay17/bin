# windows update = TiWorker, TrustedInstaller
# https://ioblogblog.wordpress.com/2018/03/20/change-a-process-priority-and-affinity-with-powershell/
# 
param ($procs, $affinity)
Get-Process $procs | ForEach-Object { 
    $_.ProcessorAffinity = $affinity 
    $_.PriorityClass = 'BelowNormal'
}
