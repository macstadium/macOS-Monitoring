#!/bin/bash
for (( ; ; ))
do 

	#CSV Output
	ps -A -o %cpu | awk '{s+=$1} END {print "CPU-USED," s "%"}'

	#FluentD curl
	#ps -A -o %cpu | awk -f cpu.awk > curl.cmd
	#chmod +x curl.cmd && ./curl.cmd

	#Modify for frequency
	sleep 5
done
