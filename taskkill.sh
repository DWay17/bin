#!/bin/sh
CMD="taskkill.exe"
TREE="/T"
FORCE="/F"
FILTER="/FI"
IMAGE="/IM"
F_WINDOWTITLE="WINDOWTITLE"
$CMD $TREE $FILTER "IMAGENAME eq googledrive*"
# Skdaemon.exe	Skdaemon.exe			10:16:37 05.10.2018	0:00:00.265		5.032 K		12.864 K	5416	USB Ehanced Performance Keyboard	LITE-ON TECHNOLOGY CORP.	I-KMB\t.richter
$CMD $IMAGE Skdaemon.exe
# WinGPG.exe	WinGPG.exe			10:16:37 05.10.2018	0:00:00.015		1.684 K		6.020 K	5768	WinGPG	SCAND Ltd.	I-KMB\t.richter		
$CMD $IMAGE WinGPG.exe 
#$CMD $FILTER "$F_WINDOWTITLE *Firmware*"
#$CMD $FILTER "WINDOWTITLE M*Firmware*"
#TpShocks.exe	TpShocks.exe			10:16:36 05.10.2018	0:00:00.015		2.612 K		6.036 K	5112	ThinkVantage Active Protection System	Lenovo.	I-KMB\t.richter		
#TpKnrres.exe	TpKnrres.exe	0.01	0.01	10:16:36 05.10.2018	0:00:00.483		7.492 K		8.956 K	5072	Communications Utility launcher	Lenovo Group Limited	I-KMB\t.richter		
$CMD $TREE $FILTER "IMAGENAME eq Tp*"
#SynTPEnh.exe	SynTPEnh.exe	< 0.01	< 0.01	10:16:36 05.10.2018	0:00:00.530		10.492 K		17.260 K	5084	Synaptics TouchPad 64-bit Enhancements	Synaptics Incorporated	I-KMB\t.richter		
#SynTPLpr.exe	SynTPLpr.exe			10:16:44 05.10.2018	0:00:00.031		2.668 K		6.328 K	6296	TouchPad Driver Helper Application	Synaptics Incorporated	I-KMB\t.richter		
$CMD $TREE $FILTER "IMAGENAME eq SynTP*"
#FirmwareUpdaterService.exe	FirmwareUpdaterService.exe		0.17	10:15:40 05.10.2018	0:00:00.031		3.256 K		8.088 K	2532			<access denied>		
#FirmwareApp.exe	FirmwareApp.exe	0.16	0.16	10:16:08 05.10.2018	0:00:01.107		6.716 K		16.200 K	4196	Firmware		I-KMB\t.richter
$CMD $TREE $FILTER "IMAGENAME eq Firmware*"
#WDDriveService.exe	WDDriveService.exe	0.65	0.65	10:15:46 05.10.2018	0:00:09.937		9.528 K		14.536 K	3496	WD Drive Service	Western Digital Technologies, Inc.	<access denied>		
#WDDMStatus.exe	WDDMStatus.exe	0.04	0.04	10:16:39 05.10.2018	0:00:01.700		17.236 K		25.124 K	6840	WD Quick View	Western Digital Technologies, Inc.	I-KMB\t.richter
#WDBackupEngine.exe	WDBackupEngine.exe	< 0.01	< 0.01	10:15:47 05.10.2018	0:00:02.324		42.864 K		44.616 K	3832	WD Backup Engine	Western Digital Technologies, Inc.	<access denied>
#WDDriveAutoUnlock.exe	WDDriveAutoUnlock.exe	0.06	0.06	10:16:39 05.10.2018	0:00:01.934		2.840 K		8.696 K	6752	WD Drive Auto Unlock	Western Digital	I-KMB\t.richter		
$CMD $TREE $FILTER "IMAGENAME eq WD*"
#swi_service.exe	swi_service.exe	0.04	0.04	10:15:46 05.10.2018	0:00:01.466		43.288 K		21.624 K	3304	Sophos Web Intelligence	Sophos Limited	<access denied>		
$CMD $TREE $FILTER "IMAGENAME eq swi_service*"
#LSCNotify.exe	LSCNotify.exe		25.50	10:17:15 05.10.2018	0:00:00.124		2.924 K		10.124 K	10132	Lenovo Solution Center Notifications	Lenovo	I-KMB\t.richter		
$CMD $TREE $FILTER "IMAGENAME eq LSC*"

