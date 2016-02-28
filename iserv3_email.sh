#!/bin/bash

# This code is under the MIT License (MIT)
# See license.txt for whole License

iservhost=""
#lact=""
#lpwd=""

read -p "Account: " lact
read -s -p "Passwort: " lpwd


cookiefile="/tmp/iservcookie.txt"

curl --silent -d "_username=$lact&_password=$lpwd" -c $cookiefile "${iservhost}v3/login_check" > /dev/null
alles=$(curl -b $cookiefile "${iservhost}v3/mail/api/message/list?searchQuery=%7B%22flagUnseen%22:true%7D&order=%7B%22column%22:%22date%22,%22dir%22:%22desc%22%7D")


output=""
a=${alles#*'unseen": '}
a=${a%','*}
for x in $(seq 1 $a)
do
alles=${alles#*'uid": '}
uid=${alles%%","*}
alles=${alles#*'name": "'}
sname=${alles%%'"'*}
alles=${alles#*'subject": "'}
subject=${alles%%'"'*}
alles=${alles#*'date": "'}
sdate=${alles%%'"'*}
output="$output\n$subject\n$sname, $sdate\n${iservhost}msg/msg.php?INBOX/$uid\n"
#output="$output\n$subject\n$sname, $sdate\n${iservhost}v3/mail?path=INBOX&msg=$uid\n"
done



if [[ "$a" == "1" ]]
  then s=":"
elif [[ "$a" == "0" ]]
  then s="s."
else
  s="s:"
fi


#echo -e "You got $a new eMail$s\n$output" > output.txt
echo -e "You got $a new eMail$s\n$output"


rm $cookiefile > /dev/null
