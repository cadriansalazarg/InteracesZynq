`timescale 1 ns / 1 ps

module AESL_deadlock_detector (
    input reset,
    input clock);

    wire [2:0] proc_dep_vld_vec_0;
    reg [2:0] proc_dep_vld_vec_0_reg;
    wire [2:0] in_chan_dep_vld_vec_0;
    wire [26:0] in_chan_dep_data_vec_0;
    wire [2:0] token_in_vec_0;
    wire [2:0] out_chan_dep_vld_vec_0;
    wire [8:0] out_chan_dep_data_0;
    wire [2:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [8:0] dep_chan_data_1_0;
    wire token_1_0;
    wire dep_chan_vld_2_0;
    wire [8:0] dep_chan_data_2_0;
    wire token_2_0;
    wire dep_chan_vld_3_0;
    wire [8:0] dep_chan_data_3_0;
    wire token_3_0;
    wire [1:0] proc_dep_vld_vec_1;
    reg [1:0] proc_dep_vld_vec_1_reg;
    wire [1:0] in_chan_dep_vld_vec_1;
    wire [17:0] in_chan_dep_data_vec_1;
    wire [1:0] token_in_vec_1;
    wire [1:0] out_chan_dep_vld_vec_1;
    wire [8:0] out_chan_dep_data_1;
    wire [1:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_0_1;
    wire [8:0] dep_chan_data_0_1;
    wire token_0_1;
    wire dep_chan_vld_6_1;
    wire [8:0] dep_chan_data_6_1;
    wire token_6_1;
    wire [3:0] proc_dep_vld_vec_2;
    reg [3:0] proc_dep_vld_vec_2_reg;
    wire [3:0] in_chan_dep_vld_vec_2;
    wire [35:0] in_chan_dep_data_vec_2;
    wire [3:0] token_in_vec_2;
    wire [3:0] out_chan_dep_vld_vec_2;
    wire [8:0] out_chan_dep_data_2;
    wire [3:0] token_out_vec_2;
    wire dl_detect_out_2;
    wire dep_chan_vld_0_2;
    wire [8:0] dep_chan_data_0_2;
    wire token_0_2;
    wire dep_chan_vld_4_2;
    wire [8:0] dep_chan_data_4_2;
    wire token_4_2;
    wire dep_chan_vld_5_2;
    wire [8:0] dep_chan_data_5_2;
    wire token_5_2;
    wire dep_chan_vld_6_2;
    wire [8:0] dep_chan_data_6_2;
    wire token_6_2;
    wire [1:0] proc_dep_vld_vec_3;
    reg [1:0] proc_dep_vld_vec_3_reg;
    wire [1:0] in_chan_dep_vld_vec_3;
    wire [17:0] in_chan_dep_data_vec_3;
    wire [1:0] token_in_vec_3;
    wire [1:0] out_chan_dep_vld_vec_3;
    wire [8:0] out_chan_dep_data_3;
    wire [1:0] token_out_vec_3;
    wire dl_detect_out_3;
    wire dep_chan_vld_0_3;
    wire [8:0] dep_chan_data_0_3;
    wire token_0_3;
    wire dep_chan_vld_5_3;
    wire [8:0] dep_chan_data_5_3;
    wire token_5_3;
    wire [1:0] proc_dep_vld_vec_4;
    reg [1:0] proc_dep_vld_vec_4_reg;
    wire [1:0] in_chan_dep_vld_vec_4;
    wire [17:0] in_chan_dep_data_vec_4;
    wire [1:0] token_in_vec_4;
    wire [1:0] out_chan_dep_vld_vec_4;
    wire [8:0] out_chan_dep_data_4;
    wire [1:0] token_out_vec_4;
    wire dl_detect_out_4;
    wire dep_chan_vld_2_4;
    wire [8:0] dep_chan_data_2_4;
    wire token_2_4;
    wire dep_chan_vld_5_4;
    wire [8:0] dep_chan_data_5_4;
    wire token_5_4;
    wire [3:0] proc_dep_vld_vec_5;
    reg [3:0] proc_dep_vld_vec_5_reg;
    wire [3:0] in_chan_dep_vld_vec_5;
    wire [35:0] in_chan_dep_data_vec_5;
    wire [3:0] token_in_vec_5;
    wire [3:0] out_chan_dep_vld_vec_5;
    wire [8:0] out_chan_dep_data_5;
    wire [3:0] token_out_vec_5;
    wire dl_detect_out_5;
    wire dep_chan_vld_2_5;
    wire [8:0] dep_chan_data_2_5;
    wire token_2_5;
    wire dep_chan_vld_3_5;
    wire [8:0] dep_chan_data_3_5;
    wire token_3_5;
    wire dep_chan_vld_4_5;
    wire [8:0] dep_chan_data_4_5;
    wire token_4_5;
    wire dep_chan_vld_6_5;
    wire [8:0] dep_chan_data_6_5;
    wire token_6_5;
    wire [3:0] proc_dep_vld_vec_6;
    reg [3:0] proc_dep_vld_vec_6_reg;
    wire [3:0] in_chan_dep_vld_vec_6;
    wire [35:0] in_chan_dep_data_vec_6;
    wire [3:0] token_in_vec_6;
    wire [3:0] out_chan_dep_vld_vec_6;
    wire [8:0] out_chan_dep_data_6;
    wire [3:0] token_out_vec_6;
    wire dl_detect_out_6;
    wire dep_chan_vld_1_6;
    wire [8:0] dep_chan_data_1_6;
    wire token_1_6;
    wire dep_chan_vld_2_6;
    wire [8:0] dep_chan_data_2_6;
    wire token_2_6;
    wire dep_chan_vld_5_6;
    wire [8:0] dep_chan_data_5_6;
    wire token_5_6;
    wire dep_chan_vld_7_6;
    wire [8:0] dep_chan_data_7_6;
    wire token_7_6;
    wire [1:0] proc_dep_vld_vec_7;
    reg [1:0] proc_dep_vld_vec_7_reg;
    wire [1:0] in_chan_dep_vld_vec_7;
    wire [17:0] in_chan_dep_data_vec_7;
    wire [1:0] token_in_vec_7;
    wire [1:0] out_chan_dep_vld_vec_7;
    wire [8:0] out_chan_dep_data_7;
    wire [1:0] token_out_vec_7;
    wire dl_detect_out_7;
    wire dep_chan_vld_6_7;
    wire [8:0] dep_chan_data_6_7;
    wire token_6_7;
    wire dep_chan_vld_8_7;
    wire [8:0] dep_chan_data_8_7;
    wire token_8_7;
    wire [0:0] proc_dep_vld_vec_8;
    reg [0:0] proc_dep_vld_vec_8_reg;
    wire [0:0] in_chan_dep_vld_vec_8;
    wire [8:0] in_chan_dep_data_vec_8;
    wire [0:0] token_in_vec_8;
    wire [0:0] out_chan_dep_vld_vec_8;
    wire [8:0] out_chan_dep_data_8;
    wire [0:0] token_out_vec_8;
    wire dl_detect_out_8;
    wire dep_chan_vld_7_8;
    wire [8:0] dep_chan_data_7_8;
    wire token_7_8;
    wire [8:0] dl_in_vec;
    wire dl_detect_out;
    wire [8:0] origin;
    wire token_clear;

    reg ap_done_reg_0;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            ap_done_reg_0 <= 'b0;
        end
        else begin
            ap_done_reg_0 <= AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.ap_done;
        end
    end

    reg ap_done_reg_1;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            ap_done_reg_1 <= 'b0;
        end
        else begin
            ap_done_reg_1 <= AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.ap_done;
        end
    end

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_GapJunctionIP$grp_execute_fu_142$blockControl173_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$blockControl173_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$blockControl173_U0$ap_idle <= AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0.ap_idle;
        end
    end
    // Process: AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0
    AESL_deadlock_detect_unit #(9, 0, 3, 3) AESL_deadlock_detect_unit_0 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0.simConfig_rowBegin_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0.simConfig_rowEnd_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0.simConfig_rowsToSimulate_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0.simConfig_BLOCK_NUMBERS_V_out_blk_n);
    assign proc_dep_vld_vec_0[1] = dl_detect_out ? proc_dep_vld_vec_0_reg[1] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0.grp_getVoltages_fu_118.V_data_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0.grp_getVoltages_fu_118.V_data_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0.grp_getVoltages_fu_118.V_data_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.blockControl173_U0.grp_getVoltages_fu_118.V_data_V_data_3_blk_n);
    assign proc_dep_vld_vec_0[2] = dl_detect_out ? proc_dep_vld_vec_0_reg[2] : ((~AESL_inst_GapJunctionIP.grp_execute_fu_142.start_for_V_read_U0_U.if_full_n & AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.ap_done));
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[8 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign in_chan_dep_vld_vec_0[1] = dep_chan_vld_2_0;
    assign in_chan_dep_data_vec_0[17 : 9] = dep_chan_data_2_0;
    assign token_in_vec_0[1] = token_2_0;
    assign in_chan_dep_vld_vec_0[2] = dep_chan_vld_3_0;
    assign in_chan_dep_data_vec_0[26 : 18] = dep_chan_data_3_0;
    assign token_in_vec_0[2] = token_3_0;
    assign dep_chan_vld_0_2 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_2 = out_chan_dep_data_0;
    assign token_0_2 = token_out_vec_0[0];
    assign dep_chan_vld_0_3 = out_chan_dep_vld_vec_0[1];
    assign dep_chan_data_0_3 = out_chan_dep_data_0;
    assign token_0_3 = token_out_vec_0[1];
    assign dep_chan_vld_0_1 = out_chan_dep_vld_vec_0[2];
    assign dep_chan_data_0_1 = out_chan_dep_data_0;
    assign token_0_1 = token_out_vec_0[2];

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$ap_idle <= AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.ap_idle;
        end
    end
    // Process: AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0
    AESL_deadlock_detect_unit #(9, 1, 2, 2) AESL_deadlock_detect_unit_1 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_rowBegin_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_rowEnd_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.scalar_simConfig_rowsToSimulate_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.scalar_simConfig_BLOCK_NUMBERS_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.V_data_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.V_data_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.V_data_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.V_data_V_data_3_blk_n | (~AESL_inst_GapJunctionIP.grp_execute_fu_142.start_for_V_read_U0_U.if_empty_n & (AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.ap_ready | AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$ap_idle)));
    assign proc_dep_vld_vec_1[1] = dl_detect_out ? proc_dep_vld_vec_1_reg[1] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_rowsToSimulate_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_BLOCK_NUMBERS_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.fixedData_V_data_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.fixedData_V_tlast_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.processedData_V_data_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.processedData_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.processedData_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.processedData_V_data_3_blk_n | (~AESL_inst_GapJunctionIP.grp_execute_fu_142.start_for_calc_U0_U.if_full_n & AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.ap_done));
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_0_1;
    assign in_chan_dep_data_vec_1[8 : 0] = dep_chan_data_0_1;
    assign token_in_vec_1[0] = token_0_1;
    assign in_chan_dep_vld_vec_1[1] = dep_chan_vld_6_1;
    assign in_chan_dep_data_vec_1[17 : 9] = dep_chan_data_6_1;
    assign token_in_vec_1[1] = token_6_1;
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[0];
    assign dep_chan_vld_1_6 = out_chan_dep_vld_vec_1[1];
    assign dep_chan_data_1_6 = out_chan_dep_data_1;
    assign token_1_6 = token_out_vec_1[1];

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$V_read_entry169179_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$V_read_entry169179_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$V_read_entry169179_U0$ap_idle <= AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.ap_idle;
        end
    end
    // Process: AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0
    AESL_deadlock_detect_unit #(9, 2, 4, 4) AESL_deadlock_detect_unit_2 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_2),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_2),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_2),
        .token_in_vec(token_in_vec_2),
        .dl_detect_in(dl_detect_out),
        .origin(origin[2]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_2),
        .out_chan_dep_data(out_chan_dep_data_2),
        .token_out_vec(token_out_vec_2),
        .dl_detect_out(dl_in_vec[2]));

    assign proc_dep_vld_vec_2[0] = dl_detect_out ? proc_dep_vld_vec_2_reg[0] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.scalar_simConfig_BLOCK_NUMBERS_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.scalar_simConfig_rowsToSimulate_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_rowBegin_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_rowEnd_V_blk_n);
    assign proc_dep_vld_vec_2[1] = dl_detect_out ? proc_dep_vld_vec_2_reg[1] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_BLOCK_NUMBERS_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_rowsToSimulate_V_out_blk_n);
    assign proc_dep_vld_vec_2[2] = dl_detect_out ? proc_dep_vld_vec_2_reg[2] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_rowBegin_V_c_i_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_rowEnd_V_c_i_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_BLOCK_NUMBERS_V_c_i_blk_n | (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.start_for_indexGeneration_U0_U.if_full_n & AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.ap_done));
    assign proc_dep_vld_vec_2[3] = dl_detect_out ? proc_dep_vld_vec_2_reg[3] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_rowsToSimulate_V_c_i_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.V_read_entry169179_U0.simConfig_BLOCK_NUMBERS_V_c1_i_blk_n);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_2_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_2_reg <= proc_dep_vld_vec_2;
        end
    end
    assign in_chan_dep_vld_vec_2[0] = dep_chan_vld_0_2;
    assign in_chan_dep_data_vec_2[8 : 0] = dep_chan_data_0_2;
    assign token_in_vec_2[0] = token_0_2;
    assign in_chan_dep_vld_vec_2[1] = dep_chan_vld_4_2;
    assign in_chan_dep_data_vec_2[17 : 9] = dep_chan_data_4_2;
    assign token_in_vec_2[1] = token_4_2;
    assign in_chan_dep_vld_vec_2[2] = dep_chan_vld_5_2;
    assign in_chan_dep_data_vec_2[26 : 18] = dep_chan_data_5_2;
    assign token_in_vec_2[2] = token_5_2;
    assign in_chan_dep_vld_vec_2[3] = dep_chan_vld_6_2;
    assign in_chan_dep_data_vec_2[35 : 27] = dep_chan_data_6_2;
    assign token_in_vec_2[3] = token_6_2;
    assign dep_chan_vld_2_0 = out_chan_dep_vld_vec_2[0];
    assign dep_chan_data_2_0 = out_chan_dep_data_2;
    assign token_2_0 = token_out_vec_2[0];
    assign dep_chan_vld_2_6 = out_chan_dep_vld_vec_2[1];
    assign dep_chan_data_2_6 = out_chan_dep_data_2;
    assign token_2_6 = token_out_vec_2[1];
    assign dep_chan_vld_2_4 = out_chan_dep_vld_vec_2[2];
    assign dep_chan_data_2_4 = out_chan_dep_data_2;
    assign token_2_4 = token_out_vec_2[2];
    assign dep_chan_vld_2_5 = out_chan_dep_vld_vec_2[3];
    assign dep_chan_data_2_5 = out_chan_dep_data_2;
    assign token_2_5 = token_out_vec_2[3];

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$readVoltages_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$readVoltages_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$readVoltages_U0$ap_idle <= AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.ap_idle;
        end
    end
    // Process: AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0
    AESL_deadlock_detect_unit #(9, 3, 2, 2) AESL_deadlock_detect_unit_3 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_3),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_3),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_3),
        .token_in_vec(token_in_vec_3),
        .dl_detect_in(dl_detect_out),
        .origin(origin[3]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_3),
        .out_chan_dep_data(out_chan_dep_data_3),
        .token_out_vec(token_out_vec_3),
        .dl_detect_out(dl_in_vec[3]));

    assign proc_dep_vld_vec_3[0] = dl_detect_out ? proc_dep_vld_vec_3_reg[0] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.voltagesBackup_U.i_full_n & AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.ap_done & deadlock_detector.ap_done_reg_0 & ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.voltagesBackup_U.t_read);
    assign proc_dep_vld_vec_3[1] = dl_detect_out ? proc_dep_vld_vec_3_reg[1] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.V_data_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.V_data_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.V_data_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.readVoltages_U0.V_data_V_data_3_blk_n);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_3_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_3_reg <= proc_dep_vld_vec_3;
        end
    end
    assign in_chan_dep_vld_vec_3[0] = dep_chan_vld_0_3;
    assign in_chan_dep_data_vec_3[8 : 0] = dep_chan_data_0_3;
    assign token_in_vec_3[0] = token_0_3;
    assign in_chan_dep_vld_vec_3[1] = dep_chan_vld_5_3;
    assign in_chan_dep_data_vec_3[17 : 9] = dep_chan_data_5_3;
    assign token_in_vec_3[1] = token_5_3;
    assign dep_chan_vld_3_5 = out_chan_dep_vld_vec_3[0];
    assign dep_chan_data_3_5 = out_chan_dep_data_3;
    assign token_3_5 = token_out_vec_3[0];
    assign dep_chan_vld_3_0 = out_chan_dep_vld_vec_3[1];
    assign dep_chan_data_3_0 = out_chan_dep_data_3;
    assign token_3_0 = token_out_vec_3[1];

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$indexGeneration_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$indexGeneration_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$indexGeneration_U0$ap_idle <= AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.ap_idle;
        end
    end
    // Process: AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0
    AESL_deadlock_detect_unit #(9, 4, 2, 2) AESL_deadlock_detect_unit_4 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_4),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_4),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_4),
        .token_in_vec(token_in_vec_4),
        .dl_detect_in(dl_detect_out),
        .origin(origin[4]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_4),
        .out_chan_dep_data(out_chan_dep_data_4),
        .token_out_vec(token_out_vec_4),
        .dl_detect_out(dl_in_vec[4]));

    assign proc_dep_vld_vec_4[0] = dl_detect_out ? proc_dep_vld_vec_4_reg[0] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.simConfig_rowBegin_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.simConfig_rowEnd_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.simConfig_BLOCK_NUMBERS_V_blk_n | (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.start_for_indexGeneration_U0_U.if_empty_n & (AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.ap_ready | AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$indexGeneration_U0$ap_idle)));
    assign proc_dep_vld_vec_4[1] = dl_detect_out ? proc_dep_vld_vec_4_reg[1] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.Vi_idx_V_data_V_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.Vi_idx_V_data_V_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.Vi_idx_V_data_V_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.Vi_idx_V_data_V_3_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.Vj_idx_V_data_V_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.Vj_idx_V_data_V_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.Vj_idx_V_data_V_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.indexGeneration_U0.Vj_idx_V_data_V_3_blk_n);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_4_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_4_reg <= proc_dep_vld_vec_4;
        end
    end
    assign in_chan_dep_vld_vec_4[0] = dep_chan_vld_2_4;
    assign in_chan_dep_data_vec_4[8 : 0] = dep_chan_data_2_4;
    assign token_in_vec_4[0] = token_2_4;
    assign in_chan_dep_vld_vec_4[1] = dep_chan_vld_5_4;
    assign in_chan_dep_data_vec_4[17 : 9] = dep_chan_data_5_4;
    assign token_in_vec_4[1] = token_5_4;
    assign dep_chan_vld_4_2 = out_chan_dep_vld_vec_4[0];
    assign dep_chan_data_4_2 = out_chan_dep_data_4;
    assign token_4_2 = token_out_vec_4[0];
    assign dep_chan_vld_4_5 = out_chan_dep_vld_vec_4[1];
    assign dep_chan_data_4_5 = out_chan_dep_data_4;
    assign token_4_5 = token_out_vec_4[1];

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$writeV2calc_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$writeV2calc_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$V_read_U0$writeV2calc_U0$ap_idle <= AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.ap_idle;
        end
    end
    // Process: AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0
    AESL_deadlock_detect_unit #(9, 5, 4, 4) AESL_deadlock_detect_unit_5 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_5),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_5),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_5),
        .token_in_vec(token_in_vec_5),
        .dl_detect_in(dl_detect_out),
        .origin(origin[5]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_5),
        .out_chan_dep_data(out_chan_dep_data_5),
        .token_out_vec(token_out_vec_5),
        .dl_detect_out(dl_in_vec[5]));

    assign proc_dep_vld_vec_5[0] = dl_detect_out ? proc_dep_vld_vec_5_reg[0] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.voltagesBackup_U.t_empty_n & (AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.ap_ready | AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.ap_idle) & ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.voltagesBackup_U.i_write);
    assign proc_dep_vld_vec_5[1] = dl_detect_out ? proc_dep_vld_vec_5_reg[1] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.simConfig_rowsToSimulate_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.simConfig_BLOCK_NUMBERS_V_blk_n);
    assign proc_dep_vld_vec_5[2] = dl_detect_out ? proc_dep_vld_vec_5_reg[2] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.Vi_idx_V_data_V_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.Vi_idx_V_data_V_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.Vi_idx_V_data_V_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.Vi_idx_V_data_V_3_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.Vj_idx_V_data_V_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.Vj_idx_V_data_V_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.Vj_idx_V_data_V_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.Vj_idx_V_data_V_3_blk_n);
    assign proc_dep_vld_vec_5[3] = dl_detect_out ? proc_dep_vld_vec_5_reg[3] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.fixedData_V_data_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.fixedData_V_tlast_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.processedData_V_data_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.processedData_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.processedData_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.V_read_U0.writeV2calc_U0.processedData_V_data_3_blk_n);
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_5_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_5_reg <= proc_dep_vld_vec_5;
        end
    end
    assign in_chan_dep_vld_vec_5[0] = dep_chan_vld_2_5;
    assign in_chan_dep_data_vec_5[8 : 0] = dep_chan_data_2_5;
    assign token_in_vec_5[0] = token_2_5;
    assign in_chan_dep_vld_vec_5[1] = dep_chan_vld_3_5;
    assign in_chan_dep_data_vec_5[17 : 9] = dep_chan_data_3_5;
    assign token_in_vec_5[1] = token_3_5;
    assign in_chan_dep_vld_vec_5[2] = dep_chan_vld_4_5;
    assign in_chan_dep_data_vec_5[26 : 18] = dep_chan_data_4_5;
    assign token_in_vec_5[2] = token_4_5;
    assign in_chan_dep_vld_vec_5[3] = dep_chan_vld_6_5;
    assign in_chan_dep_data_vec_5[35 : 27] = dep_chan_data_6_5;
    assign token_in_vec_5[3] = token_6_5;
    assign dep_chan_vld_5_3 = out_chan_dep_vld_vec_5[0];
    assign dep_chan_data_5_3 = out_chan_dep_data_5;
    assign token_5_3 = token_out_vec_5[0];
    assign dep_chan_vld_5_2 = out_chan_dep_vld_vec_5[1];
    assign dep_chan_data_5_2 = out_chan_dep_data_5;
    assign token_5_2 = token_out_vec_5[1];
    assign dep_chan_vld_5_4 = out_chan_dep_vld_vec_5[2];
    assign dep_chan_data_5_4 = out_chan_dep_data_5;
    assign token_5_4 = token_out_vec_5[2];
    assign dep_chan_vld_5_6 = out_chan_dep_vld_vec_5[3];
    assign dep_chan_data_5_6 = out_chan_dep_data_5;
    assign token_5_6 = token_out_vec_5[3];

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_GapJunctionIP$grp_execute_fu_142$calc_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$calc_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$calc_U0$ap_idle <= AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.ap_idle;
        end
    end
    // Process: AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0
    AESL_deadlock_detect_unit #(9, 6, 4, 4) AESL_deadlock_detect_unit_6 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_6),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_6),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_6),
        .token_in_vec(token_in_vec_6),
        .dl_detect_in(dl_detect_out),
        .origin(origin[6]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_6),
        .out_chan_dep_data(out_chan_dep_data_6),
        .token_out_vec(token_out_vec_6),
        .dl_detect_out(dl_in_vec[6]));

    assign proc_dep_vld_vec_6[0] = dl_detect_out ? proc_dep_vld_vec_6_reg[0] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.simConfig_rowsToSimulate_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.simConfig_BLOCK_NUMBERS_V_blk_n);
    assign proc_dep_vld_vec_6[1] = dl_detect_out ? proc_dep_vld_vec_6_reg[1] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.simConfig_rowsToSimulate_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.simConfig_BLOCK_NUMBERS_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.V_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.V_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.V_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.V_V_data_3_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.F_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.F_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.F_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.F_V_data_3_blk_n | (~AESL_inst_GapJunctionIP.grp_execute_fu_142.start_for_acc_U0_U.if_full_n & AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.ap_done));
    assign proc_dep_vld_vec_6[2] = dl_detect_out ? proc_dep_vld_vec_6_reg[2] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.processedData_V_data_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.processedData_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.processedData_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.processedData_V_data_3_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.fixedData_V_data_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.fixedData_V_tlast_V_blk_n);
    assign proc_dep_vld_vec_6[3] = dl_detect_out ? proc_dep_vld_vec_6_reg[3] : ((~AESL_inst_GapJunctionIP.grp_execute_fu_142.start_for_calc_U0_U.if_empty_n & (AESL_inst_GapJunctionIP.grp_execute_fu_142.calc_U0.ap_ready | AESL_inst_GapJunctionIP$grp_execute_fu_142$calc_U0$ap_idle)));
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_6_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_6_reg <= proc_dep_vld_vec_6;
        end
    end
    assign in_chan_dep_vld_vec_6[0] = dep_chan_vld_1_6;
    assign in_chan_dep_data_vec_6[8 : 0] = dep_chan_data_1_6;
    assign token_in_vec_6[0] = token_1_6;
    assign in_chan_dep_vld_vec_6[1] = dep_chan_vld_2_6;
    assign in_chan_dep_data_vec_6[17 : 9] = dep_chan_data_2_6;
    assign token_in_vec_6[1] = token_2_6;
    assign in_chan_dep_vld_vec_6[2] = dep_chan_vld_5_6;
    assign in_chan_dep_data_vec_6[26 : 18] = dep_chan_data_5_6;
    assign token_in_vec_6[2] = token_5_6;
    assign in_chan_dep_vld_vec_6[3] = dep_chan_vld_7_6;
    assign in_chan_dep_data_vec_6[35 : 27] = dep_chan_data_7_6;
    assign token_in_vec_6[3] = token_7_6;
    assign dep_chan_vld_6_2 = out_chan_dep_vld_vec_6[0];
    assign dep_chan_data_6_2 = out_chan_dep_data_6;
    assign token_6_2 = token_out_vec_6[0];
    assign dep_chan_vld_6_7 = out_chan_dep_vld_vec_6[1];
    assign dep_chan_data_6_7 = out_chan_dep_data_6;
    assign token_6_7 = token_out_vec_6[1];
    assign dep_chan_vld_6_5 = out_chan_dep_vld_vec_6[2];
    assign dep_chan_data_6_5 = out_chan_dep_data_6;
    assign token_6_5 = token_out_vec_6[2];
    assign dep_chan_vld_6_1 = out_chan_dep_vld_vec_6[3];
    assign dep_chan_data_6_1 = out_chan_dep_data_6;
    assign token_6_1 = token_out_vec_6[3];

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_GapJunctionIP$grp_execute_fu_142$acc_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$acc_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$acc_U0$ap_idle <= AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.ap_idle;
        end
    end
    // Process: AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0
    AESL_deadlock_detect_unit #(9, 7, 2, 2) AESL_deadlock_detect_unit_7 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_7),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_7),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_7),
        .token_in_vec(token_in_vec_7),
        .dl_detect_in(dl_detect_out),
        .origin(origin[7]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_7),
        .out_chan_dep_data(out_chan_dep_data_7),
        .token_out_vec(token_out_vec_7),
        .dl_detect_out(dl_in_vec[7]));

    assign proc_dep_vld_vec_7[0] = dl_detect_out ? proc_dep_vld_vec_7_reg[0] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.simConfig_rowsToSimulate_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.simConfig_BLOCK_NUMBERS_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.grp_readCalcData_fu_159.F_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.grp_readCalcData_fu_159.F_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.grp_readCalcData_fu_159.F_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.grp_readCalcData_fu_159.F_V_data_3_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.grp_readCalcData_fu_159.V_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.grp_readCalcData_fu_159.V_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.grp_readCalcData_fu_159.V_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.grp_readCalcData_fu_159.V_V_data_3_blk_n | (~AESL_inst_GapJunctionIP.grp_execute_fu_142.start_for_acc_U0_U.if_empty_n & (AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.ap_ready | AESL_inst_GapJunctionIP$grp_execute_fu_142$acc_U0$ap_idle)));
    assign proc_dep_vld_vec_7[1] = dl_detect_out ? proc_dep_vld_vec_7_reg[1] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.simConfig_rowsToSimulate_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.simConfig_BLOCK_NUMBERS_V_out_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.F_acc_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.F_acc_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.F_acc_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.F_acc_V_data_3_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.V_acc_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.V_acc_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.V_acc_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.acc_U0.V_acc_V_data_3_blk_n | (~AESL_inst_GapJunctionIP.grp_execute_fu_142.start_for_I_calc_U0_U.if_full_n & AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.ap_done));
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_7_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_7_reg <= proc_dep_vld_vec_7;
        end
    end
    assign in_chan_dep_vld_vec_7[0] = dep_chan_vld_6_7;
    assign in_chan_dep_data_vec_7[8 : 0] = dep_chan_data_6_7;
    assign token_in_vec_7[0] = token_6_7;
    assign in_chan_dep_vld_vec_7[1] = dep_chan_vld_8_7;
    assign in_chan_dep_data_vec_7[17 : 9] = dep_chan_data_8_7;
    assign token_in_vec_7[1] = token_8_7;
    assign dep_chan_vld_7_6 = out_chan_dep_vld_vec_7[0];
    assign dep_chan_data_7_6 = out_chan_dep_data_7;
    assign token_7_6 = token_out_vec_7[0];
    assign dep_chan_vld_7_8 = out_chan_dep_vld_vec_7[1];
    assign dep_chan_data_7_8 = out_chan_dep_data_7;
    assign token_7_8 = token_out_vec_7[1];

    // delay ap_idle for one cycle
    reg [0:0] AESL_inst_GapJunctionIP$grp_execute_fu_142$I_calc_U0$ap_idle;
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$I_calc_U0$ap_idle <= 'b0;
        end
        else begin
            AESL_inst_GapJunctionIP$grp_execute_fu_142$I_calc_U0$ap_idle <= AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.ap_idle;
        end
    end
    // Process: AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0
    AESL_deadlock_detect_unit #(9, 8, 1, 1) AESL_deadlock_detect_unit_8 (
        .reset(reset),
        .clock(clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_8),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_8),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_8),
        .token_in_vec(token_in_vec_8),
        .dl_detect_in(dl_detect_out),
        .origin(origin[8]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_8),
        .out_chan_dep_data(out_chan_dep_data_8),
        .token_out_vec(token_out_vec_8),
        .dl_detect_out(dl_in_vec[8]));

    assign proc_dep_vld_vec_8[0] = dl_detect_out ? proc_dep_vld_vec_8_reg[0] : (~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.simConfig_rowsToSimulate_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.simConfig_BLOCK_NUMBERS_V_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.F_acc_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.F_acc_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.F_acc_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.F_acc_V_data_3_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.V_acc_V_data_0_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.V_acc_V_data_1_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.V_acc_V_data_2_blk_n | ~AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.V_acc_V_data_3_blk_n | (~AESL_inst_GapJunctionIP.grp_execute_fu_142.start_for_I_calc_U0_U.if_empty_n & (AESL_inst_GapJunctionIP.grp_execute_fu_142.I_calc_U0.ap_ready | AESL_inst_GapJunctionIP$grp_execute_fu_142$I_calc_U0$ap_idle)));
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            proc_dep_vld_vec_8_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_8_reg <= proc_dep_vld_vec_8;
        end
    end
    assign in_chan_dep_vld_vec_8[0] = dep_chan_vld_7_8;
    assign in_chan_dep_data_vec_8[8 : 0] = dep_chan_data_7_8;
    assign token_in_vec_8[0] = token_7_8;
    assign dep_chan_vld_8_7 = out_chan_dep_vld_vec_8[0];
    assign dep_chan_data_8_7 = out_chan_dep_data_8;
    assign token_8_7 = token_out_vec_8[0];


    AESL_deadlock_report_unit #(9) AESL_deadlock_report_unit_inst (
        .reset(reset),
        .clock(clock),
        .dl_in_vec(dl_in_vec),
        .dl_detect_out(dl_detect_out),
        .origin(origin),
        .token_clear(token_clear));

endmodule
