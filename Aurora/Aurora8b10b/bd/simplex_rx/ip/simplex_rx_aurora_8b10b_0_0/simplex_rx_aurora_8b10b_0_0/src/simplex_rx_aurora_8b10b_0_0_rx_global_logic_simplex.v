///////////////////////////////////////////////////////////////////////////////
// (c) Copyright 2008 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//
///////////////////////////////////////////////////////////////////////////////
//
//  RX_GLOBAL_LOGIC_SIMPLEX
//
//
//  Description: The RX_GLOBAL_LOGIC_SIMPLEX module handles channel bonding, channel
//               verification, channel error manangement and idle generation in simplex mode.
//
//               This module supports 1 2-byte lane designs
//

`timescale 1 ns / 1 ps

module simplex_rx_aurora_8b10b_0_0_RX_GLOBAL_LOGIC_SIMPLEX #
(
     parameter   WATCHDOG_TIMEOUT =  14
)
(
    // GTP Interface
    CH_BOND_DONE,

    EN_CHAN_SYNC,


    // Aurora Lane Interface
    LANE_UP,
    SOFT_ERR,
    HARD_ERR,
    CHANNEL_BOND_LOAD,
    GOT_A,
    GOT_V,

    RESET_LANES,
    GTRXRESET_OUT,

    // Sideband Signal
    RX_ALIGNED,
    RX_VERIFY,

    // System Interface
    USER_CLK,
    RESET,
    POWER_DOWN,

    CHANNEL_UP,
    START_RX,
    CHANNEL_SOFT_ERR,
    CHANNEL_HARD_ERR

);

`define DLY #1


//***********************************Port Declarations*******************************

    // GTP Interface
input              CH_BOND_DONE;

output             EN_CHAN_SYNC;


    // Aurora Lane Interface
input              SOFT_ERR;
input              LANE_UP;
input              HARD_ERR;
input              CHANNEL_BOND_LOAD;
input   [0:1]      GOT_A;
input              GOT_V;

output             RESET_LANES;

output             GTRXRESET_OUT;
    // Sideband Signal
    output        RX_ALIGNED;
    output        RX_VERIFY;

    // System Interface
input              USER_CLK;
input              RESET;
input              POWER_DOWN;

output             CHANNEL_UP;
output             START_RX;
output             CHANNEL_SOFT_ERR;
output             CHANNEL_HARD_ERR;



//*********************************Wire Declarations**********************************
wire               reset_channel_i;

    wire  rx_verify_i;

//*********************************Main Body of Code**********************************
    assign CHANNEL_UP = rx_verify_i;
    assign RX_VERIFY  = rx_verify_i;

    // State Machine for channel bonding and verification.
    simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_INIT_SM_SIMPLEX #
    (
       .WATCHDOG_TIMEOUT (WATCHDOG_TIMEOUT)
    )
    rx_channel_init_sm_simplex_i
    (
        // GTP Interface
        .CH_BOND_DONE(CH_BOND_DONE),

        .EN_CHAN_SYNC(EN_CHAN_SYNC),


        // Aurora Lane Interface

        .CHANNEL_BOND_LOAD(CHANNEL_BOND_LOAD),
        .GOT_A(GOT_A),
        .GOT_V(GOT_V),

        .RESET_LANES(RESET_LANES),


        // System Interface
        .USER_CLK(USER_CLK),
        .RESET(RESET),

        .START_RX(START_RX),
        .CHANNEL_UP(rx_verify_i),


        // Channel Error Management Module Interface
        .GTRXRESET_OUT(GTRXRESET_OUT),
        .RESET_CHANNEL(reset_channel_i)

    );



    // Channel Error Management module.
    simplex_rx_aurora_8b10b_0_0_RX_CHANNEL_ERR_DETECT_SIMPLEX rx_channel_err_detect_simplex_i
    (
        // Aurora Lane Interface
        .SOFT_ERR(SOFT_ERR),
        .HARD_ERR(HARD_ERR),
        .LANE_UP(LANE_UP),


        // System Interface
        .USER_CLK(USER_CLK),
        .POWER_DOWN(POWER_DOWN),

        .CHANNEL_SOFT_ERR(CHANNEL_SOFT_ERR),
        .CHANNEL_HARD_ERR(CHANNEL_HARD_ERR),

        .RX_ALIGNED(RX_ALIGNED),

        // Channel Init State Machine Interface
        .RESET_CHANNEL(reset_channel_i)
    );

endmodule
