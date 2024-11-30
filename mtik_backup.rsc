##################################################################
#
#// Author: Legelf	
#// Descritpion: automated backup export to ftp
#// Version: 3.1
#// Name: mtik_backup
#// Date: 20241130
#
##################################################################
:local ftphost "192.168.7.70"
:local ftpuser "legelfnetwork"
:local ftppassword "11111111"
:local ftppath "mtik_backup"
:local systemidentity [/system identity get name];
:local systemSN [/system/routerboard get serial-number];
:local nowtime [/system/clock get time];
:local nowdate [/system/clock get date];
:local backupname "$systemidentity-$nowdate-$nowtime"

:log info message="System backup start $systemidentity";
:log info message="System backup create to $backupname ";

/system/backup/save password=11111111 name="$backupname"

:log info message="System backup upload";
/tool fetch address="$ftphost" src-path="$backupname.backup" user="$ftpuser" mode=ftp password="$ftppassword" dst-path="$ftppath/$backupname.backup" upload=yes

:log info message="System backup cleanup $backupname.backup";
/file/remove "$backupname.backup"

:log info message="System backup end";