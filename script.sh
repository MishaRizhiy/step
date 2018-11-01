#! /bin/bash

RED="\033[31m"
GREEN="\033[32"
END="\033[0m"


function first (){
while true;
do 
clear
echo -e "$RED script$END"
echo -e "1)User\t"
echo -e "2)Time\t"
echo -e "3)Date\t"
echo -e "4)Homedir\t"
echo -e "5)Next page\t"
echo -e "6)Exit\t"
read x
case $x in 
1)
echo -e "$RED Current User:$END $GREEN $USER $END"
;;
2) 
echo -e "$RED Current Time:$END $GREEN `date +"%T"`$END"
;;
3)
echo -e "$RED Current Date:$END $GREEN `date +"%y-%m-%d"`$END"
;;
4)
echo -e "$RED Space homedir:$END $GREEN`df -h $HOME`$END"
;;
5)
echo -e "next page"
second
;;
6)
exit 0
;; 
esac
sleep 2 
done
}

function second (){
while true;
do
clear
echo -e "1)IP\t"
echo -e "2)Active users\t"
echo -e "3)Uptime\t"
echo -e "4)Last 10 logs\t"
echo -e "5)Previos menu\t"
echo -e "6)Exit\t"

read y
case  $y in
1)
echo -e "$RED IP:$END $GREEN`ifconfig enp0s3 | grep "inet "| awk '{print $2}'`$END" 
;;
2)
echo -e "$RED Activ users:$END $GREEN`w`$END"
;;
3)
echo -e "$RED Uptime:$END $GREEN`uptime`$END"
;;
4)
echo -e "$RED Last 10 logs:$END $GREEN`tail -10 /var/log/secure`$END" 
;;
5)
echo -e "previos menu"
first
;;
6)
exit 0
;;
esac
sleep 2
done
}

first


