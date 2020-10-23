echo "Time & Date" > build.log
date >> build.log
echo "Logical Cores" >> build.log
sysctl -n hw.ncpu >> build.log
echo "Physical CPU (same for VMs)" >> build.log
sysctl -n hw.physicalcpu >> build.log
echo "Reported CPU Frequency (Ignores Turboboosting etc)" >> build.log
sysctl -n hw.cpufrequency >> build.log
echo "RAM" >> build.log
sysctl -n hw.memsize >> build.log
#echo "Kernal Version"
#Xcode specific info, may not apply to all builds or use cases
#xcodebuild -version | awk '{if ($1~/Xcode/){print "Xcode";print $2} if ($1~/Build/){print "Build Version"; print $3}}'
./metrics.sh >> build.log
#Run commands for your build here or call another file here
#./term.sh
