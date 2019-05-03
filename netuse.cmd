Status       Lokal     Remote                    Netzwerk
----------------------------------------------------------------------------
OK           O:        \\mucosasafe.mucosalab.de\ourtools					Microsoft Windows Network
OK           P:        \\ukshikmb-zy037.i-kmb.de\public						Microsoft Windows Network
OK           R:        \\ukshikmb-sx002.mucosalab.de\transfer				Microsoft Windows Network
Nicht verfgb S:        https://sharepoint.uni-kiel.de/websites/sysinflame2/	Web Client Network
OK           T:        \\mucosasafe.mucosalab.de\projects2					Microsoft Windows Network
OK           U:        \\mucosasafe.mucosalab.de\nutzer						Microsoft Windows Network
OK           V:        \\mucosasafe.mucosalab.de\projects2\proj_I2B2		Microsoft Windows Network
Nicht verfgb W:        https://sharepoint.uni-kiel.de/websites/sysinflame/	Web Client Network
====================
OK           Z:        \\mucosasafe.mucosalab.de\Nutzer\t.richter			Microsoft Windows Network
REM damit trennst du alle laufwerke
net use * /D /Y
REM damit nur z.b. laufwerk x:
net use x: /D /Y
net use R: \\192.168.50.100\Datenverkehr /user:DOMÄNE\USER PASSWORT /persistent:no
REM net use V:\ \\mucosasafe.mucosalab.de\projects2\proj_I2B2
net use V: \\mucosasafe.mucosalab.de\projects2\proj_I2B2  
net use u: /D /Y
REM net use u: \\mucosasafe.mucosalab.de\Nutzer\t.richter\ /PERSISTENT:YES
REM net use u: \\mucosasafe\Nutzer\t.richter\ /PERSISTENT:YES
net use u: \\mucosasafe.mucosalab.de\Nutzer\t.richter /PERSISTENT:YES
net use z: /D /Y
net use z: \\mucosasafe.mucosalab.de\Nutzer\t.richter /PERSISTENT:YES
net use v: \\mucosasafe.mucosalab.de\projects2\proj_I2B2 /PERSISTENT:YES
net use y: \\ukshikmb-sl027.i-kmb.de\Alfresco /PERSISTENT:YES
net use x: \\ukshikmb-sl027.i-kmb.de\Alfresco\Sites\fdmmf /PERSISTENT:YES

net use m: \\sharepoint.uni-kiel.de@SSL\websites\centraxx /user:UNI_KIEL\sukmb327 /PERSISTENT:YES /SAVECRED

Status       Lokal     Remote                    Netzwerk

-------------------------------------------------------------------------------
Nicht verfgb M:        https://sharepoint.uni-kiel.de/websites/centraxx/	Web Client Network
OK           P:        \\ukshikmb-zy037.i-kmb.de\public						Microsoft Windows Network
Getrennt     R:        \\ukshikmb-sx002.mucosalab.de\transfer				Microsoft Windows Network
Nicht verfgb S:        https://sharepoint.uni-kiel.de/websites/sysinflame2/	Web Client Network
Nicht verfgb T:        https://sharepoint.uni-kiel.de/websites/kiths/		Web Client Network
OK           U:        \\mucosasafe.mucosalab.de\nutzer						Microsoft Windows Network
OK           V:        \\ukshikmb-sl071.i-kmb.de\data						Microsoft Windows Network
Nicht verfgb W:        https://sharepoint.uni-kiel.de/websites/sysinflame/	Web Client Network
OK           Y:        \\ukshikmb-sl027.i-kmb.de\Alfresco					Microsoft Windows Network
Nicht verfgb Z:        \\mucosasafe.mucosalab.de\Nutzer\t.richter			Microsoft Windows Network

Fehler bei der erneuten Verbindungsherstellung von 5: mit https://sharepoint.uni—kie|.de/websites/Sysinf|ame2/ 
Web Client Network: Ein an das System angeschlossenes Gerät  funktioniert nicht.  Die Verbindung wurde nicht wiederhergestellt.
                         
net use k: \\confluence.sysi.local:8090\webdav /PERSISTENT:YES
net use k: \\confluence.sysi.local\webdav /PERSISTENT:YES

REM NET USE * http://server url/webdav/username password /user:username
net use k: http://confluence.sysi.local:8090/plugins/servlet/confluence/default Zotifaxe3. /user:trichter
net use k: "http://confluence.sysi.local:8090/plugins/servlet/confluence/default" Zotifaxe3. /user:trichter

http://confluence.sysi.local:8090/plugins/servlet/confluence/default
net use * "https://confluence.sysi.local:8090/plugins/servlet/confluence/default" /user:trichter Zotifaxe3. /persistent:yes
net use * "\\confluence.sysi.local@8090\plugins\servlet\confluence\default"
\\confluence.sysi.local:8090\plugins\servlet\confluence\default

net use * \\UKSHIKMB-nw106\c /PERSISTENT:YES

