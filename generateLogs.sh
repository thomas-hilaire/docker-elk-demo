#!/bin/bash

OUT=/tmp/logs/out.log
touch $OUT

IP1=90.112.168.15
IP2=88.130.18.55

getDate () {
   date --utc --rfc-3339=seconds | cut -d '+' -f1
}

while true
do
   LOG_INDEX=$[ ( $RANDOM % 8 )  + 1 ]
   case $LOG_INDEX in 
	1)
	   echo "`getDate` $IP1 [INFO] The client is watching the product A" >> $OUT
	;;
	2)
	   echo "`getDate` $IP1 [INFO] The client is watching the product B" >> $OUT
	;;
	3)
	   echo "`getDate` $IP1 [WARN] The client bought 100 product A" >> $OUT
	;;
	4)
	   echo "`getDate` $IP1 [WARN] The client bought 3 product A" >> $OUT
	;;
	5)
	   echo "`getDate` $IP2 [INFO] The client is watching the product B" >> $OUT
	;;
	6)
	   echo "`getDate` $IP2 [WARN] The client bought 5 product B" >> $OUT
	;;
	7)
	   echo "`getDate` $IP2 [WARN] The client bought 20 product B" >> $OUT
	;;
	*)
	   echo "`getDate` $IP2 [ERROR] message of unexpected error" >> $OUT
	;;
   esac
   sleep $[ (( $RANDOM % 5 )  + 1 ) / 10 ]
done
