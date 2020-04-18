#!/bin/bash -f
# ****************************************************************************
# usage: ./plot.sh
# ****************************************************************************

echo "Plotting vcd.file using gtkwave "

if [ ! -f vcd_file.vcd ]; then
    echo "vcd.file not found!"
else
   gtkwave vcd_file.vcd
fi
