#!/bin/bash
echo "Usage, ./program_prom.sh path/to/fpga_file.mcs"
djtgcfg prog -d DCabUsb -i 0 -f $1
