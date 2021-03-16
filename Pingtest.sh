#!/bin/bash
clear

[ -z ${1} ] &&  echo -en "Kindly supply source file \n\nUsage: $0 <Server list>\n $0 server_list.txt\n\n" && exit 1



ACTION ()
{
echo "######################"
echo "Hostname : ping_stat" 
echo "######################"
	for i in $(cat $1);do
		echo -en "$i : "
		ping -c 1 $i > /dev/null && echo "pingable"
	done

}


if [ !  -s $1 ];then
	echo -en "File \"$1\" no exists or Empty\n\nUsage: $0 <Server list>\n $0 server_list.txt\n\n"
else
	ACTION ${1} | column -t
fi

exit 0 
