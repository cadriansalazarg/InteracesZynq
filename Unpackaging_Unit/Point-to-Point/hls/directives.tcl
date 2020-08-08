
set_directive_interface -mode ap_fifo "unpackaging_IP_block" in_fifo
set_directive_interface -mode axis -register_mode off "unpackaging_IP_block" output

set_directive_interface -mode ap_ctrl_chain -register "unpackaging_IP_block"



#set_directive_pipeline "productor/Loop_Productor"
#set_directive_pipeline "consumidor/Loop_Consumidor"

#set_directive_dataflow "customized_IP_block"


