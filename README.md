# macOS-Monitoring
Simple monitoring using native macOS commands. These should work on any macOS by downloading, making executable, and running.

### Usage (CSV data):
`./metrics.sh > metrics.log`

**Termination:**  
`./term.sh`

Or you can kill the specific processes:  
```
./met-term.sh
./net-stat-term.sh
```

`lightweightmetrics.awk` is needed for normal script operation.  

Both `metrics.awk` formats the general metrics output for a curl.  

`cpu-loop.sh` is the most often used for "right-sizing" a VM, and is sperated out so users can easily change the frequency of CPU monitoring by modifying the sleep command. (`cpu.awk` formats that data for a curl if desired.)

### Data Fields:
- `FirstField:` Date
- `NetworkIn:` From netstat - Bytes inbound
- `NetworkOut:` From netstat - Bytes transmitted out
- `CPU-USED:` From ps - Percent by core, total percentage is 100% x Number of Cores
- `FreeMem:` From top - Free memory with "M" or "G" on the end
- `RAMPlot:` FreeMem converted to Megs of RAM, more useful for plotting
- `CPUIdle:` From top - Percent of total CPU cores (min 0%, max 100%)
- `DiskRead:` From top - Bytes attempted to be read. This is a sumed value for VMs - always increasing.
- `DiskReadCap:` From top - The system reported read cap (usually in G)
- `DiskWrite:` From top - Bytes attempted to be written. This is a sumed value for VMs - always increasing.
- `DiskWriteCap:` From top - The system reported write cap (usually in G)
- `RWCURRENT:` From {time dd} - The actual written bytes divided by time to write (bytes/s)
- `RWTime:` From {time dd} - The time to write the specified data

### Troubleshooting:
The command `time dd` command can create Xcode to hang if a double write occurs. Should a hung Xcode be noticed, it is recommended this line be commented out, or a seperate partition be created for the metrics.sh script.
