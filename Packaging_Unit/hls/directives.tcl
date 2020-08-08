set_directive_interface -mode ap_ctrl_chain -register "packaging_IP_block"
set_directive_interface -mode ap_fifo "packaging_IP_block" out_fifo

set_directive_interface -mode axis -register -register_mode both "packaging_IP_block" input

#set_directive_pipeline "productor/Loop_Productor"
#set_directive_pipeline "consumidor/Loop_Consumidor"

#set_directive_dataflow "customized_IP_block"


