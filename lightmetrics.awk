{if ($0~/PhysMem/){
	#Convert M to unitless, as this is in M
	if ($6~/M/){
		ram=$6;sub(/M/,"",ram)
		} 
	#Convert G to M and make unitless for plotting
	if($6~/G/){
		ram=$6;sub(/G/,"",ram);
		ram=1024*ram
		} 

	#CSV output
	printvalram = "FreeMem," $6 ",RAMPlot," ram ","

	#Curl output
	#printvalram = "\FreeMem\":\""$6"\",\"RAMPlot\":"ram","

	}

  if ($0~/CPU usage/){

	#CSV
	printcpu= "CPUIdle," $7","

	#Curl Output
	#printcpu= "\"CPUIdle\":"$7","
	}

  if ($1~/Disk/){
	tmpread = $2; tmpwrite = $4;
	split(tmpread,read,"/");
	split(tmpwrite,write,"/");

	#CSV output	
        printread = "DiskRead,"read[1]",";
        printreadcap = "DiskReadCap,"read[2]","
        printwrite = "DiskWrite," write[1] ","
        printwritecap = "DiskWriteCap," write[2] ","

	#Curl output
	#printread = "\"DiskRead\":"read[1]",";
	#printreadcap = "\"DiskReadCap\":\""read[2]"\","
	#printwrite = "\"DiskWrite\":" write[1] ","
	#printwritecap = "\"DiskWriteCap\":\"" write[2] "\","
	}

}
END{
#Print either CSV or Curl logic
print printvalram printcpu printread printreadcap printwrite printwritecap
}
