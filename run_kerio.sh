
NAME=mailserver # processname 
while true; do 
[ $(pidof $NAME) ] && echo "Mailserver is running." || /opt/kerio/mailserver/mailserver /opt/kerio/mailserver 
sleep 5
 done  
