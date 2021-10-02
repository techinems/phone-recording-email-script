#!/bin/bash

#This script emails the recorded call right after the call is hung up. Below are    the variables passed through asterisk
# $1 - year
# $2 - month
# $3 - day
# $4 - time string
# $5 - caller
# $6 - recording file
# $7 - call destination
# $dt - datetime string
# $email - email address to send text and file
# $from - the "from" email address

email="email@example.com" #change this line
from="noreply@example.com" #change this one too

#fill in the extension you wish to send emails on in the below quotes
if [ $7 != "" ]; then
	return 0;
fi


dt=$(date -d '+3 hours' '+%d %b %y %H:%M:%S'); #+3 hours because our server sits in Pacific Time


echo -e "New recording from the duty sup line:\n
Date/time: $dt
From: $5" | mail -A /var/spool/asterisk/monitor/$1/$2/$3/$6 -s "Call on the duty sup line from $5" -a "From:$from" $email
