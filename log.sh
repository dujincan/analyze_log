#!/bin/bash 

if [ $# -eq 1 ]
then
    if [ -f $1 ]
    then
       echo "-----------ip----------------- "
       cat $1 |awk '{s[$1]++}END{for(ip in s) print ip,s[ip]}'
       echo ""
       echo "-----------traffic----------------- "
       cat $1 |awk '{s[$1]+=$10}END{for(ip in s) print ip,s[ip]}'
       echo ""
    else
       echo "$1 not exist"
       exit 1
    fi
else
    echo "Usage:$0 file_path/file"
    exit 1
fi
