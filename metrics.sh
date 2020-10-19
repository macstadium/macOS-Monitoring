#!/bin/bash
netstat -t 2 > netstat.log &
sleep 2
for (( ; ; ))
do 
	#Date if needed
	date > catthis.log
	awk '{print "\"Date\":\""$0"\","}' catthis.log > curlthis.log

	#Output for NetStat
        awk 'END{print "NetworkIn,"$3 ",NetworkOut,"$6","}' netstat.log >> catthis.log
        #awk '{if (NR>4){send=send+$3;receive=receive+$6}} END{print "\"NetworkIn\":"send ",\"NetworkOut\":"receive","}' netstat.log >> curlthis.log

	#Direct CPU usuage, ignores core assignment, this is very usefulf or profiling. It is generaly commented out for performance reasons. Running this command and time dd creates an excessive performance hit.
	#ps -A -o %cpu | awk '{s+=$1} END {print "CPU-USED," s "%,"}' >> catthis.log
	#ps -A -o %cpu | awk '{s+=$1} END {print "\"CPU-USED\":" s "%,"}' >> curlthis.log

	#Efficient Metrics: Free memory in M, Disk write attempts, CPU usage as a %
	top -l 1 | grep 'PhysMem:\|Disks:\|CPU usage' | awk -f lightmetrics.awk >> catthis.log
        #top -l 1 | grep 'PhysMem:\|Disks:\|CPU usage' | awk -f lightmetrics.awk >> curlthis.log

	#Read / Write pressure - the lower this number, the faster the read/write is. This number will be delayed by .15-.7 seconds from the others metrics
        { time dd if=/dev/zero bs=512k of=tstfile count=512 ; } 2>tmp

	#Text outupt for read/write pressure
        awk '{if ($3~/trans/){print "RWCURRENT," $1/$5",RWTime,"$5}}' tmp >> catthis.log
	#awk '{if ($3~/trans/){print "\"RWCURRENT\":" $1/$5 ",\"RWTime\":"$5}}' tmp >> curlthis.log

	#Output every full set of data
	awk '{array[NR]=$0} END{print array[1] "," array[2] array[3] array[4] array[5]}' catthis.log
	#awk -f metrics.awk curlthis.log >> curl.cmd

	#Delay loop as desired
	sleep 2 
done
