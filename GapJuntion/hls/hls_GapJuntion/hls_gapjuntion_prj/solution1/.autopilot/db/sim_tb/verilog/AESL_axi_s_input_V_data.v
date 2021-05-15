// ==============================================================
// File generated on Sat May 15 00:03:57 CST 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

`define TV_IN_input_V_data_TDATA "./c.GapJunctionIP.autotvin_input_V_data.dat"
`define INGRESS_STATUS_input_V_data_TDATA "./stream_ingress_status_input_V_data.dat"

`define AUTOTB_TRANSACTION_NUM 4

module AESL_axi_s_input_V_data (
    input clk,
    input reset,
    output [64 - 1:0] TRAN_input_V_data_TDATA,
    output TRAN_input_V_data_TVALID,
    input TRAN_input_V_data_TREADY,
    input ready,
    input done,
    output [31:0] transaction);

    wire TRAN_input_V_data_TVALID_temp;
    wire input_V_data_TDATA_full;
    wire input_V_data_TDATA_empty;
    reg input_V_data_TDATA_write_en;
    reg [64 - 1:0] input_V_data_TDATA_write_data;
    reg input_V_data_TDATA_read_en;
    wire [64 - 1:0] input_V_data_TDATA_read_data;
    
    fifo #(48, 64) fifo_input_V_data_TDATA (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(input_V_data_TDATA_write_en),
        .write_data(input_V_data_TDATA_write_data),
        .read_clock(clk),
        .read_en(input_V_data_TDATA_read_en),
        .read_data(input_V_data_TDATA_read_data),
        .full(input_V_data_TDATA_full),
        .empty(input_V_data_TDATA_empty));
    
    always @ (*) begin
        input_V_data_TDATA_write_en <= 0;
        input_V_data_TDATA_read_en <= TRAN_input_V_data_TREADY & TRAN_input_V_data_TVALID;
    end
    
    assign TRAN_input_V_data_TDATA = input_V_data_TDATA_read_data;
    assign TRAN_input_V_data_TVALID = TRAN_input_V_data_TVALID_temp;

    
    reg input_V_data_TDATA_valid = 0; // ingress buffer indicator: input_V_data_TDATA
    
    assign TRAN_input_V_data_TVALID_temp = ~(input_V_data_TDATA_empty) || (input_V_data_TDATA_valid);
    
    function is_blank_char(input [7:0] in_char);
        if (in_char == " " || in_char == "\011" || in_char == "\012" || in_char == "\015") begin
            is_blank_char = 1;
        end else begin
            is_blank_char = 0;
        end
    endfunction
    
    function [175:0] read_token(input integer fp);
        integer ret;
        begin
            read_token = "";
                    ret = 0;
                    ret = $fscanf(fp,"%s",read_token);
        end
    endfunction
    
    function [175:0] rm_0x(input [175:0] token);
        reg [175:0] token_tmp;
        integer i;
        begin
            token_tmp = "";
            for (i = 0; token[15:0] != "0x"; token = token >> 8) begin
                token_tmp = (token[7:0] << (8 * i)) | token_tmp;
                i = i + 1;
            end
            rm_0x = token_tmp;
        end
    endfunction
    
    reg [31:0] transaction_load_input_V_data_TDATA;
    
    assign transaction = transaction_load_input_V_data_TDATA;
    
    initial begin : AXI_stream_driver_input_V_data_TDATA
        integer fp;
        reg [175:0] token;
        reg [64 - 1:0] data;
        reg [175:0] data_integer;
        integer fp_ingress_status;
        reg [175:0] token_ingress_status;
        reg [31:0] ingress_status;
        reg [8 * 5:1] str;
        integer ret;
        
        transaction_load_input_V_data_TDATA = 0;
        fifo_input_V_data_TDATA.clear();
        wait (reset === 1);
        fp = $fopen(`TV_IN_input_V_data_TDATA, "r");
        if (fp == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `TV_IN_input_V_data_TDATA);
            $finish;
        end
        fp_ingress_status = $fopen(`INGRESS_STATUS_input_V_data_TDATA, "r");
        if (fp_ingress_status == 0) begin // Failed to open file
            $display("ERROR: Failed to open file \"%s\"!", `INGRESS_STATUS_input_V_data_TDATA);
            $finish;
        end
        token = read_token(fp);
        token_ingress_status = read_token(fp_ingress_status);
        if (token != "[[[runtime]]]") begin
            $display("ERROR: token %s != [[[runtime]]]", token);
            $finish;
        end
        token = read_token(fp); // read 1st "[[transaction]]"
        token_ingress_status = read_token(fp_ingress_status);
        forever begin
            @ (negedge clk);
            if (ready == 1) begin
                if (token != "[[[/runtime]]]") begin
                    if (token != "[[transaction]]") begin
                        $display("ERROR: token %s != [[[transaction]]]", token);
                        $finish;
                    end
                    token = read_token(fp); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // skip transaction number
                    token_ingress_status = read_token(fp_ingress_status); // load ingress status at beginning of transaction
                    fifo_input_V_data_TDATA.clear();
                    token = read_token(fp);
                    ret = $sscanf(token_ingress_status, "%d", ingress_status);
                    token_ingress_status = read_token(fp_ingress_status);
                    while (token != "[[/transaction]]") begin
                        if (fifo_input_V_data_TDATA.full) begin
                            $display("ERROR: FIFO is full");
                            $finish;
                        end
                        ret = $sscanf(rm_0x(token), "%x", data_integer);
                        data = data_integer;
                        fifo_input_V_data_TDATA.push(data);
                        token = read_token(fp);
                        ret = $sscanf(token_ingress_status, "%d", ingress_status);
                        token_ingress_status = read_token(fp_ingress_status);
                    end
                    input_V_data_TDATA_valid = (ingress_status > 0);
                    token = read_token(fp);
                    token_ingress_status = read_token(fp_ingress_status);
                    fifo_input_V_data_TDATA.snapshot();
                end else begin
                    fifo_input_V_data_TDATA.restore();
                    if (fp != 0) begin
                        $fclose(fp);
                        fp = 0;
                    end
                    if (fp_ingress_status != 0) begin
                        $fclose(fp_ingress_status);
                        fp_ingress_status = 0;
                    end
                end
                transaction_load_input_V_data_TDATA = transaction_load_input_V_data_TDATA + 1;
            end
        end
    end

endmodule
