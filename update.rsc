#Open manage and connect to K2COM VPN
#Adopt script get try connect device in 2COMAnswer
#Version: 1.2.7
#Author: Legelf
#Date: 20241130-0427
#URI: https://github.com/legelf89/legelfnetwork/blob/main/update.rsc
#https://raw.githubusercontent.com/legelf89/legelfnetwork/refs/heads/main/update.rsc
#
#Vars
:local SystemName [/system identity get name];
:local GitURI "https://raw.githubusercontent.com/legelf89/legelfnetwork/main/scripts/";
:local systemidentity [/system identity get name];
:local systemSN [/system/routerboard get serial-number];
:local nowtime [/system/clock get time];
:local nowdate [/system/clock get date];
#
:local backupname "$systemidentity-$nowdate-$nowtime-beforechange"
:log info message="System backup start $systemidentity";
:log info message="System backup create to $backupname ";
/system/backup/save password=11111111 name="$backupname"
#
:log info message="Try fetch script from public git";
/tool/fetch url="$GitURI" mode=https
