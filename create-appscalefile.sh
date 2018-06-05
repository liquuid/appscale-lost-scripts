#!/bin/bash
#
# Creates AppScalefile.
# Args example: -master 172.21.40.2 -appengine 172.21.40.2 -database 172.21.40.2 -zookeeper 172.21.40.2
# 

# Stop execution on error
set -e

FILE=~/AppScalefile

echo "ips_layout:" > $FILE

while [[ $# > 0 ]]
do
    if [ $1 == "-master" ] 
    then
        echo "  master : $2" >> $FILE
        shift
    elif [ $1 == "-appengine" ] 
    then
        echo "  appengine:" >> $FILE
    elif [ $1 == "-database" ] 
    then
        echo "  database:" >> $FILE
    elif [ $1 == "-zookeeper" ] 
    then
        echo "  zookeeper:" >> $FILE        
    else
        echo "   - $1" >> $FILE
    fi 
    shift
done