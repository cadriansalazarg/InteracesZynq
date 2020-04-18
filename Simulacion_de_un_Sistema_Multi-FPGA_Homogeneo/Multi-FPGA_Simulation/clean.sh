#!/bin/bash -f
# ****************************************************************************
# usage: ./clean.sh
# ****************************************************************************


rm -f compile.log elaborate.log simulate.log 

rm -f simulate_*

rm -f webtalk*

rm -rf xsim.dir

rm -f webtalk.jou

rm -f webtalk.log

rm -f xsim.jou

rm -f xsim*

rm -f xelab.pb xvlog.log xvlog.pb vcd_file.vcd

rm -f vivado.log vivado.jou

# vcd_file.vcd

rm -f TestBench_Multi_FPGA_time_impl.wdb

echo "Se eliminaron todos los archivos "
