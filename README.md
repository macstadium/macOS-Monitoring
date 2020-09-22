# macOS-Monitoring
Simple monitoring using native macOS commands. These should work on any macOS by downloading, making executable, and running.

Usage (CSV data):
./metrics.sh > metrics.log

DataPoints:
  FirstField: Date
  NetworkIn: From netstat - Bytes inbound
  NetworkOut: From netstat - Bytes transmitted out
  CPU-USED: From ps - Percent by core, total percentage is 100% x No Cores
  FreeMem: From top - Free memory with "M" or "G" on the end
  RAMPlot: FreeMem converted to Megs of RAM, more useful for plotting
  CPUIdle: From top - Percent of total CPU cores (min 0%, max 100%)
  DiskRead: From top - Bytes attempted to be read
  DiskReadCap: From top - The system reported read cap (usually in G)
  DiskWrite: From top - Bytes attempted to be written
  DiskWriteCap: From top - The system reported write cap (usually in G)
  RWCURRENT: From {time dd} - The actual written bytes divided by time to write (bytes/s)
  RWTime: From {time dd} - The time to write the specified data
