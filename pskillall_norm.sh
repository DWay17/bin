#!/bin/sh
# pskillall needs pskill from sysinternals
PROCS[0]=BleServicesCtrl.exe 
PROCS[1]=igfxEM.exe 
PROCS[2]=igfxHK.exe 
PROCS[3]=igfxTray.exe 
PROCS[4]=iusb3mon.exe 
PROCS[5]=jusched.exe 
PROCS[6]=LSCNotify.exe 
PROCS[7]=Monitor.exe 
PROCS[8]=MCPLaunch.exe 
PROCS[9]=Pelico.exe 
PROCS[10]=PresentationFontCache.exe
PROCS[11]=QuickDisplayAgent.exe 
PROCS[12]=RAVBg64.exe 
PROCS[13]=RAVCpl64.exe 
PROCS[14]=SCHTASK.EXE 
#PROCS[15]=SKDaemon.exe 
PROCS[16]=SynTPEnh.exe 
PROCS[17]=SynTPHelper.exe 
PROCS[18]=SynTPLpr.exe 
PROCS[19]=TpKnrres.exe 
PROCS[20]=TpShocks.exe 
pskillall.sh ${PROCS[@]}
