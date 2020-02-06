#!/bin/bash
# Purpose: This script provids menue to connect list of servers 
# Test
# Auther: Shridhar kute,  shridharkute02@gmail.com

# Define server list based on usage
SMTP_srv="SMTP1 SMTP2 SMTP3 SMTP4 SMTP5"
nx_srv="nxgen nxgen nxgen nxgen nxgen nxgen"
DNS_srv="dns1 dns2 dns3 dns4 dns5 dns6"

FULL_LIST="SMTP_srv DNS_srv nx_srv" 




Connect_server (){ 
echo -en "Please press \033[91mc\033[0m  key to disconnect\n"
select server in $FULL_LIST;do
	case $server in
		$server) echo "connecting ${!server}"
			select	srv in ${!server} previous_menu;do
				case $srv in
					$srv) echo "Connecting $srv"
					if [ $srv = previous_menu ];then
						break
					else
						ssh -o StrictHostKeyChecking=no $srv uptime
					fi
					;;
					
					*) echo "there is X$srv"
					break
					;;
				esac
			done
		;;
		
		*) echo "Failed "
		;;
		
		
	esac
done

}



Connect_server