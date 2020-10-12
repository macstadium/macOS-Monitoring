#This must have a name that does not contain "metrics.sh"
ps aux | grep metrics.sh | grep -v grep | awk '{print "kill -9 "$2}' > cmd.sh
chmod +x cmd.sh
./cmd.sh
