# macOS-Monitoring
Simple monitoring using native macOS commands. These should work on any macOS by downloading, making executable, and running.

Usage (CSV data):
./metrics.sh > metrics.log

DataPoints: <br />
  FirstField: Date <br />
  NetworkIn: From netstat - Bytes inbound <br />
  NetworkOut: From netstat - Bytes transmitted out <br />
  CPU-USED: From ps - Percent by core, total percentage is 100% x No Cores <br />
  FreeMem: From top - Free memory with "M" or "G" on the end <br />
  RAMPlot: FreeMem converted to Megs of RAM, more useful for plotting <br />
  CPUIdle: From top - Percent of total CPU cores (min 0%, max 100%) <br />
  DiskRead: From top - Bytes attempted to be read <br />
  DiskReadCap: From top - The system reported read cap (usually in G) <br />
  DiskWrite: From top - Bytes attempted to be written <br />
  DiskWriteCap: From top - The system reported write cap (usually in G) <br />
  RWCURRENT: From {time dd} - The actual written bytes divided by time to write (bytes/s) <br />
  RWTime: From {time dd} - The time to write the specified data <br />
