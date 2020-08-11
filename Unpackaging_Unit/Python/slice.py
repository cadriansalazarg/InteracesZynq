'''This python code is used to automatically generate the Verilog module called customized_slice.v.

which is necessary for interfacing the customized HLS IP Core called unpackaging unit with the IP Core FIFO Generator.

This code was compiled by Python 2.7

For compiling you have to used the following bash command:        python slice.py                  '''

# -*- coding: utf-8 -*-

PAYLOAD_PACKET_BYTES = input('Enter the number of payload bytes per packet: ')
MESSAGE_SIZE_BYTES = PAYLOAD_PACKET_BYTES + 8

file = open("customized_slice.v","w") 

 
file.write("`timescale 1ns / 1ps \n \n \n \n") 

file.write("module customized_slice( output [7:0] BS_ID, output [7:0] FPGA_ID, output [15:0] PCKG_ID, output [7:0] TX_UID, output [7:0] RX_UID, output [15:0] VALID_PACKET_BYTES,") 


for x in range((PAYLOAD_PACKET_BYTES/4) -1):
  file.write(" output [31:0] MESSAGE") 
  file.write(str(x))
  file.write(",") 
 
file.write(" output [31:0] MESSAGE") 
file.write(str(x+1))
file.write(", input [") 
file.write(str((MESSAGE_SIZE_BYTES*8)-1))
file.write(" :0] dout); \n \n") 

k= (MESSAGE_SIZE_BYTES*8)-1
file.write("assign dout[%d:" % k ) 
k = k - 7
file.write("%d] = BS_ID[7:0]; \n" % k ) 

k= k - 1
file.write("assign dout[%d:" % k ) 
k = k - 7
file.write("%d] = FPGA_ID[7:0]; \n" % k ) 

k= k - 1
file.write("assign dout[%d:" % k ) 
k = k - 15
file.write("%d] = PCKG_ID[15:0]; \n" % k ) 

k = k - 1
file.write("assign dout[%d:" % k ) 
k = k - 7
file.write("%d] = TX_UID[7:0]; \n" % k ) 

k = k - 1
file.write("assign dout[%d:" % k ) 
k = k - 7
file.write("%d] = RX_UID[7:0]; \n" % k ) 

k = k - 1
file.write("assign dout[%d:" % k ) 
k = k - 15
file.write("%d] = VALID_PACKET_BYTES[15:0]; \n" % k ) 


n = 0
for x in range((PAYLOAD_PACKET_BYTES/4) - 1):
	k = k - 1
	file.write("assign dout[%d:" % k)
	k = k - 31
	file.write("%d] = MESSAGE" % k )
	file.write("%d[31:0];\n" % n )
	n = n + 1


 
file.write("assign dout[31:0] = MESSAGE") 
file.write(str(n))
file.write("[31:0]; \n \n") 



file.write("endmodule \n") 

file.close() 
