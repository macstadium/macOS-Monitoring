{s+=$1} 
END {print "curl -X POST -d '{\"CPU-USED\":"s "}' -H 'Content-Type: application/json' http://10.221.188.13:8888/cpu.log"
}
