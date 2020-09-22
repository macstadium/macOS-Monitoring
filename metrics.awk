{array[NR]=$0} 
END {
print "curl -X POST -d '{" array[1] array[2] array[3] array[4] array[5] array[6] array[7] "}' -H 'Content-Type: application/json' http://10.221.188.13:8888/metrics.log"
}
