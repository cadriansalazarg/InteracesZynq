# Se crea el proyecto con la FPGA de la ZedBoard como target
exec rm -rf project_1/ vivado.*

create_project project_1 project_1 -part xc7z020clg484-1

# Se ajusta la placa a la ZedBoard
set_property board_part em.avnet.com:zed:part0:1.4 [current_project]


# Se agrega el top del diseño
add_files -norecurse src_Verilog/top_Design.v

# Se agrega tanto el TestBench de una sola FPGA como el TestBench de la simulación Multi-FPGA
add_files -fileset sim_1 -norecurse {../Multi-FPGA_Simulation/TestBench/TestBench_Multi_FPGA.v TestBench/TestBench_top_Design.v}
add_files -fileset constrs_1 -norecurse constrs/pines.xdc
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1


# Se realiza la implementación del diseño
launch_runs impl_1 -jobs 8
