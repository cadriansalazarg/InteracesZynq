'''This python code is used to automatically generate the Verilog module called customized_concat.v.

which is necessary for interfacing the customized HLS IP Core called packaging unit with the IP Core FIFO Generator.

This code was compiled by Python 2.7

For compiling you have to used the following bash command:        python concat.py                  '''

# -*- coding: utf-8 -*-

PAYLOAD_PACKET_BYTES = input('Enter the number of payload bytes per packet: ')
MESSAGE_SIZE_BYTES = PAYLOAD_PACKET_BYTES + 8

file = open("customized_concat.v","w") 

 
file.write("`timescale 1ns / 1ps \n \n \n \n") 

file.write("module customized_concat( input [7:0] BS_ID, input [7:0] FPGA_ID, input [15:0] PCKG_ID, input [7:0] TX_UID, input [7:0] RX_UID, input [15:0] VALID_PACKET_BYTES,") 


for x in range((PAYLOAD_PACKET_BYTES/4) -1):
  file.write(" input [31:0] MESSAGE") 
  file.write(str(x))
  file.write(",") 
 
file.write(" input [31:0] MESSAGE") 
file.write(str(x+1))
file.write(", output [") 
file.write(str((MESSAGE_SIZE_BYTES*8)-1))
file.write(" :0] din); \n \n") 



file.write("assign din = {BS_ID, FPGA_ID, PCKG_ID, TX_UID, RX_UID, VALID_PACKET_BYTES,") 

for x in range((PAYLOAD_PACKET_BYTES/4) - 1):
  file.write(" MESSAGE") 
  file.write(str(x))
  file.write(",") 


file.write(" MESSAGE") 
file.write(str(x+1))
file.write("}; \n \n") 



file.write("endmodule \n") 

file.close() 
