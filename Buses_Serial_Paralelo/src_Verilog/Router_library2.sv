
////////////////////////////////////////////////////////////
// Definition of the auxiliary cell for the SSC
///////////////////////////////////////////////////////////
// The n parameter defines the maximum number of time slots to be used.
//
module ssc_aux_cell #(parameter n = 4)(
  input s, // select input
  input rst,
  input [$clog2(n)-1:0]f, // fixed constant used to compare the compare value
  input [$clog2(n)-1:0]c, // dinamic value to be compared against f
  output p, //Bit used to indicate that the current value was already used in the sequence, so it is poissoned
  output logic e); // this bit indicates that the value enabled to be used in the sequence
  
  logic comp;
  assign comp = (f == c)? 1'b1 :1'b0;
  assign e = ~p & s;
  dff_async_rst flop(.data(1'b1),.clk(comp),.reset(rst),.q(p));
endmodule


////////////////////////////////////////////////////////////
// Definition of the auxiliary cell for the SSC in the bit 0
///////////////////////////////////////////////////////////
// The n parameter defines the maximum number of time slots to be used.
// The only diferencie with the previous module is tha this one will refresh
// on the negedge of the clock 
module ssc_aux_cell0 #(parameter n = 4)(
  input s, // select input
  input rst,
  input [$clog2(n)-1:0]f, // fixed constant used to compare the compare value
  input [$clog2(n)-1:0]c, // dinamic value to be compared against f
  input clk,
  output p, //Bit used to indicate that the current value was already used in the sequence, so it is poissoned
  output logic e); // this bit indicates that the value enabled to be used in the sequence
  
  logic comp;
  logic comp_clk;
  assign comp = (f == c)? 1'b1 :1'b0;
  assign comp_clk = ~clk&comp;
  assign e = ~p & s;
  dff_async_rst flop(.data(1'b1),.clk(comp_clk),.reset(rst),.q(p));
endmodule

////////////////////////////////////////////////////////////
// Definition of the SSC (Selectable Sequence Conter)
///////////////////////////////////////////////////////////
// The n parameter defines the maximum number of time slots to be used.
//

module SSC #(parameter n = 4)(
  input [n-1:0]select, // one select for each aone of the possible values to be counted in the sequence 
  input rst,
  input clk,
  output [$clog2(n)-1:0]count // output count
  );
  logic [$clog2(n)-1:0]next_state;
  logic rst_int;
  wire p[n-1:0];
  wire e[n-1:0];
  logic [$clog2(n)-1:0]mx_out[n:1];
  logic slct0;
  logic [n-1:0]snp;
  
  
  genvar i;
  generate
    for(i = 1; i < n;i = i+1)
      begin: bit_
        localparam [$clog2(n)-1:0] loc_i = i;
        ssc_aux_cell #(.n(n)) aux_cell(.s(select[i]),.rst(rst_int),.f(loc_i),.c(count),.p(p[i]),.e(e[i]));
        assign snp[i] = select[i]&~p[i];
      end

    for(i = 1; i < n;i = i+1)
      begin: _mx 
        assign mx_out[i] = (e[i])?i:mx_out[i+1];  
      end
  endgenerate

        ssc_aux_cell0 #(.n(n)) bit_0aux_cell (.s(select[0]),.rst(rst_int),.f({$clog2(n){1'b0}}),.c(count),.p(p[0]),.e(e[0]),.clk(clk));
        assign snp[0] = select[0]&~p[0];
        assign next_state = (slct0)?{$clog2(n){1'b0}}:mx_out[1];  
        assign mx_out[n] ={$clog2(n)-1{1'b0}};
        assign slct0 = (select == 0) | e[0];
        assign rst_int = (snp == 0)| rst;
        prll_d_reg #($clog2(n)) count_flop (.clk(clk),.reset(rst),.D_in(next_state),.D_out(count));   
        
endmodule
//////////////////////////////////////////////////////////////////////////
// Definition of a Bus agent uisng SSC
//////////////////////////////////////////////////////////////////////////
// here ID represent the ID of the agent
// flit_size is the size of the flit in bits (only the payload)
// num_agents is the number of agents connected to the bus
// fifo_depth is the depth of the fifos to be used in the agent
// by definition the code for broadcast is the number of agents (note that the
// agents will be numbered from 0 to n-1)
// to send a flit in the input fifo a header of clog2(flit_size+1) must be
// added containing the ID of the intended receiver in the bus.
//
module agent_bus_ccs #(parameter ID = 0, parameter flit_size = 32,parameter num_agents = 4, parameter fifo_depth = 2) (
  input clk,
  input rst,
  // to the bus interface
  inout[flit_size+$clog2(num_agents+1)-1:0] data_in_i,
  input[$clog2(num_agents+1)-1:0] trn_i,
  input[num_agents-1:0] full_bs_i,
  output full_i,
  output logic pndng_i,
  // to the agent interface
  input push,
  input pop,
  input[flit_size+$clog2(num_agents+1)-1:0] data_in,
  output full,
  output pndng,
  output [flit_size-1:0] data_out
  );

  wire pndng_i_in;
  logic [flit_size+$clog2(num_agents+1)-1:0] data_out_i;
  logic psh;
  logic popin;
  wire tr_en;
  logic pre_pop;
  logic pre_psh;
  logic any_full;
  logic [0:0] mux_in [num_agents:0];


 fifo_flops_ssc #(.depth(fifo_depth),.bits(flit_size+$clog2(num_agents+1))) fifo_in  (.Din(data_in),.Dout(data_out_i),.push(push),.pop(popin),.clk(clk),.full(full),.pndng(pndng_i_in),.rst(rst)); 
 fifo_flops_ssc #(.depth(fifo_depth),.bits(flit_size)) fifo_out (.Din(data_in_i[flit_size-1:0]),.Dout(data_out),.push(psh),.pop(pop),.clk(clk),.full(full_i),.pndng(pndng),.rst(rst)); 
 param_mux #(.n(num_agents+1),.size(1)) mux (.in(mux_in),.sel(data_out_i[flit_size+$clog2(num_agents+1)-1:flit_size]),.out(tr_en));
 assign mux_in[num_agents] = any_full;
 genvar i;
 generate 
   for(i=0;i<num_agents;i++) begin: bit_
     assign mux_in[i] = full_bs_i[i];
   end
 endgenerate 
 assign  pndng_i = ~tr_en & pndng_i_in;
 assign  pre_pop = (ID == trn_i)? 1'b1:1'b0;
 assign  popin = pre_pop & pndng_i;
 assign  pre_psh = ((data_in_i[flit_size+$clog2(num_agents+1)-1:flit_size]== ID)||(data_in_i[flit_size+$clog2(num_agents+1)-1:flit_size]== num_agents))? 1'b1:1'b0;
 assign  psh = pre_psh & ~pre_pop;
 assign data_in_i = (pre_pop)?data_out_i:{flit_size+$clog2(num_agents){1'bz}}; 
 assign any_full = (full_bs_i == 0)? 1'b0: 1'b1;
endmodule

/////////////////////////////////////////////////////////////////////////////////////////
// Definition of a bus arbiter based on an SSC
/////////////////////////////////////////////////////////////////////////////////////////
//Here n represent the numbre of devices in the bus
module arbiterSSC #(parameter n = 4) (
  input rst,
  input clk,
  input [n-1:0] pndng,
  output [$clog2(n)-1:0]trn
  );
  wire clk_out;
  logic clk_en;

  SSC #(.n(n)) selectable_sequence_counter (.select(pndng),.rst(rst),.clk(clk_out),.count(trn));
  clk_enable enable_clock (.clk(clk),.rst(rst),.clk_en(clk_en),.clk_out(clk_out));
  assign clk_en = (pndng == 0)? 1'b0:1'b1;
endmodule

///////////////////////////////////////////////////////////////////////////////////////////
//  Definition of the Bus based on SCC and dTDMA
///////////////////////////////////////////////////////////////////////////////////////////
// by definition the code for the broadcast in the bus is the number of
// agents; the agents will be numbered from 0 to num_agnts-1.
// Each flit will use the most significant clog2(num_agnts+1) bits for the
// address of the package so the package will have a header of
// Clog2(num_agnts+1) bits and a payload of flit_size bits.
//
module bus_ssc_gnrtr #(parameter flit_size =32, parameter num_agnts = 4,parameter fifo_depth=2)(
   input clk,
   input rst,
   input [num_agnts-1:0]pop,
   input [num_agnts-1:0]push,
   input [flit_size+$clog2(num_agnts+1)-1:0] data_in [num_agnts-1:0],
   output [num_agnts-1:0]full,
   output [num_agnts-1:0]pndng,
   output [flit_size-1:0] data_out[num_agnts-1:0]); 
   
   wire [$clog2(num_agnts)-1:0] trn;
   wire [num_agnts-1:0] full_bs_i;
   wire [num_agnts-1:0] pndng_i;
   wire [flit_size+$clog2(num_agnts+1)-1:0]data_in_i;
  
   
   arbiterSSC #(.n(num_agnts)) arbitro  (.rst(rst),.clk(clk),.pndng(pndng_i),.trn(trn));
  
   genvar i;
   generate
     for(i=0;i<num_agnts;i++) begin: agnt_
       agent_bus_ccs #(.ID(i),.flit_size(flit_size),.num_agents(num_agnts),.fifo_depth(fifo_depth)) _bus_intrfs (
         .clk(clk),
         .rst(rst),
  // to the bus interface
         .data_in_i(data_in_i),
         .trn_i(trn),
         .full_bs_i(full_bs_i),
         .full_i(full_bs_i[i]),
         .pndng_i(pndng_i[i]),
  // to the agent interface
         .push(push[i]),
         .pop(pop[i]),
         .data_in(data_in[i]),
         .full(full[i]),
         .pndng(pndng[i]),
         .data_out(data_out[i]));
     end
  endgenerate
 
endmodule
