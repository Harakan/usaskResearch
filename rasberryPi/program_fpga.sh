#!/bin/bash
echo "Usage, ./program_fpga.sh path/to/fpga_file.bit"
djtgcfg prog -d DCabUsb -i 1 -f $1
