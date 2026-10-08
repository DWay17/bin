# chat im
$logFile = "C:\Users\trichter\logs\chat.log"
#$(
#& {
#. {
	# Start-Process "C:\Users\Public\Desktop\Zulip.lnk"          *>&1 >>$logFile ;
	# #Start-Process "C:\Users\trichter\Desktop\Slack.lnk"       *>&1 >>$logFile ;
	# Start-Process "C:\Users\trichter\Desktop\Rocket.Chat.lnk" *>&1 >>$logFile ;
	# Start-Process 'C:\Users\trichter\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Element\Element.lnk' *>&1 >>$logFile ;
#) 4>&1 3>&1 2>&1 >> $logFile
#) *>&1 >> $logFile
#} *>&1 >> $logFile

run.ps1 Rocket.Chat

run.ps1 zulip
run.ps1 slack
run.ps1 element
