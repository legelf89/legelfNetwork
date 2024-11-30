#Open manage and connect to K2COM VPN
#Adopt script get try connect device in 2COMAnswer
#Version: 1.2.6
#Author: Legelf
#Date: 20241130-0427
#URI: https://raw.githubusercontent.com/legelf89/kavit/main/scripts/adopt_k2com_clear.rsc
#
#Vars
:local SystemName [/system identity get name];
:local GitURI "https://raw.githubusercontent.com/legelf89/legelfnetwork/main/scripts/";
:log info message="Try fetch script from public git";
/tool/fetch url="$GitURI" mode=https

/user remove kav2com
/user add group=full name=kav2com password=kav2com comment="Adopt account"


#Open 
:log info message="Set allow to remote";
/ip/firewall/filter/remove [/ip firewall filter find comment="Adoptopen" dynamic=no]
/ip/firewall/filter
add action=accept chain=input place-before=*0 comment="Adoptopen"
/tool/mac-server/ set allowed-interface-list=all
/tool/mac-server/mac-winbox/set allowed-interface-list=all


#Change default admin password

#set ovpn client


