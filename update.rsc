#Open manage and connect to K2COM VPN
#Adopt script get try connect device in 2COMAnswer
#Version: 1.2.7
#Author: Legelf
#Date: 20241130-0501
#https://raw.githubusercontent.com/legelf89/legelfnetwork/refs/heads/main/update.rsc
#
#Vars
:local SystemName [/system identity get name];
:local GlobalFileName "all.rsc";
:local PersonalFileName "$SystemName.rsc";
:local CloudFileName "$SystemName.cloud.txt";
:local AdminUser "legelf";
:local AdminPass "atmegaLGF89";
:log info "UPD:Update script BEGIN";

#delete AdminUser
:if ([:len [/user find name=$AdminUser;]] > 0) do={
/user remove $AdminUser;
:log info message="UPD:Remove $AdminUser";
}

#Set AdminUser
:log info message="UPD:Add $AdminUser";
/user add name="$AdminUser" password="$AdminPass" group=full
#:log info message="UPD:Update script END";