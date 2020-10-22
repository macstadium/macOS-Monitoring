echo "Time & Date"
date
echo "Logical Cores"
sysctl -n hw.ncpu
echo "Physical CPU (same for VMs)"
sysctl -n hw.physicalcpu
echo "Reported CPU Frequency (Ignores Turboboosting etc)"
sysctl -n hw.cpufrequency
echo "RAM"
systcl -n hw.memsize
#echo "Kernal Version"
#Xcode specific info, may not apply to all builds or use cases
#xcodebuild -version | awk '{if ($1~/Xcode/){print "Xcode";print $2} if ($1~/Build/){print "Build Version"; print $3}}'
./metrics.sh > build.log
sleep 10
#Run commands for your build here or call another file here
sleep 10
./net-stat-term.sh
./met-term.sh
