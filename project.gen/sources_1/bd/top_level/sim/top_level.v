//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Tue Mar 25 15:53:25 2025
//Host        : simtool-5 running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module cdc_packetizer_imp_1PCWAGB
   (M_AXIS_tdata,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tvalid,
    S_AXIS_tdata,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tvalid,
    cmac_clk,
    cmac_resetn,
    sys_clk,
    sys_resetn_in);
  output [511:0]M_AXIS_tdata;
  output [63:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output M_AXIS_tvalid;
  input [511:0]S_AXIS_tdata;
  input [63:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input S_AXIS_tvalid;
  input cmac_clk;
  input cmac_resetn;
  input sys_clk;
  input sys_resetn_in;

  wire [511:0]axis_tx_1_TDATA;
  wire [63:0]axis_tx_1_TKEEP;
  wire axis_tx_1_TLAST;
  wire axis_tx_1_TREADY;
  wire axis_tx_1_TVALID;
  wire cmac_control_rx_resetn_out;
  wire cmac_usplus_gt_txusrclk2;
  wire sys_clk_1;
  wire sys_resetn_in_1;
  wire [511:0]tx_cdc_fifo1_M_AXIS_TDATA;
  wire [63:0]tx_cdc_fifo1_M_AXIS_TKEEP;
  wire tx_cdc_fifo1_M_AXIS_TLAST;
  wire tx_cdc_fifo1_M_AXIS_TREADY;
  wire tx_cdc_fifo1_M_AXIS_TVALID;
  wire [511:0]tx_cdc_fifo_M_AXIS_TDATA;
  wire [63:0]tx_cdc_fifo_M_AXIS_TKEEP;
  wire tx_cdc_fifo_M_AXIS_TLAST;
  wire tx_cdc_fifo_M_AXIS_TREADY;
  wire tx_cdc_fifo_M_AXIS_TVALID;

  assign M_AXIS_tdata[511:0] = tx_cdc_fifo1_M_AXIS_TDATA;
  assign M_AXIS_tkeep[63:0] = tx_cdc_fifo1_M_AXIS_TKEEP;
  assign M_AXIS_tlast = tx_cdc_fifo1_M_AXIS_TLAST;
  assign M_AXIS_tvalid = tx_cdc_fifo1_M_AXIS_TVALID;
  assign S_AXIS_tready = axis_tx_1_TREADY;
  assign axis_tx_1_TDATA = S_AXIS_tdata[511:0];
  assign axis_tx_1_TKEEP = S_AXIS_tkeep[63:0];
  assign axis_tx_1_TLAST = S_AXIS_tlast;
  assign axis_tx_1_TVALID = S_AXIS_tvalid;
  assign cmac_control_rx_resetn_out = cmac_resetn;
  assign cmac_usplus_gt_txusrclk2 = cmac_clk;
  assign sys_clk_1 = sys_clk;
  assign sys_resetn_in_1 = sys_resetn_in;
  assign tx_cdc_fifo1_M_AXIS_TREADY = M_AXIS_tready;
  top_level_tx_cdc_fifo_0 packetizer
       (.m_axis_tdata(tx_cdc_fifo1_M_AXIS_TDATA),
        .m_axis_tkeep(tx_cdc_fifo1_M_AXIS_TKEEP),
        .m_axis_tlast(tx_cdc_fifo1_M_AXIS_TLAST),
        .m_axis_tready(tx_cdc_fifo1_M_AXIS_TREADY),
        .m_axis_tvalid(tx_cdc_fifo1_M_AXIS_TVALID),
        .s_axis_aclk(cmac_usplus_gt_txusrclk2),
        .s_axis_aresetn(cmac_control_rx_resetn_out),
        .s_axis_tdata(tx_cdc_fifo_M_AXIS_TDATA),
        .s_axis_tkeep(tx_cdc_fifo_M_AXIS_TKEEP),
        .s_axis_tlast(tx_cdc_fifo_M_AXIS_TLAST),
        .s_axis_tready(tx_cdc_fifo_M_AXIS_TREADY),
        .s_axis_tvalid(tx_cdc_fifo_M_AXIS_TVALID));
  top_level_cdc_fifo_0 tx_cdc_fifo
       (.m_axis_aclk(cmac_usplus_gt_txusrclk2),
        .m_axis_tdata(tx_cdc_fifo_M_AXIS_TDATA),
        .m_axis_tkeep(tx_cdc_fifo_M_AXIS_TKEEP),
        .m_axis_tlast(tx_cdc_fifo_M_AXIS_TLAST),
        .m_axis_tready(tx_cdc_fifo_M_AXIS_TREADY),
        .m_axis_tvalid(tx_cdc_fifo_M_AXIS_TVALID),
        .s_axis_aclk(sys_clk_1),
        .s_axis_aresetn(sys_resetn_in_1),
        .s_axis_tdata(axis_tx_1_TDATA),
        .s_axis_tkeep(axis_tx_1_TKEEP),
        .s_axis_tlast(axis_tx_1_TLAST),
        .s_axis_tready(axis_tx_1_TREADY),
        .s_axis_tvalid(axis_tx_1_TVALID));
endmodule

module channel_0_imp_4UD4XR
   (AXIS_IN_tdata,
    AXIS_IN_tready,
    AXIS_IN_tvalid,
    AXIS_OUT_tdata,
    AXIS_OUT_tready,
    AXIS_OUT_tvalid,
    clk,
    ddr4_act_n,
    ddr4_adr,
    ddr4_ba,
    ddr4_bg,
    ddr4_ck_c,
    ddr4_ck_t,
    ddr4_cke,
    ddr4_clk_clk_n,
    ddr4_clk_clk_p,
    ddr4_cs_n,
    ddr4_dm_n,
    ddr4_dq,
    ddr4_dqs_c,
    ddr4_dqs_t,
    ddr4_odt,
    ddr4_reset_n,
    ddr_init_calib_complete,
    has_data,
    high_water_mark,
    inflow_done,
    inflow_q,
    overflow,
    ram_reader_idle,
    resetn,
    start_ram_reader);
  input [511:0]AXIS_IN_tdata;
  output AXIS_IN_tready;
  input AXIS_IN_tvalid;
  output [511:0]AXIS_OUT_tdata;
  input AXIS_OUT_tready;
  output AXIS_OUT_tvalid;
  input clk;
  output ddr4_act_n;
  output [16:0]ddr4_adr;
  output [1:0]ddr4_ba;
  output [1:0]ddr4_bg;
  output [0:0]ddr4_ck_c;
  output [0:0]ddr4_ck_t;
  output [0:0]ddr4_cke;
  input ddr4_clk_clk_n;
  input ddr4_clk_clk_p;
  output [0:0]ddr4_cs_n;
  inout [7:0]ddr4_dm_n;
  inout [63:0]ddr4_dq;
  inout [7:0]ddr4_dqs_c;
  inout [7:0]ddr4_dqs_t;
  output [0:0]ddr4_odt;
  output ddr4_reset_n;
  output ddr_init_calib_complete;
  output has_data;
  output [63:0]high_water_mark;
  output inflow_done;
  input [0:0]inflow_q;
  output overflow;
  output ram_reader_idle;
  input resetn;
  input start_ram_reader;

  wire [511:0]axis_switch_axis_out0_TDATA;
  wire axis_switch_axis_out0_TREADY;
  wire axis_switch_axis_out0_TVALID;
  wire ddr4_clk_1_CLK_N;
  wire ddr4_clk_1_CLK_P;
  wire ddr_c0_init_calib_complete;
  wire ddr_ddr4_ACT_N;
  wire [16:0]ddr_ddr4_ADR;
  wire [1:0]ddr_ddr4_BA;
  wire [1:0]ddr_ddr4_BG;
  wire [0:0]ddr_ddr4_CKE;
  wire [0:0]ddr_ddr4_CK_C;
  wire [0:0]ddr_ddr4_CK_T;
  wire [0:0]ddr_ddr4_CS_N;
  wire [7:0]ddr_ddr4_DM_N;
  wire [63:0]ddr_ddr4_DQ;
  wire [7:0]ddr_ddr4_DQS_C;
  wire [7:0]ddr_ddr4_DQS_T;
  wire [0:0]ddr_ddr4_ODT;
  wire ddr_ddr4_RESET_N;
  wire pcie_bridge_axi_aclk;
  wire [511:0]ram_reader_AXIS_OUT_TDATA;
  wire ram_reader_AXIS_OUT_TREADY;
  wire ram_reader_AXIS_OUT_TVALID;
  wire [63:0]ram_reader_M_AXI_ARADDR;
  wire [1:0]ram_reader_M_AXI_ARBURST;
  wire [3:0]ram_reader_M_AXI_ARCACHE;
  wire [4:0]ram_reader_M_AXI_ARID;
  wire [7:0]ram_reader_M_AXI_ARLEN;
  wire ram_reader_M_AXI_ARLOCK;
  wire [2:0]ram_reader_M_AXI_ARPROT;
  wire [3:0]ram_reader_M_AXI_ARQOS;
  wire ram_reader_M_AXI_ARREADY;
  wire [2:0]ram_reader_M_AXI_ARSIZE;
  wire ram_reader_M_AXI_ARVALID;
  wire [63:0]ram_reader_M_AXI_AWADDR;
  wire [1:0]ram_reader_M_AXI_AWBURST;
  wire [3:0]ram_reader_M_AXI_AWCACHE;
  wire [4:0]ram_reader_M_AXI_AWID;
  wire [7:0]ram_reader_M_AXI_AWLEN;
  wire ram_reader_M_AXI_AWLOCK;
  wire [2:0]ram_reader_M_AXI_AWPROT;
  wire [3:0]ram_reader_M_AXI_AWQOS;
  wire ram_reader_M_AXI_AWREADY;
  wire [2:0]ram_reader_M_AXI_AWSIZE;
  wire ram_reader_M_AXI_AWVALID;
  wire ram_reader_M_AXI_BREADY;
  wire [1:0]ram_reader_M_AXI_BRESP;
  wire ram_reader_M_AXI_BVALID;
  wire [511:0]ram_reader_M_AXI_RDATA;
  wire ram_reader_M_AXI_RLAST;
  wire ram_reader_M_AXI_RREADY;
  wire [1:0]ram_reader_M_AXI_RRESP;
  wire ram_reader_M_AXI_RVALID;
  wire [511:0]ram_reader_M_AXI_WDATA;
  wire ram_reader_M_AXI_WLAST;
  wire ram_reader_M_AXI_WREADY;
  wire [63:0]ram_reader_M_AXI_WSTRB;
  wire ram_reader_M_AXI_WVALID;
  wire ram_reader_idle;
  wire resetn_1;
  wire start_ram_reader_1;
  wire [63:0]stream_to_ram_M_AXI_ARADDR;
  wire [1:0]stream_to_ram_M_AXI_ARBURST;
  wire [3:0]stream_to_ram_M_AXI_ARCACHE;
  wire [4:0]stream_to_ram_M_AXI_ARID;
  wire [7:0]stream_to_ram_M_AXI_ARLEN;
  wire stream_to_ram_M_AXI_ARLOCK;
  wire [2:0]stream_to_ram_M_AXI_ARPROT;
  wire [3:0]stream_to_ram_M_AXI_ARQOS;
  wire stream_to_ram_M_AXI_ARREADY;
  wire [2:0]stream_to_ram_M_AXI_ARSIZE;
  wire stream_to_ram_M_AXI_ARVALID;
  wire [63:0]stream_to_ram_M_AXI_AWADDR;
  wire [1:0]stream_to_ram_M_AXI_AWBURST;
  wire [3:0]stream_to_ram_M_AXI_AWCACHE;
  wire [4:0]stream_to_ram_M_AXI_AWID;
  wire [7:0]stream_to_ram_M_AXI_AWLEN;
  wire stream_to_ram_M_AXI_AWLOCK;
  wire [2:0]stream_to_ram_M_AXI_AWPROT;
  wire [3:0]stream_to_ram_M_AXI_AWQOS;
  wire stream_to_ram_M_AXI_AWREADY;
  wire [2:0]stream_to_ram_M_AXI_AWSIZE;
  wire stream_to_ram_M_AXI_AWVALID;
  wire stream_to_ram_M_AXI_BREADY;
  wire [1:0]stream_to_ram_M_AXI_BRESP;
  wire stream_to_ram_M_AXI_BVALID;
  wire [511:0]stream_to_ram_M_AXI_RDATA;
  wire stream_to_ram_M_AXI_RLAST;
  wire stream_to_ram_M_AXI_RREADY;
  wire [1:0]stream_to_ram_M_AXI_RRESP;
  wire stream_to_ram_M_AXI_RVALID;
  wire [511:0]stream_to_ram_M_AXI_WDATA;
  wire stream_to_ram_M_AXI_WLAST;
  wire stream_to_ram_M_AXI_WREADY;
  wire [63:0]stream_to_ram_M_AXI_WSTRB;
  wire stream_to_ram_M_AXI_WVALID;
  wire [7:0]stream_to_ram_cycles_in_partial_block;
  wire stream_to_ram_done;
  wire [31:0]stream_to_ram_full_blocks;
  wire stream_to_ram_has_data;
  wire [63:0]stream_to_ram_hwm;
  wire stream_to_ram_overflow;
  wire [0:0]switch_ctrl_0_inflow_q;

  assign AXIS_IN_tready = axis_switch_axis_out0_TREADY;
  assign AXIS_OUT_tdata[511:0] = ram_reader_AXIS_OUT_TDATA;
  assign AXIS_OUT_tvalid = ram_reader_AXIS_OUT_TVALID;
  assign axis_switch_axis_out0_TDATA = AXIS_IN_tdata[511:0];
  assign axis_switch_axis_out0_TVALID = AXIS_IN_tvalid;
  assign ddr4_act_n = ddr_ddr4_ACT_N;
  assign ddr4_adr[16:0] = ddr_ddr4_ADR;
  assign ddr4_ba[1:0] = ddr_ddr4_BA;
  assign ddr4_bg[1:0] = ddr_ddr4_BG;
  assign ddr4_ck_c[0] = ddr_ddr4_CK_C;
  assign ddr4_ck_t[0] = ddr_ddr4_CK_T;
  assign ddr4_cke[0] = ddr_ddr4_CKE;
  assign ddr4_clk_1_CLK_N = ddr4_clk_clk_n;
  assign ddr4_clk_1_CLK_P = ddr4_clk_clk_p;
  assign ddr4_cs_n[0] = ddr_ddr4_CS_N;
  assign ddr4_odt[0] = ddr_ddr4_ODT;
  assign ddr4_reset_n = ddr_ddr4_RESET_N;
  assign ddr_init_calib_complete = ddr_c0_init_calib_complete;
  assign has_data = stream_to_ram_has_data;
  assign high_water_mark[63:0] = stream_to_ram_hwm;
  assign inflow_done = stream_to_ram_done;
  assign overflow = stream_to_ram_overflow;
  assign pcie_bridge_axi_aclk = clk;
  assign ram_reader_AXIS_OUT_TREADY = AXIS_OUT_tready;
  assign resetn_1 = resetn;
  assign start_ram_reader_1 = start_ram_reader;
  assign switch_ctrl_0_inflow_q = inflow_q[0];
  ddr_imp_LCEBXW ddr
       (.RD_AXI_araddr(ram_reader_M_AXI_ARADDR),
        .RD_AXI_arburst(ram_reader_M_AXI_ARBURST),
        .RD_AXI_arcache(ram_reader_M_AXI_ARCACHE),
        .RD_AXI_arid(ram_reader_M_AXI_ARID),
        .RD_AXI_arlen(ram_reader_M_AXI_ARLEN),
        .RD_AXI_arlock(ram_reader_M_AXI_ARLOCK),
        .RD_AXI_arprot(ram_reader_M_AXI_ARPROT),
        .RD_AXI_arqos(ram_reader_M_AXI_ARQOS),
        .RD_AXI_arready(ram_reader_M_AXI_ARREADY),
        .RD_AXI_arsize(ram_reader_M_AXI_ARSIZE),
        .RD_AXI_arvalid(ram_reader_M_AXI_ARVALID),
        .RD_AXI_awaddr(ram_reader_M_AXI_AWADDR),
        .RD_AXI_awburst(ram_reader_M_AXI_AWBURST),
        .RD_AXI_awcache(ram_reader_M_AXI_AWCACHE),
        .RD_AXI_awid(ram_reader_M_AXI_AWID),
        .RD_AXI_awlen(ram_reader_M_AXI_AWLEN),
        .RD_AXI_awlock(ram_reader_M_AXI_AWLOCK),
        .RD_AXI_awprot(ram_reader_M_AXI_AWPROT),
        .RD_AXI_awqos(ram_reader_M_AXI_AWQOS),
        .RD_AXI_awready(ram_reader_M_AXI_AWREADY),
        .RD_AXI_awsize(ram_reader_M_AXI_AWSIZE),
        .RD_AXI_awvalid(ram_reader_M_AXI_AWVALID),
        .RD_AXI_bready(ram_reader_M_AXI_BREADY),
        .RD_AXI_bresp(ram_reader_M_AXI_BRESP),
        .RD_AXI_bvalid(ram_reader_M_AXI_BVALID),
        .RD_AXI_rdata(ram_reader_M_AXI_RDATA),
        .RD_AXI_rlast(ram_reader_M_AXI_RLAST),
        .RD_AXI_rready(ram_reader_M_AXI_RREADY),
        .RD_AXI_rresp(ram_reader_M_AXI_RRESP),
        .RD_AXI_rvalid(ram_reader_M_AXI_RVALID),
        .RD_AXI_wdata(ram_reader_M_AXI_WDATA),
        .RD_AXI_wlast(ram_reader_M_AXI_WLAST),
        .RD_AXI_wready(ram_reader_M_AXI_WREADY),
        .RD_AXI_wstrb(ram_reader_M_AXI_WSTRB),
        .RD_AXI_wvalid(ram_reader_M_AXI_WVALID),
        .WR_AXI_araddr(stream_to_ram_M_AXI_ARADDR),
        .WR_AXI_arburst(stream_to_ram_M_AXI_ARBURST),
        .WR_AXI_arcache(stream_to_ram_M_AXI_ARCACHE),
        .WR_AXI_arid(stream_to_ram_M_AXI_ARID),
        .WR_AXI_arlen(stream_to_ram_M_AXI_ARLEN),
        .WR_AXI_arlock(stream_to_ram_M_AXI_ARLOCK),
        .WR_AXI_arprot(stream_to_ram_M_AXI_ARPROT),
        .WR_AXI_arqos(stream_to_ram_M_AXI_ARQOS),
        .WR_AXI_arready(stream_to_ram_M_AXI_ARREADY),
        .WR_AXI_arsize(stream_to_ram_M_AXI_ARSIZE),
        .WR_AXI_arvalid(stream_to_ram_M_AXI_ARVALID),
        .WR_AXI_awaddr(stream_to_ram_M_AXI_AWADDR),
        .WR_AXI_awburst(stream_to_ram_M_AXI_AWBURST),
        .WR_AXI_awcache(stream_to_ram_M_AXI_AWCACHE),
        .WR_AXI_awid(stream_to_ram_M_AXI_AWID),
        .WR_AXI_awlen(stream_to_ram_M_AXI_AWLEN),
        .WR_AXI_awlock(stream_to_ram_M_AXI_AWLOCK),
        .WR_AXI_awprot(stream_to_ram_M_AXI_AWPROT),
        .WR_AXI_awqos(stream_to_ram_M_AXI_AWQOS),
        .WR_AXI_awready(stream_to_ram_M_AXI_AWREADY),
        .WR_AXI_awsize(stream_to_ram_M_AXI_AWSIZE),
        .WR_AXI_awvalid(stream_to_ram_M_AXI_AWVALID),
        .WR_AXI_bready(stream_to_ram_M_AXI_BREADY),
        .WR_AXI_bresp(stream_to_ram_M_AXI_BRESP),
        .WR_AXI_bvalid(stream_to_ram_M_AXI_BVALID),
        .WR_AXI_rdata(stream_to_ram_M_AXI_RDATA),
        .WR_AXI_rlast(stream_to_ram_M_AXI_RLAST),
        .WR_AXI_rready(stream_to_ram_M_AXI_RREADY),
        .WR_AXI_rresp(stream_to_ram_M_AXI_RRESP),
        .WR_AXI_rvalid(stream_to_ram_M_AXI_RVALID),
        .WR_AXI_wdata(stream_to_ram_M_AXI_WDATA),
        .WR_AXI_wlast(stream_to_ram_M_AXI_WLAST),
        .WR_AXI_wready(stream_to_ram_M_AXI_WREADY),
        .WR_AXI_wstrb(stream_to_ram_M_AXI_WSTRB),
        .WR_AXI_wvalid(stream_to_ram_M_AXI_WVALID),
        .aclk(pcie_bridge_axi_aclk),
        .aresetn(resetn_1),
        .c0_init_calib_complete(ddr_c0_init_calib_complete),
        .ddr4_act_n(ddr_ddr4_ACT_N),
        .ddr4_adr(ddr_ddr4_ADR),
        .ddr4_ba(ddr_ddr4_BA),
        .ddr4_bg(ddr_ddr4_BG),
        .ddr4_ck_c(ddr_ddr4_CK_C),
        .ddr4_ck_t(ddr_ddr4_CK_T),
        .ddr4_cke(ddr_ddr4_CKE),
        .ddr4_clk_clk_n(ddr4_clk_1_CLK_N),
        .ddr4_clk_clk_p(ddr4_clk_1_CLK_P),
        .ddr4_cs_n(ddr_ddr4_CS_N),
        .ddr4_dm_n(ddr4_dm_n[7:0]),
        .ddr4_dq(ddr4_dq[63:0]),
        .ddr4_dqs_c(ddr4_dqs_c[7:0]),
        .ddr4_dqs_t(ddr4_dqs_t[7:0]),
        .ddr4_odt(ddr_ddr4_ODT),
        .ddr4_reset_n(ddr_ddr4_RESET_N));
  top_level_ram_reader_0_0 ram_reader
       (.AXIS_OUT_TDATA(ram_reader_AXIS_OUT_TDATA),
        .AXIS_OUT_TREADY(ram_reader_AXIS_OUT_TREADY),
        .AXIS_OUT_TVALID(ram_reader_AXIS_OUT_TVALID),
        .M_AXI_ARADDR(ram_reader_M_AXI_ARADDR),
        .M_AXI_ARBURST(ram_reader_M_AXI_ARBURST),
        .M_AXI_ARCACHE(ram_reader_M_AXI_ARCACHE),
        .M_AXI_ARID(ram_reader_M_AXI_ARID),
        .M_AXI_ARLEN(ram_reader_M_AXI_ARLEN),
        .M_AXI_ARLOCK(ram_reader_M_AXI_ARLOCK),
        .M_AXI_ARPROT(ram_reader_M_AXI_ARPROT),
        .M_AXI_ARQOS(ram_reader_M_AXI_ARQOS),
        .M_AXI_ARREADY(ram_reader_M_AXI_ARREADY),
        .M_AXI_ARSIZE(ram_reader_M_AXI_ARSIZE),
        .M_AXI_ARVALID(ram_reader_M_AXI_ARVALID),
        .M_AXI_AWADDR(ram_reader_M_AXI_AWADDR),
        .M_AXI_AWBURST(ram_reader_M_AXI_AWBURST),
        .M_AXI_AWCACHE(ram_reader_M_AXI_AWCACHE),
        .M_AXI_AWID(ram_reader_M_AXI_AWID),
        .M_AXI_AWLEN(ram_reader_M_AXI_AWLEN),
        .M_AXI_AWLOCK(ram_reader_M_AXI_AWLOCK),
        .M_AXI_AWPROT(ram_reader_M_AXI_AWPROT),
        .M_AXI_AWQOS(ram_reader_M_AXI_AWQOS),
        .M_AXI_AWREADY(ram_reader_M_AXI_AWREADY),
        .M_AXI_AWSIZE(ram_reader_M_AXI_AWSIZE),
        .M_AXI_AWVALID(ram_reader_M_AXI_AWVALID),
        .M_AXI_BREADY(ram_reader_M_AXI_BREADY),
        .M_AXI_BRESP(ram_reader_M_AXI_BRESP),
        .M_AXI_BVALID(ram_reader_M_AXI_BVALID),
        .M_AXI_RDATA(ram_reader_M_AXI_RDATA),
        .M_AXI_RLAST(ram_reader_M_AXI_RLAST),
        .M_AXI_RREADY(ram_reader_M_AXI_RREADY),
        .M_AXI_RRESP(ram_reader_M_AXI_RRESP),
        .M_AXI_RVALID(ram_reader_M_AXI_RVALID),
        .M_AXI_WDATA(ram_reader_M_AXI_WDATA),
        .M_AXI_WLAST(ram_reader_M_AXI_WLAST),
        .M_AXI_WREADY(ram_reader_M_AXI_WREADY),
        .M_AXI_WSTRB(ram_reader_M_AXI_WSTRB),
        .M_AXI_WVALID(ram_reader_M_AXI_WVALID),
        .clk(pcie_bridge_axi_aclk),
        .full_blocks(stream_to_ram_full_blocks),
        .idle(ram_reader_idle),
        .partial_block_cycles(stream_to_ram_cycles_in_partial_block),
        .resetn(resetn_1),
        .start(start_ram_reader_1));
  top_level_stream_to_ram_0_0 stream_to_ram
       (.AXIS_IN_TDATA(axis_switch_axis_out0_TDATA),
        .AXIS_IN_TREADY(axis_switch_axis_out0_TREADY),
        .AXIS_IN_TVALID(axis_switch_axis_out0_TVALID),
        .M_AXI_ARADDR(stream_to_ram_M_AXI_ARADDR),
        .M_AXI_ARBURST(stream_to_ram_M_AXI_ARBURST),
        .M_AXI_ARCACHE(stream_to_ram_M_AXI_ARCACHE),
        .M_AXI_ARID(stream_to_ram_M_AXI_ARID),
        .M_AXI_ARLEN(stream_to_ram_M_AXI_ARLEN),
        .M_AXI_ARLOCK(stream_to_ram_M_AXI_ARLOCK),
        .M_AXI_ARPROT(stream_to_ram_M_AXI_ARPROT),
        .M_AXI_ARQOS(stream_to_ram_M_AXI_ARQOS),
        .M_AXI_ARREADY(stream_to_ram_M_AXI_ARREADY),
        .M_AXI_ARSIZE(stream_to_ram_M_AXI_ARSIZE),
        .M_AXI_ARVALID(stream_to_ram_M_AXI_ARVALID),
        .M_AXI_AWADDR(stream_to_ram_M_AXI_AWADDR),
        .M_AXI_AWBURST(stream_to_ram_M_AXI_AWBURST),
        .M_AXI_AWCACHE(stream_to_ram_M_AXI_AWCACHE),
        .M_AXI_AWID(stream_to_ram_M_AXI_AWID),
        .M_AXI_AWLEN(stream_to_ram_M_AXI_AWLEN),
        .M_AXI_AWLOCK(stream_to_ram_M_AXI_AWLOCK),
        .M_AXI_AWPROT(stream_to_ram_M_AXI_AWPROT),
        .M_AXI_AWQOS(stream_to_ram_M_AXI_AWQOS),
        .M_AXI_AWREADY(stream_to_ram_M_AXI_AWREADY),
        .M_AXI_AWSIZE(stream_to_ram_M_AXI_AWSIZE),
        .M_AXI_AWVALID(stream_to_ram_M_AXI_AWVALID),
        .M_AXI_BREADY(stream_to_ram_M_AXI_BREADY),
        .M_AXI_BRESP(stream_to_ram_M_AXI_BRESP),
        .M_AXI_BVALID(stream_to_ram_M_AXI_BVALID),
        .M_AXI_RDATA(stream_to_ram_M_AXI_RDATA),
        .M_AXI_RLAST(stream_to_ram_M_AXI_RLAST),
        .M_AXI_RREADY(stream_to_ram_M_AXI_RREADY),
        .M_AXI_RRESP(stream_to_ram_M_AXI_RRESP),
        .M_AXI_RVALID(stream_to_ram_M_AXI_RVALID),
        .M_AXI_WDATA(stream_to_ram_M_AXI_WDATA),
        .M_AXI_WLAST(stream_to_ram_M_AXI_WLAST),
        .M_AXI_WREADY(stream_to_ram_M_AXI_WREADY),
        .M_AXI_WSTRB(stream_to_ram_M_AXI_WSTRB),
        .M_AXI_WVALID(stream_to_ram_M_AXI_WVALID),
        .clk(pcie_bridge_axi_aclk),
        .cycles_in_partial_block(stream_to_ram_cycles_in_partial_block),
        .done(stream_to_ram_done),
        .full_blocks(stream_to_ram_full_blocks),
        .has_data(stream_to_ram_has_data),
        .hwm(stream_to_ram_hwm),
        .inflow_q(switch_ctrl_0_inflow_q),
        .overflow(stream_to_ram_overflow),
        .resetn(resetn_1));
endmodule

module channel_1_imp_1YO9ERL
   (AXIS_IN_tdata,
    AXIS_IN_tready,
    AXIS_IN_tvalid,
    AXIS_OUT_tdata,
    AXIS_OUT_tready,
    AXIS_OUT_tvalid,
    clk,
    ddr4_act_n,
    ddr4_adr,
    ddr4_ba,
    ddr4_bg,
    ddr4_ck_c,
    ddr4_ck_t,
    ddr4_cke,
    ddr4_clk_clk_n,
    ddr4_clk_clk_p,
    ddr4_cs_n,
    ddr4_dm_n,
    ddr4_dq,
    ddr4_dqs_c,
    ddr4_dqs_t,
    ddr4_odt,
    ddr4_reset_n,
    ddr_init_calib_complete,
    has_data,
    high_water_mark,
    inflow_done,
    inflow_q,
    overflow,
    ram_reader_idle,
    resetn,
    start_ram_reader);
  input [511:0]AXIS_IN_tdata;
  output AXIS_IN_tready;
  input AXIS_IN_tvalid;
  output [511:0]AXIS_OUT_tdata;
  input AXIS_OUT_tready;
  output AXIS_OUT_tvalid;
  input clk;
  output ddr4_act_n;
  output [16:0]ddr4_adr;
  output [1:0]ddr4_ba;
  output [1:0]ddr4_bg;
  output [0:0]ddr4_ck_c;
  output [0:0]ddr4_ck_t;
  output [0:0]ddr4_cke;
  input ddr4_clk_clk_n;
  input ddr4_clk_clk_p;
  output [0:0]ddr4_cs_n;
  inout [7:0]ddr4_dm_n;
  inout [63:0]ddr4_dq;
  inout [7:0]ddr4_dqs_c;
  inout [7:0]ddr4_dqs_t;
  output [0:0]ddr4_odt;
  output ddr4_reset_n;
  output ddr_init_calib_complete;
  output has_data;
  output [63:0]high_water_mark;
  output inflow_done;
  input [0:0]inflow_q;
  output overflow;
  output ram_reader_idle;
  input resetn;
  input start_ram_reader;

  wire [511:0]axis_switch_axis_out1_TDATA;
  wire axis_switch_axis_out1_TREADY;
  wire axis_switch_axis_out1_TVALID;
  wire ddr4_clk_1_CLK_N;
  wire ddr4_clk_1_CLK_P;
  wire ddr_c0_init_calib_complete;
  wire ddr_ddr4_ACT_N;
  wire [16:0]ddr_ddr4_ADR;
  wire [1:0]ddr_ddr4_BA;
  wire [1:0]ddr_ddr4_BG;
  wire [0:0]ddr_ddr4_CKE;
  wire [0:0]ddr_ddr4_CK_C;
  wire [0:0]ddr_ddr4_CK_T;
  wire [0:0]ddr_ddr4_CS_N;
  wire [7:0]ddr_ddr4_DM_N;
  wire [63:0]ddr_ddr4_DQ;
  wire [7:0]ddr_ddr4_DQS_C;
  wire [7:0]ddr_ddr4_DQS_T;
  wire [0:0]ddr_ddr4_ODT;
  wire ddr_ddr4_RESET_N;
  wire pcie_bridge_axi_aclk;
  wire ram_reader_0_idle;
  wire [511:0]ram_reader_AXIS_OUT_TDATA;
  wire ram_reader_AXIS_OUT_TREADY;
  wire ram_reader_AXIS_OUT_TVALID;
  wire [63:0]ram_reader_M_AXI_ARADDR;
  wire [1:0]ram_reader_M_AXI_ARBURST;
  wire [3:0]ram_reader_M_AXI_ARCACHE;
  wire [4:0]ram_reader_M_AXI_ARID;
  wire [7:0]ram_reader_M_AXI_ARLEN;
  wire ram_reader_M_AXI_ARLOCK;
  wire [2:0]ram_reader_M_AXI_ARPROT;
  wire [3:0]ram_reader_M_AXI_ARQOS;
  wire ram_reader_M_AXI_ARREADY;
  wire [2:0]ram_reader_M_AXI_ARSIZE;
  wire ram_reader_M_AXI_ARVALID;
  wire [63:0]ram_reader_M_AXI_AWADDR;
  wire [1:0]ram_reader_M_AXI_AWBURST;
  wire [3:0]ram_reader_M_AXI_AWCACHE;
  wire [4:0]ram_reader_M_AXI_AWID;
  wire [7:0]ram_reader_M_AXI_AWLEN;
  wire ram_reader_M_AXI_AWLOCK;
  wire [2:0]ram_reader_M_AXI_AWPROT;
  wire [3:0]ram_reader_M_AXI_AWQOS;
  wire ram_reader_M_AXI_AWREADY;
  wire [2:0]ram_reader_M_AXI_AWSIZE;
  wire ram_reader_M_AXI_AWVALID;
  wire ram_reader_M_AXI_BREADY;
  wire [1:0]ram_reader_M_AXI_BRESP;
  wire ram_reader_M_AXI_BVALID;
  wire [511:0]ram_reader_M_AXI_RDATA;
  wire ram_reader_M_AXI_RLAST;
  wire ram_reader_M_AXI_RREADY;
  wire [1:0]ram_reader_M_AXI_RRESP;
  wire ram_reader_M_AXI_RVALID;
  wire [511:0]ram_reader_M_AXI_WDATA;
  wire ram_reader_M_AXI_WLAST;
  wire ram_reader_M_AXI_WREADY;
  wire [63:0]ram_reader_M_AXI_WSTRB;
  wire ram_reader_M_AXI_WVALID;
  wire resetn_1;
  wire start_ram_reader_1;
  wire [63:0]stream_to_ram_M_AXI_ARADDR;
  wire [1:0]stream_to_ram_M_AXI_ARBURST;
  wire [3:0]stream_to_ram_M_AXI_ARCACHE;
  wire [4:0]stream_to_ram_M_AXI_ARID;
  wire [7:0]stream_to_ram_M_AXI_ARLEN;
  wire stream_to_ram_M_AXI_ARLOCK;
  wire [2:0]stream_to_ram_M_AXI_ARPROT;
  wire [3:0]stream_to_ram_M_AXI_ARQOS;
  wire stream_to_ram_M_AXI_ARREADY;
  wire [2:0]stream_to_ram_M_AXI_ARSIZE;
  wire stream_to_ram_M_AXI_ARVALID;
  wire [63:0]stream_to_ram_M_AXI_AWADDR;
  wire [1:0]stream_to_ram_M_AXI_AWBURST;
  wire [3:0]stream_to_ram_M_AXI_AWCACHE;
  wire [4:0]stream_to_ram_M_AXI_AWID;
  wire [7:0]stream_to_ram_M_AXI_AWLEN;
  wire stream_to_ram_M_AXI_AWLOCK;
  wire [2:0]stream_to_ram_M_AXI_AWPROT;
  wire [3:0]stream_to_ram_M_AXI_AWQOS;
  wire stream_to_ram_M_AXI_AWREADY;
  wire [2:0]stream_to_ram_M_AXI_AWSIZE;
  wire stream_to_ram_M_AXI_AWVALID;
  wire stream_to_ram_M_AXI_BREADY;
  wire [1:0]stream_to_ram_M_AXI_BRESP;
  wire stream_to_ram_M_AXI_BVALID;
  wire [511:0]stream_to_ram_M_AXI_RDATA;
  wire stream_to_ram_M_AXI_RLAST;
  wire stream_to_ram_M_AXI_RREADY;
  wire [1:0]stream_to_ram_M_AXI_RRESP;
  wire stream_to_ram_M_AXI_RVALID;
  wire [511:0]stream_to_ram_M_AXI_WDATA;
  wire stream_to_ram_M_AXI_WLAST;
  wire stream_to_ram_M_AXI_WREADY;
  wire [63:0]stream_to_ram_M_AXI_WSTRB;
  wire stream_to_ram_M_AXI_WVALID;
  wire [7:0]stream_to_ram_cycles_in_partial_block;
  wire stream_to_ram_done;
  wire [31:0]stream_to_ram_full_blocks;
  wire stream_to_ram_has_data;
  wire [63:0]stream_to_ram_hwm;
  wire stream_to_ram_overflow;
  wire [0:0]switch_ctrl_0_inflow_q;

  assign AXIS_IN_tready = axis_switch_axis_out1_TREADY;
  assign AXIS_OUT_tdata[511:0] = ram_reader_AXIS_OUT_TDATA;
  assign AXIS_OUT_tvalid = ram_reader_AXIS_OUT_TVALID;
  assign axis_switch_axis_out1_TDATA = AXIS_IN_tdata[511:0];
  assign axis_switch_axis_out1_TVALID = AXIS_IN_tvalid;
  assign ddr4_act_n = ddr_ddr4_ACT_N;
  assign ddr4_adr[16:0] = ddr_ddr4_ADR;
  assign ddr4_ba[1:0] = ddr_ddr4_BA;
  assign ddr4_bg[1:0] = ddr_ddr4_BG;
  assign ddr4_ck_c[0] = ddr_ddr4_CK_C;
  assign ddr4_ck_t[0] = ddr_ddr4_CK_T;
  assign ddr4_cke[0] = ddr_ddr4_CKE;
  assign ddr4_clk_1_CLK_N = ddr4_clk_clk_n;
  assign ddr4_clk_1_CLK_P = ddr4_clk_clk_p;
  assign ddr4_cs_n[0] = ddr_ddr4_CS_N;
  assign ddr4_odt[0] = ddr_ddr4_ODT;
  assign ddr4_reset_n = ddr_ddr4_RESET_N;
  assign ddr_init_calib_complete = ddr_c0_init_calib_complete;
  assign has_data = stream_to_ram_has_data;
  assign high_water_mark[63:0] = stream_to_ram_hwm;
  assign inflow_done = stream_to_ram_done;
  assign overflow = stream_to_ram_overflow;
  assign pcie_bridge_axi_aclk = clk;
  assign ram_reader_AXIS_OUT_TREADY = AXIS_OUT_tready;
  assign ram_reader_idle = ram_reader_0_idle;
  assign resetn_1 = resetn;
  assign start_ram_reader_1 = start_ram_reader;
  assign switch_ctrl_0_inflow_q = inflow_q[0];
  ddr_imp_1M8HQWY ddr
       (.RD_AXI_araddr(ram_reader_M_AXI_ARADDR),
        .RD_AXI_arburst(ram_reader_M_AXI_ARBURST),
        .RD_AXI_arcache(ram_reader_M_AXI_ARCACHE),
        .RD_AXI_arid(ram_reader_M_AXI_ARID),
        .RD_AXI_arlen(ram_reader_M_AXI_ARLEN),
        .RD_AXI_arlock(ram_reader_M_AXI_ARLOCK),
        .RD_AXI_arprot(ram_reader_M_AXI_ARPROT),
        .RD_AXI_arqos(ram_reader_M_AXI_ARQOS),
        .RD_AXI_arready(ram_reader_M_AXI_ARREADY),
        .RD_AXI_arsize(ram_reader_M_AXI_ARSIZE),
        .RD_AXI_arvalid(ram_reader_M_AXI_ARVALID),
        .RD_AXI_awaddr(ram_reader_M_AXI_AWADDR),
        .RD_AXI_awburst(ram_reader_M_AXI_AWBURST),
        .RD_AXI_awcache(ram_reader_M_AXI_AWCACHE),
        .RD_AXI_awid(ram_reader_M_AXI_AWID),
        .RD_AXI_awlen(ram_reader_M_AXI_AWLEN),
        .RD_AXI_awlock(ram_reader_M_AXI_AWLOCK),
        .RD_AXI_awprot(ram_reader_M_AXI_AWPROT),
        .RD_AXI_awqos(ram_reader_M_AXI_AWQOS),
        .RD_AXI_awready(ram_reader_M_AXI_AWREADY),
        .RD_AXI_awsize(ram_reader_M_AXI_AWSIZE),
        .RD_AXI_awvalid(ram_reader_M_AXI_AWVALID),
        .RD_AXI_bready(ram_reader_M_AXI_BREADY),
        .RD_AXI_bresp(ram_reader_M_AXI_BRESP),
        .RD_AXI_bvalid(ram_reader_M_AXI_BVALID),
        .RD_AXI_rdata(ram_reader_M_AXI_RDATA),
        .RD_AXI_rlast(ram_reader_M_AXI_RLAST),
        .RD_AXI_rready(ram_reader_M_AXI_RREADY),
        .RD_AXI_rresp(ram_reader_M_AXI_RRESP),
        .RD_AXI_rvalid(ram_reader_M_AXI_RVALID),
        .RD_AXI_wdata(ram_reader_M_AXI_WDATA),
        .RD_AXI_wlast(ram_reader_M_AXI_WLAST),
        .RD_AXI_wready(ram_reader_M_AXI_WREADY),
        .RD_AXI_wstrb(ram_reader_M_AXI_WSTRB),
        .RD_AXI_wvalid(ram_reader_M_AXI_WVALID),
        .WR_AXI_araddr(stream_to_ram_M_AXI_ARADDR),
        .WR_AXI_arburst(stream_to_ram_M_AXI_ARBURST),
        .WR_AXI_arcache(stream_to_ram_M_AXI_ARCACHE),
        .WR_AXI_arid(stream_to_ram_M_AXI_ARID),
        .WR_AXI_arlen(stream_to_ram_M_AXI_ARLEN),
        .WR_AXI_arlock(stream_to_ram_M_AXI_ARLOCK),
        .WR_AXI_arprot(stream_to_ram_M_AXI_ARPROT),
        .WR_AXI_arqos(stream_to_ram_M_AXI_ARQOS),
        .WR_AXI_arready(stream_to_ram_M_AXI_ARREADY),
        .WR_AXI_arsize(stream_to_ram_M_AXI_ARSIZE),
        .WR_AXI_arvalid(stream_to_ram_M_AXI_ARVALID),
        .WR_AXI_awaddr(stream_to_ram_M_AXI_AWADDR),
        .WR_AXI_awburst(stream_to_ram_M_AXI_AWBURST),
        .WR_AXI_awcache(stream_to_ram_M_AXI_AWCACHE),
        .WR_AXI_awid(stream_to_ram_M_AXI_AWID),
        .WR_AXI_awlen(stream_to_ram_M_AXI_AWLEN),
        .WR_AXI_awlock(stream_to_ram_M_AXI_AWLOCK),
        .WR_AXI_awprot(stream_to_ram_M_AXI_AWPROT),
        .WR_AXI_awqos(stream_to_ram_M_AXI_AWQOS),
        .WR_AXI_awready(stream_to_ram_M_AXI_AWREADY),
        .WR_AXI_awsize(stream_to_ram_M_AXI_AWSIZE),
        .WR_AXI_awvalid(stream_to_ram_M_AXI_AWVALID),
        .WR_AXI_bready(stream_to_ram_M_AXI_BREADY),
        .WR_AXI_bresp(stream_to_ram_M_AXI_BRESP),
        .WR_AXI_bvalid(stream_to_ram_M_AXI_BVALID),
        .WR_AXI_rdata(stream_to_ram_M_AXI_RDATA),
        .WR_AXI_rlast(stream_to_ram_M_AXI_RLAST),
        .WR_AXI_rready(stream_to_ram_M_AXI_RREADY),
        .WR_AXI_rresp(stream_to_ram_M_AXI_RRESP),
        .WR_AXI_rvalid(stream_to_ram_M_AXI_RVALID),
        .WR_AXI_wdata(stream_to_ram_M_AXI_WDATA),
        .WR_AXI_wlast(stream_to_ram_M_AXI_WLAST),
        .WR_AXI_wready(stream_to_ram_M_AXI_WREADY),
        .WR_AXI_wstrb(stream_to_ram_M_AXI_WSTRB),
        .WR_AXI_wvalid(stream_to_ram_M_AXI_WVALID),
        .aclk(pcie_bridge_axi_aclk),
        .aresetn(resetn_1),
        .c0_init_calib_complete(ddr_c0_init_calib_complete),
        .ddr4_act_n(ddr_ddr4_ACT_N),
        .ddr4_adr(ddr_ddr4_ADR),
        .ddr4_ba(ddr_ddr4_BA),
        .ddr4_bg(ddr_ddr4_BG),
        .ddr4_ck_c(ddr_ddr4_CK_C),
        .ddr4_ck_t(ddr_ddr4_CK_T),
        .ddr4_cke(ddr_ddr4_CKE),
        .ddr4_clk_clk_n(ddr4_clk_1_CLK_N),
        .ddr4_clk_clk_p(ddr4_clk_1_CLK_P),
        .ddr4_cs_n(ddr_ddr4_CS_N),
        .ddr4_dm_n(ddr4_dm_n[7:0]),
        .ddr4_dq(ddr4_dq[63:0]),
        .ddr4_dqs_c(ddr4_dqs_c[7:0]),
        .ddr4_dqs_t(ddr4_dqs_t[7:0]),
        .ddr4_odt(ddr_ddr4_ODT),
        .ddr4_reset_n(ddr_ddr4_RESET_N));
  top_level_ram_reader_0_1 ram_reader
       (.AXIS_OUT_TDATA(ram_reader_AXIS_OUT_TDATA),
        .AXIS_OUT_TREADY(ram_reader_AXIS_OUT_TREADY),
        .AXIS_OUT_TVALID(ram_reader_AXIS_OUT_TVALID),
        .M_AXI_ARADDR(ram_reader_M_AXI_ARADDR),
        .M_AXI_ARBURST(ram_reader_M_AXI_ARBURST),
        .M_AXI_ARCACHE(ram_reader_M_AXI_ARCACHE),
        .M_AXI_ARID(ram_reader_M_AXI_ARID),
        .M_AXI_ARLEN(ram_reader_M_AXI_ARLEN),
        .M_AXI_ARLOCK(ram_reader_M_AXI_ARLOCK),
        .M_AXI_ARPROT(ram_reader_M_AXI_ARPROT),
        .M_AXI_ARQOS(ram_reader_M_AXI_ARQOS),
        .M_AXI_ARREADY(ram_reader_M_AXI_ARREADY),
        .M_AXI_ARSIZE(ram_reader_M_AXI_ARSIZE),
        .M_AXI_ARVALID(ram_reader_M_AXI_ARVALID),
        .M_AXI_AWADDR(ram_reader_M_AXI_AWADDR),
        .M_AXI_AWBURST(ram_reader_M_AXI_AWBURST),
        .M_AXI_AWCACHE(ram_reader_M_AXI_AWCACHE),
        .M_AXI_AWID(ram_reader_M_AXI_AWID),
        .M_AXI_AWLEN(ram_reader_M_AXI_AWLEN),
        .M_AXI_AWLOCK(ram_reader_M_AXI_AWLOCK),
        .M_AXI_AWPROT(ram_reader_M_AXI_AWPROT),
        .M_AXI_AWQOS(ram_reader_M_AXI_AWQOS),
        .M_AXI_AWREADY(ram_reader_M_AXI_AWREADY),
        .M_AXI_AWSIZE(ram_reader_M_AXI_AWSIZE),
        .M_AXI_AWVALID(ram_reader_M_AXI_AWVALID),
        .M_AXI_BREADY(ram_reader_M_AXI_BREADY),
        .M_AXI_BRESP(ram_reader_M_AXI_BRESP),
        .M_AXI_BVALID(ram_reader_M_AXI_BVALID),
        .M_AXI_RDATA(ram_reader_M_AXI_RDATA),
        .M_AXI_RLAST(ram_reader_M_AXI_RLAST),
        .M_AXI_RREADY(ram_reader_M_AXI_RREADY),
        .M_AXI_RRESP(ram_reader_M_AXI_RRESP),
        .M_AXI_RVALID(ram_reader_M_AXI_RVALID),
        .M_AXI_WDATA(ram_reader_M_AXI_WDATA),
        .M_AXI_WLAST(ram_reader_M_AXI_WLAST),
        .M_AXI_WREADY(ram_reader_M_AXI_WREADY),
        .M_AXI_WSTRB(ram_reader_M_AXI_WSTRB),
        .M_AXI_WVALID(ram_reader_M_AXI_WVALID),
        .clk(pcie_bridge_axi_aclk),
        .full_blocks(stream_to_ram_full_blocks),
        .idle(ram_reader_0_idle),
        .partial_block_cycles(stream_to_ram_cycles_in_partial_block),
        .resetn(resetn_1),
        .start(start_ram_reader_1));
  top_level_stream_to_ram_0_1 stream_to_ram
       (.AXIS_IN_TDATA(axis_switch_axis_out1_TDATA),
        .AXIS_IN_TREADY(axis_switch_axis_out1_TREADY),
        .AXIS_IN_TVALID(axis_switch_axis_out1_TVALID),
        .M_AXI_ARADDR(stream_to_ram_M_AXI_ARADDR),
        .M_AXI_ARBURST(stream_to_ram_M_AXI_ARBURST),
        .M_AXI_ARCACHE(stream_to_ram_M_AXI_ARCACHE),
        .M_AXI_ARID(stream_to_ram_M_AXI_ARID),
        .M_AXI_ARLEN(stream_to_ram_M_AXI_ARLEN),
        .M_AXI_ARLOCK(stream_to_ram_M_AXI_ARLOCK),
        .M_AXI_ARPROT(stream_to_ram_M_AXI_ARPROT),
        .M_AXI_ARQOS(stream_to_ram_M_AXI_ARQOS),
        .M_AXI_ARREADY(stream_to_ram_M_AXI_ARREADY),
        .M_AXI_ARSIZE(stream_to_ram_M_AXI_ARSIZE),
        .M_AXI_ARVALID(stream_to_ram_M_AXI_ARVALID),
        .M_AXI_AWADDR(stream_to_ram_M_AXI_AWADDR),
        .M_AXI_AWBURST(stream_to_ram_M_AXI_AWBURST),
        .M_AXI_AWCACHE(stream_to_ram_M_AXI_AWCACHE),
        .M_AXI_AWID(stream_to_ram_M_AXI_AWID),
        .M_AXI_AWLEN(stream_to_ram_M_AXI_AWLEN),
        .M_AXI_AWLOCK(stream_to_ram_M_AXI_AWLOCK),
        .M_AXI_AWPROT(stream_to_ram_M_AXI_AWPROT),
        .M_AXI_AWQOS(stream_to_ram_M_AXI_AWQOS),
        .M_AXI_AWREADY(stream_to_ram_M_AXI_AWREADY),
        .M_AXI_AWSIZE(stream_to_ram_M_AXI_AWSIZE),
        .M_AXI_AWVALID(stream_to_ram_M_AXI_AWVALID),
        .M_AXI_BREADY(stream_to_ram_M_AXI_BREADY),
        .M_AXI_BRESP(stream_to_ram_M_AXI_BRESP),
        .M_AXI_BVALID(stream_to_ram_M_AXI_BVALID),
        .M_AXI_RDATA(stream_to_ram_M_AXI_RDATA),
        .M_AXI_RLAST(stream_to_ram_M_AXI_RLAST),
        .M_AXI_RREADY(stream_to_ram_M_AXI_RREADY),
        .M_AXI_RRESP(stream_to_ram_M_AXI_RRESP),
        .M_AXI_RVALID(stream_to_ram_M_AXI_RVALID),
        .M_AXI_WDATA(stream_to_ram_M_AXI_WDATA),
        .M_AXI_WLAST(stream_to_ram_M_AXI_WLAST),
        .M_AXI_WREADY(stream_to_ram_M_AXI_WREADY),
        .M_AXI_WSTRB(stream_to_ram_M_AXI_WSTRB),
        .M_AXI_WVALID(stream_to_ram_M_AXI_WVALID),
        .clk(pcie_bridge_axi_aclk),
        .cycles_in_partial_block(stream_to_ram_cycles_in_partial_block),
        .done(stream_to_ram_done),
        .full_blocks(stream_to_ram_full_blocks),
        .has_data(stream_to_ram_has_data),
        .hwm(stream_to_ram_hwm),
        .inflow_q(switch_ctrl_0_inflow_q),
        .overflow(stream_to_ram_overflow),
        .resetn(resetn_1));
endmodule

module ddr_imp_1M8HQWY
   (RD_AXI_araddr,
    RD_AXI_arburst,
    RD_AXI_arcache,
    RD_AXI_arid,
    RD_AXI_arlen,
    RD_AXI_arlock,
    RD_AXI_arprot,
    RD_AXI_arqos,
    RD_AXI_arready,
    RD_AXI_arsize,
    RD_AXI_arvalid,
    RD_AXI_awaddr,
    RD_AXI_awburst,
    RD_AXI_awcache,
    RD_AXI_awid,
    RD_AXI_awlen,
    RD_AXI_awlock,
    RD_AXI_awprot,
    RD_AXI_awqos,
    RD_AXI_awready,
    RD_AXI_awsize,
    RD_AXI_awvalid,
    RD_AXI_bready,
    RD_AXI_bresp,
    RD_AXI_bvalid,
    RD_AXI_rdata,
    RD_AXI_rlast,
    RD_AXI_rready,
    RD_AXI_rresp,
    RD_AXI_rvalid,
    RD_AXI_wdata,
    RD_AXI_wlast,
    RD_AXI_wready,
    RD_AXI_wstrb,
    RD_AXI_wvalid,
    WR_AXI_araddr,
    WR_AXI_arburst,
    WR_AXI_arcache,
    WR_AXI_arid,
    WR_AXI_arlen,
    WR_AXI_arlock,
    WR_AXI_arprot,
    WR_AXI_arqos,
    WR_AXI_arready,
    WR_AXI_arsize,
    WR_AXI_arvalid,
    WR_AXI_awaddr,
    WR_AXI_awburst,
    WR_AXI_awcache,
    WR_AXI_awid,
    WR_AXI_awlen,
    WR_AXI_awlock,
    WR_AXI_awprot,
    WR_AXI_awqos,
    WR_AXI_awready,
    WR_AXI_awsize,
    WR_AXI_awvalid,
    WR_AXI_bready,
    WR_AXI_bresp,
    WR_AXI_bvalid,
    WR_AXI_rdata,
    WR_AXI_rlast,
    WR_AXI_rready,
    WR_AXI_rresp,
    WR_AXI_rvalid,
    WR_AXI_wdata,
    WR_AXI_wlast,
    WR_AXI_wready,
    WR_AXI_wstrb,
    WR_AXI_wvalid,
    aclk,
    aresetn,
    c0_init_calib_complete,
    ddr4_act_n,
    ddr4_adr,
    ddr4_ba,
    ddr4_bg,
    ddr4_ck_c,
    ddr4_ck_t,
    ddr4_cke,
    ddr4_clk_clk_n,
    ddr4_clk_clk_p,
    ddr4_cs_n,
    ddr4_dm_n,
    ddr4_dq,
    ddr4_dqs_c,
    ddr4_dqs_t,
    ddr4_odt,
    ddr4_reset_n);
  input [63:0]RD_AXI_araddr;
  input [1:0]RD_AXI_arburst;
  input [3:0]RD_AXI_arcache;
  input [4:0]RD_AXI_arid;
  input [7:0]RD_AXI_arlen;
  input RD_AXI_arlock;
  input [2:0]RD_AXI_arprot;
  input [3:0]RD_AXI_arqos;
  output RD_AXI_arready;
  input [2:0]RD_AXI_arsize;
  input RD_AXI_arvalid;
  input [63:0]RD_AXI_awaddr;
  input [1:0]RD_AXI_awburst;
  input [3:0]RD_AXI_awcache;
  input [4:0]RD_AXI_awid;
  input [7:0]RD_AXI_awlen;
  input RD_AXI_awlock;
  input [2:0]RD_AXI_awprot;
  input [3:0]RD_AXI_awqos;
  output RD_AXI_awready;
  input [2:0]RD_AXI_awsize;
  input RD_AXI_awvalid;
  input RD_AXI_bready;
  output [1:0]RD_AXI_bresp;
  output RD_AXI_bvalid;
  output [511:0]RD_AXI_rdata;
  output RD_AXI_rlast;
  input RD_AXI_rready;
  output [1:0]RD_AXI_rresp;
  output RD_AXI_rvalid;
  input [511:0]RD_AXI_wdata;
  input RD_AXI_wlast;
  output RD_AXI_wready;
  input [63:0]RD_AXI_wstrb;
  input RD_AXI_wvalid;
  input [63:0]WR_AXI_araddr;
  input [1:0]WR_AXI_arburst;
  input [3:0]WR_AXI_arcache;
  input [4:0]WR_AXI_arid;
  input [7:0]WR_AXI_arlen;
  input WR_AXI_arlock;
  input [2:0]WR_AXI_arprot;
  input [3:0]WR_AXI_arqos;
  output WR_AXI_arready;
  input [2:0]WR_AXI_arsize;
  input WR_AXI_arvalid;
  input [63:0]WR_AXI_awaddr;
  input [1:0]WR_AXI_awburst;
  input [3:0]WR_AXI_awcache;
  input [4:0]WR_AXI_awid;
  input [7:0]WR_AXI_awlen;
  input WR_AXI_awlock;
  input [2:0]WR_AXI_awprot;
  input [3:0]WR_AXI_awqos;
  output WR_AXI_awready;
  input [2:0]WR_AXI_awsize;
  input WR_AXI_awvalid;
  input WR_AXI_bready;
  output [1:0]WR_AXI_bresp;
  output WR_AXI_bvalid;
  output [511:0]WR_AXI_rdata;
  output WR_AXI_rlast;
  input WR_AXI_rready;
  output [1:0]WR_AXI_rresp;
  output WR_AXI_rvalid;
  input [511:0]WR_AXI_wdata;
  input WR_AXI_wlast;
  output WR_AXI_wready;
  input [63:0]WR_AXI_wstrb;
  input WR_AXI_wvalid;
  input aclk;
  input aresetn;
  output c0_init_calib_complete;
  output ddr4_act_n;
  output [16:0]ddr4_adr;
  output [1:0]ddr4_ba;
  output [1:0]ddr4_bg;
  output [0:0]ddr4_ck_c;
  output [0:0]ddr4_ck_t;
  output [0:0]ddr4_cke;
  input ddr4_clk_clk_n;
  input ddr4_clk_clk_p;
  output [0:0]ddr4_cs_n;
  inout [7:0]ddr4_dm_n;
  inout [63:0]ddr4_dq;
  inout [7:0]ddr4_dqs_c;
  inout [7:0]ddr4_dqs_t;
  output [0:0]ddr4_odt;
  output ddr4_reset_n;

  wire [63:0]RD_AXI_1_ARADDR;
  wire [1:0]RD_AXI_1_ARBURST;
  wire [3:0]RD_AXI_1_ARCACHE;
  wire [4:0]RD_AXI_1_ARID;
  wire [7:0]RD_AXI_1_ARLEN;
  wire RD_AXI_1_ARLOCK;
  wire [2:0]RD_AXI_1_ARPROT;
  wire [3:0]RD_AXI_1_ARQOS;
  wire [1:1]RD_AXI_1_ARREADY;
  wire [2:0]RD_AXI_1_ARSIZE;
  wire RD_AXI_1_ARVALID;
  wire [63:0]RD_AXI_1_AWADDR;
  wire [1:0]RD_AXI_1_AWBURST;
  wire [3:0]RD_AXI_1_AWCACHE;
  wire [4:0]RD_AXI_1_AWID;
  wire [7:0]RD_AXI_1_AWLEN;
  wire RD_AXI_1_AWLOCK;
  wire [2:0]RD_AXI_1_AWPROT;
  wire [3:0]RD_AXI_1_AWQOS;
  wire [1:1]RD_AXI_1_AWREADY;
  wire [2:0]RD_AXI_1_AWSIZE;
  wire RD_AXI_1_AWVALID;
  wire RD_AXI_1_BREADY;
  wire [3:2]RD_AXI_1_BRESP;
  wire [1:1]RD_AXI_1_BVALID;
  wire [1023:512]RD_AXI_1_RDATA;
  wire [1:1]RD_AXI_1_RLAST;
  wire RD_AXI_1_RREADY;
  wire [3:2]RD_AXI_1_RRESP;
  wire [1:1]RD_AXI_1_RVALID;
  wire [511:0]RD_AXI_1_WDATA;
  wire RD_AXI_1_WLAST;
  wire [1:1]RD_AXI_1_WREADY;
  wire [63:0]RD_AXI_1_WSTRB;
  wire RD_AXI_1_WVALID;
  wire [63:0]WR_AXI_1_ARADDR;
  wire [1:0]WR_AXI_1_ARBURST;
  wire [3:0]WR_AXI_1_ARCACHE;
  wire [4:0]WR_AXI_1_ARID;
  wire [7:0]WR_AXI_1_ARLEN;
  wire WR_AXI_1_ARLOCK;
  wire [2:0]WR_AXI_1_ARPROT;
  wire [3:0]WR_AXI_1_ARQOS;
  wire [0:0]WR_AXI_1_ARREADY;
  wire [2:0]WR_AXI_1_ARSIZE;
  wire WR_AXI_1_ARVALID;
  wire [63:0]WR_AXI_1_AWADDR;
  wire [1:0]WR_AXI_1_AWBURST;
  wire [3:0]WR_AXI_1_AWCACHE;
  wire [4:0]WR_AXI_1_AWID;
  wire [7:0]WR_AXI_1_AWLEN;
  wire WR_AXI_1_AWLOCK;
  wire [2:0]WR_AXI_1_AWPROT;
  wire [3:0]WR_AXI_1_AWQOS;
  wire [0:0]WR_AXI_1_AWREADY;
  wire [2:0]WR_AXI_1_AWSIZE;
  wire WR_AXI_1_AWVALID;
  wire WR_AXI_1_BREADY;
  wire [1:0]WR_AXI_1_BRESP;
  wire [0:0]WR_AXI_1_BVALID;
  wire [511:0]WR_AXI_1_RDATA;
  wire [0:0]WR_AXI_1_RLAST;
  wire WR_AXI_1_RREADY;
  wire [1:0]WR_AXI_1_RRESP;
  wire [0:0]WR_AXI_1_RVALID;
  wire [511:0]WR_AXI_1_WDATA;
  wire WR_AXI_1_WLAST;
  wire [0:0]WR_AXI_1_WREADY;
  wire [63:0]WR_AXI_1_WSTRB;
  wire WR_AXI_1_WVALID;
  wire aclk_1;
  wire aresetn_1;
  wire [31:0]axi_clock_converter_M_AXI_ARADDR;
  wire [1:0]axi_clock_converter_M_AXI_ARBURST;
  wire [3:0]axi_clock_converter_M_AXI_ARCACHE;
  wire [5:0]axi_clock_converter_M_AXI_ARID;
  wire [7:0]axi_clock_converter_M_AXI_ARLEN;
  wire [0:0]axi_clock_converter_M_AXI_ARLOCK;
  wire [2:0]axi_clock_converter_M_AXI_ARPROT;
  wire [3:0]axi_clock_converter_M_AXI_ARQOS;
  wire axi_clock_converter_M_AXI_ARREADY;
  wire [2:0]axi_clock_converter_M_AXI_ARSIZE;
  wire axi_clock_converter_M_AXI_ARVALID;
  wire [31:0]axi_clock_converter_M_AXI_AWADDR;
  wire [1:0]axi_clock_converter_M_AXI_AWBURST;
  wire [3:0]axi_clock_converter_M_AXI_AWCACHE;
  wire [5:0]axi_clock_converter_M_AXI_AWID;
  wire [7:0]axi_clock_converter_M_AXI_AWLEN;
  wire [0:0]axi_clock_converter_M_AXI_AWLOCK;
  wire [2:0]axi_clock_converter_M_AXI_AWPROT;
  wire [3:0]axi_clock_converter_M_AXI_AWQOS;
  wire axi_clock_converter_M_AXI_AWREADY;
  wire [2:0]axi_clock_converter_M_AXI_AWSIZE;
  wire axi_clock_converter_M_AXI_AWVALID;
  wire [5:0]axi_clock_converter_M_AXI_BID;
  wire axi_clock_converter_M_AXI_BREADY;
  wire [1:0]axi_clock_converter_M_AXI_BRESP;
  wire axi_clock_converter_M_AXI_BVALID;
  wire [511:0]axi_clock_converter_M_AXI_RDATA;
  wire [5:0]axi_clock_converter_M_AXI_RID;
  wire axi_clock_converter_M_AXI_RLAST;
  wire axi_clock_converter_M_AXI_RREADY;
  wire [1:0]axi_clock_converter_M_AXI_RRESP;
  wire axi_clock_converter_M_AXI_RVALID;
  wire [511:0]axi_clock_converter_M_AXI_WDATA;
  wire axi_clock_converter_M_AXI_WLAST;
  wire axi_clock_converter_M_AXI_WREADY;
  wire [63:0]axi_clock_converter_M_AXI_WSTRB;
  wire axi_clock_converter_M_AXI_WVALID;
  wire [63:0]axi_crossbar_M00_AXI_ARADDR;
  wire [1:0]axi_crossbar_M00_AXI_ARBURST;
  wire [3:0]axi_crossbar_M00_AXI_ARCACHE;
  wire [5:0]axi_crossbar_M00_AXI_ARID;
  wire [7:0]axi_crossbar_M00_AXI_ARLEN;
  wire [0:0]axi_crossbar_M00_AXI_ARLOCK;
  wire [2:0]axi_crossbar_M00_AXI_ARPROT;
  wire [3:0]axi_crossbar_M00_AXI_ARQOS;
  wire axi_crossbar_M00_AXI_ARREADY;
  wire [3:0]axi_crossbar_M00_AXI_ARREGION;
  wire [2:0]axi_crossbar_M00_AXI_ARSIZE;
  wire [0:0]axi_crossbar_M00_AXI_ARVALID;
  wire [63:0]axi_crossbar_M00_AXI_AWADDR;
  wire [1:0]axi_crossbar_M00_AXI_AWBURST;
  wire [3:0]axi_crossbar_M00_AXI_AWCACHE;
  wire [5:0]axi_crossbar_M00_AXI_AWID;
  wire [7:0]axi_crossbar_M00_AXI_AWLEN;
  wire [0:0]axi_crossbar_M00_AXI_AWLOCK;
  wire [2:0]axi_crossbar_M00_AXI_AWPROT;
  wire [3:0]axi_crossbar_M00_AXI_AWQOS;
  wire axi_crossbar_M00_AXI_AWREADY;
  wire [3:0]axi_crossbar_M00_AXI_AWREGION;
  wire [2:0]axi_crossbar_M00_AXI_AWSIZE;
  wire [0:0]axi_crossbar_M00_AXI_AWVALID;
  wire [5:0]axi_crossbar_M00_AXI_BID;
  wire [0:0]axi_crossbar_M00_AXI_BREADY;
  wire [1:0]axi_crossbar_M00_AXI_BRESP;
  wire axi_crossbar_M00_AXI_BVALID;
  wire [511:0]axi_crossbar_M00_AXI_RDATA;
  wire [5:0]axi_crossbar_M00_AXI_RID;
  wire axi_crossbar_M00_AXI_RLAST;
  wire [0:0]axi_crossbar_M00_AXI_RREADY;
  wire [1:0]axi_crossbar_M00_AXI_RRESP;
  wire axi_crossbar_M00_AXI_RVALID;
  wire [511:0]axi_crossbar_M00_AXI_WDATA;
  wire [0:0]axi_crossbar_M00_AXI_WLAST;
  wire axi_crossbar_M00_AXI_WREADY;
  wire [63:0]axi_crossbar_M00_AXI_WSTRB;
  wire [0:0]axi_crossbar_M00_AXI_WVALID;
  wire ddr4_C0_DDR4_ACT_N;
  wire [16:0]ddr4_C0_DDR4_ADR;
  wire [1:0]ddr4_C0_DDR4_BA;
  wire [1:0]ddr4_C0_DDR4_BG;
  wire [0:0]ddr4_C0_DDR4_CKE;
  wire [0:0]ddr4_C0_DDR4_CK_C;
  wire [0:0]ddr4_C0_DDR4_CK_T;
  wire [0:0]ddr4_C0_DDR4_CS_N;
  wire [7:0]ddr4_C0_DDR4_DM_N;
  wire [63:0]ddr4_C0_DDR4_DQ;
  wire [7:0]ddr4_C0_DDR4_DQS_C;
  wire [7:0]ddr4_C0_DDR4_DQS_T;
  wire [0:0]ddr4_C0_DDR4_ODT;
  wire ddr4_C0_DDR4_RESET_N;
  wire ddr4_c0_ddr4_ui_clk;
  wire ddr4_c0_ddr4_ui_clk_sync_rst;
  wire ddr4_c0_init_calib_complete;
  wire ddr4_clk_1_CLK_N;
  wire ddr4_clk_1_CLK_P;
  wire ddr_widget_0_ddr_resetn_out;
  wire ddr_widget_0_zero;

  assign RD_AXI_1_ARADDR = RD_AXI_araddr[63:0];
  assign RD_AXI_1_ARBURST = RD_AXI_arburst[1:0];
  assign RD_AXI_1_ARCACHE = RD_AXI_arcache[3:0];
  assign RD_AXI_1_ARID = RD_AXI_arid[4:0];
  assign RD_AXI_1_ARLEN = RD_AXI_arlen[7:0];
  assign RD_AXI_1_ARLOCK = RD_AXI_arlock;
  assign RD_AXI_1_ARPROT = RD_AXI_arprot[2:0];
  assign RD_AXI_1_ARQOS = RD_AXI_arqos[3:0];
  assign RD_AXI_1_ARSIZE = RD_AXI_arsize[2:0];
  assign RD_AXI_1_ARVALID = RD_AXI_arvalid;
  assign RD_AXI_1_AWADDR = RD_AXI_awaddr[63:0];
  assign RD_AXI_1_AWBURST = RD_AXI_awburst[1:0];
  assign RD_AXI_1_AWCACHE = RD_AXI_awcache[3:0];
  assign RD_AXI_1_AWID = RD_AXI_awid[4:0];
  assign RD_AXI_1_AWLEN = RD_AXI_awlen[7:0];
  assign RD_AXI_1_AWLOCK = RD_AXI_awlock;
  assign RD_AXI_1_AWPROT = RD_AXI_awprot[2:0];
  assign RD_AXI_1_AWQOS = RD_AXI_awqos[3:0];
  assign RD_AXI_1_AWSIZE = RD_AXI_awsize[2:0];
  assign RD_AXI_1_AWVALID = RD_AXI_awvalid;
  assign RD_AXI_1_BREADY = RD_AXI_bready;
  assign RD_AXI_1_RREADY = RD_AXI_rready;
  assign RD_AXI_1_WDATA = RD_AXI_wdata[511:0];
  assign RD_AXI_1_WLAST = RD_AXI_wlast;
  assign RD_AXI_1_WSTRB = RD_AXI_wstrb[63:0];
  assign RD_AXI_1_WVALID = RD_AXI_wvalid;
  assign RD_AXI_arready = RD_AXI_1_ARREADY;
  assign RD_AXI_awready = RD_AXI_1_AWREADY;
  assign RD_AXI_bresp[1:0] = RD_AXI_1_BRESP;
  assign RD_AXI_bvalid = RD_AXI_1_BVALID;
  assign RD_AXI_rdata[511:0] = RD_AXI_1_RDATA;
  assign RD_AXI_rlast = RD_AXI_1_RLAST;
  assign RD_AXI_rresp[1:0] = RD_AXI_1_RRESP;
  assign RD_AXI_rvalid = RD_AXI_1_RVALID;
  assign RD_AXI_wready = RD_AXI_1_WREADY;
  assign WR_AXI_1_ARADDR = WR_AXI_araddr[63:0];
  assign WR_AXI_1_ARBURST = WR_AXI_arburst[1:0];
  assign WR_AXI_1_ARCACHE = WR_AXI_arcache[3:0];
  assign WR_AXI_1_ARID = WR_AXI_arid[4:0];
  assign WR_AXI_1_ARLEN = WR_AXI_arlen[7:0];
  assign WR_AXI_1_ARLOCK = WR_AXI_arlock;
  assign WR_AXI_1_ARPROT = WR_AXI_arprot[2:0];
  assign WR_AXI_1_ARQOS = WR_AXI_arqos[3:0];
  assign WR_AXI_1_ARSIZE = WR_AXI_arsize[2:0];
  assign WR_AXI_1_ARVALID = WR_AXI_arvalid;
  assign WR_AXI_1_AWADDR = WR_AXI_awaddr[63:0];
  assign WR_AXI_1_AWBURST = WR_AXI_awburst[1:0];
  assign WR_AXI_1_AWCACHE = WR_AXI_awcache[3:0];
  assign WR_AXI_1_AWID = WR_AXI_awid[4:0];
  assign WR_AXI_1_AWLEN = WR_AXI_awlen[7:0];
  assign WR_AXI_1_AWLOCK = WR_AXI_awlock;
  assign WR_AXI_1_AWPROT = WR_AXI_awprot[2:0];
  assign WR_AXI_1_AWQOS = WR_AXI_awqos[3:0];
  assign WR_AXI_1_AWSIZE = WR_AXI_awsize[2:0];
  assign WR_AXI_1_AWVALID = WR_AXI_awvalid;
  assign WR_AXI_1_BREADY = WR_AXI_bready;
  assign WR_AXI_1_RREADY = WR_AXI_rready;
  assign WR_AXI_1_WDATA = WR_AXI_wdata[511:0];
  assign WR_AXI_1_WLAST = WR_AXI_wlast;
  assign WR_AXI_1_WSTRB = WR_AXI_wstrb[63:0];
  assign WR_AXI_1_WVALID = WR_AXI_wvalid;
  assign WR_AXI_arready = WR_AXI_1_ARREADY;
  assign WR_AXI_awready = WR_AXI_1_AWREADY;
  assign WR_AXI_bresp[1:0] = WR_AXI_1_BRESP;
  assign WR_AXI_bvalid = WR_AXI_1_BVALID;
  assign WR_AXI_rdata[511:0] = WR_AXI_1_RDATA;
  assign WR_AXI_rlast = WR_AXI_1_RLAST;
  assign WR_AXI_rresp[1:0] = WR_AXI_1_RRESP;
  assign WR_AXI_rvalid = WR_AXI_1_RVALID;
  assign WR_AXI_wready = WR_AXI_1_WREADY;
  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign c0_init_calib_complete = ddr4_c0_init_calib_complete;
  assign ddr4_act_n = ddr4_C0_DDR4_ACT_N;
  assign ddr4_adr[16:0] = ddr4_C0_DDR4_ADR;
  assign ddr4_ba[1:0] = ddr4_C0_DDR4_BA;
  assign ddr4_bg[1:0] = ddr4_C0_DDR4_BG;
  assign ddr4_ck_c[0] = ddr4_C0_DDR4_CK_C;
  assign ddr4_ck_t[0] = ddr4_C0_DDR4_CK_T;
  assign ddr4_cke[0] = ddr4_C0_DDR4_CKE;
  assign ddr4_clk_1_CLK_N = ddr4_clk_clk_n;
  assign ddr4_clk_1_CLK_P = ddr4_clk_clk_p;
  assign ddr4_cs_n[0] = ddr4_C0_DDR4_CS_N;
  assign ddr4_odt[0] = ddr4_C0_DDR4_ODT;
  assign ddr4_reset_n = ddr4_C0_DDR4_RESET_N;
  top_level_axi_clock_converter_1 axi_clock_converter
       (.m_axi_aclk(ddr4_c0_ddr4_ui_clk),
        .m_axi_araddr(axi_clock_converter_M_AXI_ARADDR),
        .m_axi_arburst(axi_clock_converter_M_AXI_ARBURST),
        .m_axi_arcache(axi_clock_converter_M_AXI_ARCACHE),
        .m_axi_aresetn(ddr_widget_0_ddr_resetn_out),
        .m_axi_arid(axi_clock_converter_M_AXI_ARID),
        .m_axi_arlen(axi_clock_converter_M_AXI_ARLEN),
        .m_axi_arlock(axi_clock_converter_M_AXI_ARLOCK),
        .m_axi_arprot(axi_clock_converter_M_AXI_ARPROT),
        .m_axi_arqos(axi_clock_converter_M_AXI_ARQOS),
        .m_axi_arready(axi_clock_converter_M_AXI_ARREADY),
        .m_axi_arsize(axi_clock_converter_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_clock_converter_M_AXI_ARVALID),
        .m_axi_awaddr(axi_clock_converter_M_AXI_AWADDR),
        .m_axi_awburst(axi_clock_converter_M_AXI_AWBURST),
        .m_axi_awcache(axi_clock_converter_M_AXI_AWCACHE),
        .m_axi_awid(axi_clock_converter_M_AXI_AWID),
        .m_axi_awlen(axi_clock_converter_M_AXI_AWLEN),
        .m_axi_awlock(axi_clock_converter_M_AXI_AWLOCK),
        .m_axi_awprot(axi_clock_converter_M_AXI_AWPROT),
        .m_axi_awqos(axi_clock_converter_M_AXI_AWQOS),
        .m_axi_awready(axi_clock_converter_M_AXI_AWREADY),
        .m_axi_awsize(axi_clock_converter_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_clock_converter_M_AXI_AWVALID),
        .m_axi_bid(axi_clock_converter_M_AXI_BID),
        .m_axi_bready(axi_clock_converter_M_AXI_BREADY),
        .m_axi_bresp(axi_clock_converter_M_AXI_BRESP),
        .m_axi_bvalid(axi_clock_converter_M_AXI_BVALID),
        .m_axi_rdata(axi_clock_converter_M_AXI_RDATA),
        .m_axi_rid(axi_clock_converter_M_AXI_RID),
        .m_axi_rlast(axi_clock_converter_M_AXI_RLAST),
        .m_axi_rready(axi_clock_converter_M_AXI_RREADY),
        .m_axi_rresp(axi_clock_converter_M_AXI_RRESP),
        .m_axi_rvalid(axi_clock_converter_M_AXI_RVALID),
        .m_axi_wdata(axi_clock_converter_M_AXI_WDATA),
        .m_axi_wlast(axi_clock_converter_M_AXI_WLAST),
        .m_axi_wready(axi_clock_converter_M_AXI_WREADY),
        .m_axi_wstrb(axi_clock_converter_M_AXI_WSTRB),
        .m_axi_wvalid(axi_clock_converter_M_AXI_WVALID),
        .s_axi_aclk(aclk_1),
        .s_axi_araddr(axi_crossbar_M00_AXI_ARADDR[31:0]),
        .s_axi_arburst(axi_crossbar_M00_AXI_ARBURST),
        .s_axi_arcache(axi_crossbar_M00_AXI_ARCACHE),
        .s_axi_aresetn(aresetn_1),
        .s_axi_arid(axi_crossbar_M00_AXI_ARID),
        .s_axi_arlen(axi_crossbar_M00_AXI_ARLEN),
        .s_axi_arlock(axi_crossbar_M00_AXI_ARLOCK),
        .s_axi_arprot(axi_crossbar_M00_AXI_ARPROT),
        .s_axi_arqos(axi_crossbar_M00_AXI_ARQOS),
        .s_axi_arready(axi_crossbar_M00_AXI_ARREADY),
        .s_axi_arregion(axi_crossbar_M00_AXI_ARREGION),
        .s_axi_arsize(axi_crossbar_M00_AXI_ARSIZE),
        .s_axi_arvalid(axi_crossbar_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_crossbar_M00_AXI_AWADDR[31:0]),
        .s_axi_awburst(axi_crossbar_M00_AXI_AWBURST),
        .s_axi_awcache(axi_crossbar_M00_AXI_AWCACHE),
        .s_axi_awid(axi_crossbar_M00_AXI_AWID),
        .s_axi_awlen(axi_crossbar_M00_AXI_AWLEN),
        .s_axi_awlock(axi_crossbar_M00_AXI_AWLOCK),
        .s_axi_awprot(axi_crossbar_M00_AXI_AWPROT),
        .s_axi_awqos(axi_crossbar_M00_AXI_AWQOS),
        .s_axi_awready(axi_crossbar_M00_AXI_AWREADY),
        .s_axi_awregion(axi_crossbar_M00_AXI_AWREGION),
        .s_axi_awsize(axi_crossbar_M00_AXI_AWSIZE),
        .s_axi_awvalid(axi_crossbar_M00_AXI_AWVALID),
        .s_axi_bid(axi_crossbar_M00_AXI_BID),
        .s_axi_bready(axi_crossbar_M00_AXI_BREADY),
        .s_axi_bresp(axi_crossbar_M00_AXI_BRESP),
        .s_axi_bvalid(axi_crossbar_M00_AXI_BVALID),
        .s_axi_rdata(axi_crossbar_M00_AXI_RDATA),
        .s_axi_rid(axi_crossbar_M00_AXI_RID),
        .s_axi_rlast(axi_crossbar_M00_AXI_RLAST),
        .s_axi_rready(axi_crossbar_M00_AXI_RREADY),
        .s_axi_rresp(axi_crossbar_M00_AXI_RRESP),
        .s_axi_rvalid(axi_crossbar_M00_AXI_RVALID),
        .s_axi_wdata(axi_crossbar_M00_AXI_WDATA),
        .s_axi_wlast(axi_crossbar_M00_AXI_WLAST),
        .s_axi_wready(axi_crossbar_M00_AXI_WREADY),
        .s_axi_wstrb(axi_crossbar_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_crossbar_M00_AXI_WVALID));
  top_level_axi_crossbar_3 axi_crossbar
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(axi_crossbar_M00_AXI_ARADDR),
        .m_axi_arburst(axi_crossbar_M00_AXI_ARBURST),
        .m_axi_arcache(axi_crossbar_M00_AXI_ARCACHE),
        .m_axi_arid(axi_crossbar_M00_AXI_ARID),
        .m_axi_arlen(axi_crossbar_M00_AXI_ARLEN),
        .m_axi_arlock(axi_crossbar_M00_AXI_ARLOCK),
        .m_axi_arprot(axi_crossbar_M00_AXI_ARPROT),
        .m_axi_arqos(axi_crossbar_M00_AXI_ARQOS),
        .m_axi_arready(axi_crossbar_M00_AXI_ARREADY),
        .m_axi_arregion(axi_crossbar_M00_AXI_ARREGION),
        .m_axi_arsize(axi_crossbar_M00_AXI_ARSIZE),
        .m_axi_arvalid(axi_crossbar_M00_AXI_ARVALID),
        .m_axi_awaddr(axi_crossbar_M00_AXI_AWADDR),
        .m_axi_awburst(axi_crossbar_M00_AXI_AWBURST),
        .m_axi_awcache(axi_crossbar_M00_AXI_AWCACHE),
        .m_axi_awid(axi_crossbar_M00_AXI_AWID),
        .m_axi_awlen(axi_crossbar_M00_AXI_AWLEN),
        .m_axi_awlock(axi_crossbar_M00_AXI_AWLOCK),
        .m_axi_awprot(axi_crossbar_M00_AXI_AWPROT),
        .m_axi_awqos(axi_crossbar_M00_AXI_AWQOS),
        .m_axi_awready(axi_crossbar_M00_AXI_AWREADY),
        .m_axi_awregion(axi_crossbar_M00_AXI_AWREGION),
        .m_axi_awsize(axi_crossbar_M00_AXI_AWSIZE),
        .m_axi_awvalid(axi_crossbar_M00_AXI_AWVALID),
        .m_axi_bid(axi_crossbar_M00_AXI_BID),
        .m_axi_bready(axi_crossbar_M00_AXI_BREADY),
        .m_axi_bresp(axi_crossbar_M00_AXI_BRESP),
        .m_axi_bvalid(axi_crossbar_M00_AXI_BVALID),
        .m_axi_rdata(axi_crossbar_M00_AXI_RDATA),
        .m_axi_rid(axi_crossbar_M00_AXI_RID),
        .m_axi_rlast(axi_crossbar_M00_AXI_RLAST),
        .m_axi_rready(axi_crossbar_M00_AXI_RREADY),
        .m_axi_rresp(axi_crossbar_M00_AXI_RRESP),
        .m_axi_rvalid(axi_crossbar_M00_AXI_RVALID),
        .m_axi_wdata(axi_crossbar_M00_AXI_WDATA),
        .m_axi_wlast(axi_crossbar_M00_AXI_WLAST),
        .m_axi_wready(axi_crossbar_M00_AXI_WREADY),
        .m_axi_wstrb(axi_crossbar_M00_AXI_WSTRB),
        .m_axi_wvalid(axi_crossbar_M00_AXI_WVALID),
        .s_axi_araddr({RD_AXI_1_ARADDR,WR_AXI_1_ARADDR}),
        .s_axi_arburst({RD_AXI_1_ARBURST,WR_AXI_1_ARBURST}),
        .s_axi_arcache({RD_AXI_1_ARCACHE,WR_AXI_1_ARCACHE}),
        .s_axi_arid({1'b0,RD_AXI_1_ARID,1'b0,WR_AXI_1_ARID}),
        .s_axi_arlen({RD_AXI_1_ARLEN,WR_AXI_1_ARLEN}),
        .s_axi_arlock({RD_AXI_1_ARLOCK,WR_AXI_1_ARLOCK}),
        .s_axi_arprot({RD_AXI_1_ARPROT,WR_AXI_1_ARPROT}),
        .s_axi_arqos({RD_AXI_1_ARQOS,WR_AXI_1_ARQOS}),
        .s_axi_arready({RD_AXI_1_ARREADY,WR_AXI_1_ARREADY}),
        .s_axi_arsize({RD_AXI_1_ARSIZE,WR_AXI_1_ARSIZE}),
        .s_axi_arvalid({RD_AXI_1_ARVALID,WR_AXI_1_ARVALID}),
        .s_axi_awaddr({RD_AXI_1_AWADDR,WR_AXI_1_AWADDR}),
        .s_axi_awburst({RD_AXI_1_AWBURST,WR_AXI_1_AWBURST}),
        .s_axi_awcache({RD_AXI_1_AWCACHE,WR_AXI_1_AWCACHE}),
        .s_axi_awid({1'b0,RD_AXI_1_AWID,1'b0,WR_AXI_1_AWID}),
        .s_axi_awlen({RD_AXI_1_AWLEN,WR_AXI_1_AWLEN}),
        .s_axi_awlock({RD_AXI_1_AWLOCK,WR_AXI_1_AWLOCK}),
        .s_axi_awprot({RD_AXI_1_AWPROT,WR_AXI_1_AWPROT}),
        .s_axi_awqos({RD_AXI_1_AWQOS,WR_AXI_1_AWQOS}),
        .s_axi_awready({RD_AXI_1_AWREADY,WR_AXI_1_AWREADY}),
        .s_axi_awsize({RD_AXI_1_AWSIZE,WR_AXI_1_AWSIZE}),
        .s_axi_awvalid({RD_AXI_1_AWVALID,WR_AXI_1_AWVALID}),
        .s_axi_bready({RD_AXI_1_BREADY,WR_AXI_1_BREADY}),
        .s_axi_bresp({RD_AXI_1_BRESP,WR_AXI_1_BRESP}),
        .s_axi_bvalid({RD_AXI_1_BVALID,WR_AXI_1_BVALID}),
        .s_axi_rdata({RD_AXI_1_RDATA,WR_AXI_1_RDATA}),
        .s_axi_rlast({RD_AXI_1_RLAST,WR_AXI_1_RLAST}),
        .s_axi_rready({RD_AXI_1_RREADY,WR_AXI_1_RREADY}),
        .s_axi_rresp({RD_AXI_1_RRESP,WR_AXI_1_RRESP}),
        .s_axi_rvalid({RD_AXI_1_RVALID,WR_AXI_1_RVALID}),
        .s_axi_wdata({RD_AXI_1_WDATA,WR_AXI_1_WDATA}),
        .s_axi_wlast({RD_AXI_1_WLAST,WR_AXI_1_WLAST}),
        .s_axi_wready({RD_AXI_1_WREADY,WR_AXI_1_WREADY}),
        .s_axi_wstrb({RD_AXI_1_WSTRB,WR_AXI_1_WSTRB}),
        .s_axi_wvalid({RD_AXI_1_WVALID,WR_AXI_1_WVALID}));
  top_level_ddr4_1 ddr4
       (.c0_ddr4_act_n(ddr4_C0_DDR4_ACT_N),
        .c0_ddr4_adr(ddr4_C0_DDR4_ADR),
        .c0_ddr4_aresetn(ddr_widget_0_ddr_resetn_out),
        .c0_ddr4_ba(ddr4_C0_DDR4_BA),
        .c0_ddr4_bg(ddr4_C0_DDR4_BG),
        .c0_ddr4_ck_c(ddr4_C0_DDR4_CK_C),
        .c0_ddr4_ck_t(ddr4_C0_DDR4_CK_T),
        .c0_ddr4_cke(ddr4_C0_DDR4_CKE),
        .c0_ddr4_cs_n(ddr4_C0_DDR4_CS_N),
        .c0_ddr4_dm_dbi_n(ddr4_dm_n[7:0]),
        .c0_ddr4_dq(ddr4_dq[63:0]),
        .c0_ddr4_dqs_c(ddr4_dqs_c[7:0]),
        .c0_ddr4_dqs_t(ddr4_dqs_t[7:0]),
        .c0_ddr4_odt(ddr4_C0_DDR4_ODT),
        .c0_ddr4_reset_n(ddr4_C0_DDR4_RESET_N),
        .c0_ddr4_s_axi_araddr(axi_clock_converter_M_AXI_ARADDR),
        .c0_ddr4_s_axi_arburst(axi_clock_converter_M_AXI_ARBURST),
        .c0_ddr4_s_axi_arcache(axi_clock_converter_M_AXI_ARCACHE),
        .c0_ddr4_s_axi_arid(axi_clock_converter_M_AXI_ARID),
        .c0_ddr4_s_axi_arlen(axi_clock_converter_M_AXI_ARLEN),
        .c0_ddr4_s_axi_arlock(axi_clock_converter_M_AXI_ARLOCK),
        .c0_ddr4_s_axi_arprot(axi_clock_converter_M_AXI_ARPROT),
        .c0_ddr4_s_axi_arqos(axi_clock_converter_M_AXI_ARQOS),
        .c0_ddr4_s_axi_arready(axi_clock_converter_M_AXI_ARREADY),
        .c0_ddr4_s_axi_arsize(axi_clock_converter_M_AXI_ARSIZE),
        .c0_ddr4_s_axi_arvalid(axi_clock_converter_M_AXI_ARVALID),
        .c0_ddr4_s_axi_awaddr(axi_clock_converter_M_AXI_AWADDR),
        .c0_ddr4_s_axi_awburst(axi_clock_converter_M_AXI_AWBURST),
        .c0_ddr4_s_axi_awcache(axi_clock_converter_M_AXI_AWCACHE),
        .c0_ddr4_s_axi_awid(axi_clock_converter_M_AXI_AWID),
        .c0_ddr4_s_axi_awlen(axi_clock_converter_M_AXI_AWLEN),
        .c0_ddr4_s_axi_awlock(axi_clock_converter_M_AXI_AWLOCK),
        .c0_ddr4_s_axi_awprot(axi_clock_converter_M_AXI_AWPROT),
        .c0_ddr4_s_axi_awqos(axi_clock_converter_M_AXI_AWQOS),
        .c0_ddr4_s_axi_awready(axi_clock_converter_M_AXI_AWREADY),
        .c0_ddr4_s_axi_awsize(axi_clock_converter_M_AXI_AWSIZE),
        .c0_ddr4_s_axi_awvalid(axi_clock_converter_M_AXI_AWVALID),
        .c0_ddr4_s_axi_bid(axi_clock_converter_M_AXI_BID),
        .c0_ddr4_s_axi_bready(axi_clock_converter_M_AXI_BREADY),
        .c0_ddr4_s_axi_bresp(axi_clock_converter_M_AXI_BRESP),
        .c0_ddr4_s_axi_bvalid(axi_clock_converter_M_AXI_BVALID),
        .c0_ddr4_s_axi_rdata(axi_clock_converter_M_AXI_RDATA),
        .c0_ddr4_s_axi_rid(axi_clock_converter_M_AXI_RID),
        .c0_ddr4_s_axi_rlast(axi_clock_converter_M_AXI_RLAST),
        .c0_ddr4_s_axi_rready(axi_clock_converter_M_AXI_RREADY),
        .c0_ddr4_s_axi_rresp(axi_clock_converter_M_AXI_RRESP),
        .c0_ddr4_s_axi_rvalid(axi_clock_converter_M_AXI_RVALID),
        .c0_ddr4_s_axi_wdata(axi_clock_converter_M_AXI_WDATA),
        .c0_ddr4_s_axi_wlast(axi_clock_converter_M_AXI_WLAST),
        .c0_ddr4_s_axi_wready(axi_clock_converter_M_AXI_WREADY),
        .c0_ddr4_s_axi_wstrb(axi_clock_converter_M_AXI_WSTRB),
        .c0_ddr4_s_axi_wvalid(axi_clock_converter_M_AXI_WVALID),
        .c0_ddr4_ui_clk(ddr4_c0_ddr4_ui_clk),
        .c0_ddr4_ui_clk_sync_rst(ddr4_c0_ddr4_ui_clk_sync_rst),
        .c0_init_calib_complete(ddr4_c0_init_calib_complete),
        .c0_sys_clk_n(ddr4_clk_1_CLK_N),
        .c0_sys_clk_p(ddr4_clk_1_CLK_P),
        .sys_rst(ddr_widget_0_zero));
  top_level_ddr_widget_1 ddr_widget
       (.ddr_reset_in(ddr4_c0_ddr4_ui_clk_sync_rst),
        .ddr_resetn_out(ddr_widget_0_ddr_resetn_out),
        .zero(ddr_widget_0_zero));
endmodule

module ddr_imp_LCEBXW
   (RD_AXI_araddr,
    RD_AXI_arburst,
    RD_AXI_arcache,
    RD_AXI_arid,
    RD_AXI_arlen,
    RD_AXI_arlock,
    RD_AXI_arprot,
    RD_AXI_arqos,
    RD_AXI_arready,
    RD_AXI_arsize,
    RD_AXI_arvalid,
    RD_AXI_awaddr,
    RD_AXI_awburst,
    RD_AXI_awcache,
    RD_AXI_awid,
    RD_AXI_awlen,
    RD_AXI_awlock,
    RD_AXI_awprot,
    RD_AXI_awqos,
    RD_AXI_awready,
    RD_AXI_awsize,
    RD_AXI_awvalid,
    RD_AXI_bready,
    RD_AXI_bresp,
    RD_AXI_bvalid,
    RD_AXI_rdata,
    RD_AXI_rlast,
    RD_AXI_rready,
    RD_AXI_rresp,
    RD_AXI_rvalid,
    RD_AXI_wdata,
    RD_AXI_wlast,
    RD_AXI_wready,
    RD_AXI_wstrb,
    RD_AXI_wvalid,
    WR_AXI_araddr,
    WR_AXI_arburst,
    WR_AXI_arcache,
    WR_AXI_arid,
    WR_AXI_arlen,
    WR_AXI_arlock,
    WR_AXI_arprot,
    WR_AXI_arqos,
    WR_AXI_arready,
    WR_AXI_arsize,
    WR_AXI_arvalid,
    WR_AXI_awaddr,
    WR_AXI_awburst,
    WR_AXI_awcache,
    WR_AXI_awid,
    WR_AXI_awlen,
    WR_AXI_awlock,
    WR_AXI_awprot,
    WR_AXI_awqos,
    WR_AXI_awready,
    WR_AXI_awsize,
    WR_AXI_awvalid,
    WR_AXI_bready,
    WR_AXI_bresp,
    WR_AXI_bvalid,
    WR_AXI_rdata,
    WR_AXI_rlast,
    WR_AXI_rready,
    WR_AXI_rresp,
    WR_AXI_rvalid,
    WR_AXI_wdata,
    WR_AXI_wlast,
    WR_AXI_wready,
    WR_AXI_wstrb,
    WR_AXI_wvalid,
    aclk,
    aresetn,
    c0_init_calib_complete,
    ddr4_act_n,
    ddr4_adr,
    ddr4_ba,
    ddr4_bg,
    ddr4_ck_c,
    ddr4_ck_t,
    ddr4_cke,
    ddr4_clk_clk_n,
    ddr4_clk_clk_p,
    ddr4_cs_n,
    ddr4_dm_n,
    ddr4_dq,
    ddr4_dqs_c,
    ddr4_dqs_t,
    ddr4_odt,
    ddr4_reset_n);
  input [63:0]RD_AXI_araddr;
  input [1:0]RD_AXI_arburst;
  input [3:0]RD_AXI_arcache;
  input [4:0]RD_AXI_arid;
  input [7:0]RD_AXI_arlen;
  input RD_AXI_arlock;
  input [2:0]RD_AXI_arprot;
  input [3:0]RD_AXI_arqos;
  output RD_AXI_arready;
  input [2:0]RD_AXI_arsize;
  input RD_AXI_arvalid;
  input [63:0]RD_AXI_awaddr;
  input [1:0]RD_AXI_awburst;
  input [3:0]RD_AXI_awcache;
  input [4:0]RD_AXI_awid;
  input [7:0]RD_AXI_awlen;
  input RD_AXI_awlock;
  input [2:0]RD_AXI_awprot;
  input [3:0]RD_AXI_awqos;
  output RD_AXI_awready;
  input [2:0]RD_AXI_awsize;
  input RD_AXI_awvalid;
  input RD_AXI_bready;
  output [1:0]RD_AXI_bresp;
  output RD_AXI_bvalid;
  output [511:0]RD_AXI_rdata;
  output RD_AXI_rlast;
  input RD_AXI_rready;
  output [1:0]RD_AXI_rresp;
  output RD_AXI_rvalid;
  input [511:0]RD_AXI_wdata;
  input RD_AXI_wlast;
  output RD_AXI_wready;
  input [63:0]RD_AXI_wstrb;
  input RD_AXI_wvalid;
  input [63:0]WR_AXI_araddr;
  input [1:0]WR_AXI_arburst;
  input [3:0]WR_AXI_arcache;
  input [4:0]WR_AXI_arid;
  input [7:0]WR_AXI_arlen;
  input WR_AXI_arlock;
  input [2:0]WR_AXI_arprot;
  input [3:0]WR_AXI_arqos;
  output WR_AXI_arready;
  input [2:0]WR_AXI_arsize;
  input WR_AXI_arvalid;
  input [63:0]WR_AXI_awaddr;
  input [1:0]WR_AXI_awburst;
  input [3:0]WR_AXI_awcache;
  input [4:0]WR_AXI_awid;
  input [7:0]WR_AXI_awlen;
  input WR_AXI_awlock;
  input [2:0]WR_AXI_awprot;
  input [3:0]WR_AXI_awqos;
  output WR_AXI_awready;
  input [2:0]WR_AXI_awsize;
  input WR_AXI_awvalid;
  input WR_AXI_bready;
  output [1:0]WR_AXI_bresp;
  output WR_AXI_bvalid;
  output [511:0]WR_AXI_rdata;
  output WR_AXI_rlast;
  input WR_AXI_rready;
  output [1:0]WR_AXI_rresp;
  output WR_AXI_rvalid;
  input [511:0]WR_AXI_wdata;
  input WR_AXI_wlast;
  output WR_AXI_wready;
  input [63:0]WR_AXI_wstrb;
  input WR_AXI_wvalid;
  input aclk;
  input aresetn;
  output c0_init_calib_complete;
  output ddr4_act_n;
  output [16:0]ddr4_adr;
  output [1:0]ddr4_ba;
  output [1:0]ddr4_bg;
  output [0:0]ddr4_ck_c;
  output [0:0]ddr4_ck_t;
  output [0:0]ddr4_cke;
  input ddr4_clk_clk_n;
  input ddr4_clk_clk_p;
  output [0:0]ddr4_cs_n;
  inout [7:0]ddr4_dm_n;
  inout [63:0]ddr4_dq;
  inout [7:0]ddr4_dqs_c;
  inout [7:0]ddr4_dqs_t;
  output [0:0]ddr4_odt;
  output ddr4_reset_n;

  wire [63:0]RD_AXI_1_ARADDR;
  wire [1:0]RD_AXI_1_ARBURST;
  wire [3:0]RD_AXI_1_ARCACHE;
  wire [4:0]RD_AXI_1_ARID;
  wire [7:0]RD_AXI_1_ARLEN;
  wire RD_AXI_1_ARLOCK;
  wire [2:0]RD_AXI_1_ARPROT;
  wire [3:0]RD_AXI_1_ARQOS;
  wire [1:1]RD_AXI_1_ARREADY;
  wire [2:0]RD_AXI_1_ARSIZE;
  wire RD_AXI_1_ARVALID;
  wire [63:0]RD_AXI_1_AWADDR;
  wire [1:0]RD_AXI_1_AWBURST;
  wire [3:0]RD_AXI_1_AWCACHE;
  wire [4:0]RD_AXI_1_AWID;
  wire [7:0]RD_AXI_1_AWLEN;
  wire RD_AXI_1_AWLOCK;
  wire [2:0]RD_AXI_1_AWPROT;
  wire [3:0]RD_AXI_1_AWQOS;
  wire [1:1]RD_AXI_1_AWREADY;
  wire [2:0]RD_AXI_1_AWSIZE;
  wire RD_AXI_1_AWVALID;
  wire RD_AXI_1_BREADY;
  wire [3:2]RD_AXI_1_BRESP;
  wire [1:1]RD_AXI_1_BVALID;
  wire [1023:512]RD_AXI_1_RDATA;
  wire [1:1]RD_AXI_1_RLAST;
  wire RD_AXI_1_RREADY;
  wire [3:2]RD_AXI_1_RRESP;
  wire [1:1]RD_AXI_1_RVALID;
  wire [511:0]RD_AXI_1_WDATA;
  wire RD_AXI_1_WLAST;
  wire [1:1]RD_AXI_1_WREADY;
  wire [63:0]RD_AXI_1_WSTRB;
  wire RD_AXI_1_WVALID;
  wire [63:0]WR_AXI_1_ARADDR;
  wire [1:0]WR_AXI_1_ARBURST;
  wire [3:0]WR_AXI_1_ARCACHE;
  wire [4:0]WR_AXI_1_ARID;
  wire [7:0]WR_AXI_1_ARLEN;
  wire WR_AXI_1_ARLOCK;
  wire [2:0]WR_AXI_1_ARPROT;
  wire [3:0]WR_AXI_1_ARQOS;
  wire [0:0]WR_AXI_1_ARREADY;
  wire [2:0]WR_AXI_1_ARSIZE;
  wire WR_AXI_1_ARVALID;
  wire [63:0]WR_AXI_1_AWADDR;
  wire [1:0]WR_AXI_1_AWBURST;
  wire [3:0]WR_AXI_1_AWCACHE;
  wire [4:0]WR_AXI_1_AWID;
  wire [7:0]WR_AXI_1_AWLEN;
  wire WR_AXI_1_AWLOCK;
  wire [2:0]WR_AXI_1_AWPROT;
  wire [3:0]WR_AXI_1_AWQOS;
  wire [0:0]WR_AXI_1_AWREADY;
  wire [2:0]WR_AXI_1_AWSIZE;
  wire WR_AXI_1_AWVALID;
  wire WR_AXI_1_BREADY;
  wire [1:0]WR_AXI_1_BRESP;
  wire [0:0]WR_AXI_1_BVALID;
  wire [511:0]WR_AXI_1_RDATA;
  wire [0:0]WR_AXI_1_RLAST;
  wire WR_AXI_1_RREADY;
  wire [1:0]WR_AXI_1_RRESP;
  wire [0:0]WR_AXI_1_RVALID;
  wire [511:0]WR_AXI_1_WDATA;
  wire WR_AXI_1_WLAST;
  wire [0:0]WR_AXI_1_WREADY;
  wire [63:0]WR_AXI_1_WSTRB;
  wire WR_AXI_1_WVALID;
  wire aclk_1;
  wire aresetn_1;
  wire [31:0]axi_clock_converter_M_AXI_ARADDR;
  wire [1:0]axi_clock_converter_M_AXI_ARBURST;
  wire [3:0]axi_clock_converter_M_AXI_ARCACHE;
  wire [5:0]axi_clock_converter_M_AXI_ARID;
  wire [7:0]axi_clock_converter_M_AXI_ARLEN;
  wire [0:0]axi_clock_converter_M_AXI_ARLOCK;
  wire [2:0]axi_clock_converter_M_AXI_ARPROT;
  wire [3:0]axi_clock_converter_M_AXI_ARQOS;
  wire axi_clock_converter_M_AXI_ARREADY;
  wire [2:0]axi_clock_converter_M_AXI_ARSIZE;
  wire axi_clock_converter_M_AXI_ARVALID;
  wire [31:0]axi_clock_converter_M_AXI_AWADDR;
  wire [1:0]axi_clock_converter_M_AXI_AWBURST;
  wire [3:0]axi_clock_converter_M_AXI_AWCACHE;
  wire [5:0]axi_clock_converter_M_AXI_AWID;
  wire [7:0]axi_clock_converter_M_AXI_AWLEN;
  wire [0:0]axi_clock_converter_M_AXI_AWLOCK;
  wire [2:0]axi_clock_converter_M_AXI_AWPROT;
  wire [3:0]axi_clock_converter_M_AXI_AWQOS;
  wire axi_clock_converter_M_AXI_AWREADY;
  wire [2:0]axi_clock_converter_M_AXI_AWSIZE;
  wire axi_clock_converter_M_AXI_AWVALID;
  wire [5:0]axi_clock_converter_M_AXI_BID;
  wire axi_clock_converter_M_AXI_BREADY;
  wire [1:0]axi_clock_converter_M_AXI_BRESP;
  wire axi_clock_converter_M_AXI_BVALID;
  wire [511:0]axi_clock_converter_M_AXI_RDATA;
  wire [5:0]axi_clock_converter_M_AXI_RID;
  wire axi_clock_converter_M_AXI_RLAST;
  wire axi_clock_converter_M_AXI_RREADY;
  wire [1:0]axi_clock_converter_M_AXI_RRESP;
  wire axi_clock_converter_M_AXI_RVALID;
  wire [511:0]axi_clock_converter_M_AXI_WDATA;
  wire axi_clock_converter_M_AXI_WLAST;
  wire axi_clock_converter_M_AXI_WREADY;
  wire [63:0]axi_clock_converter_M_AXI_WSTRB;
  wire axi_clock_converter_M_AXI_WVALID;
  wire [63:0]axi_crossbar_0_M00_AXI_ARADDR;
  wire [1:0]axi_crossbar_0_M00_AXI_ARBURST;
  wire [3:0]axi_crossbar_0_M00_AXI_ARCACHE;
  wire [5:0]axi_crossbar_0_M00_AXI_ARID;
  wire [7:0]axi_crossbar_0_M00_AXI_ARLEN;
  wire [0:0]axi_crossbar_0_M00_AXI_ARLOCK;
  wire [2:0]axi_crossbar_0_M00_AXI_ARPROT;
  wire [3:0]axi_crossbar_0_M00_AXI_ARQOS;
  wire axi_crossbar_0_M00_AXI_ARREADY;
  wire [3:0]axi_crossbar_0_M00_AXI_ARREGION;
  wire [2:0]axi_crossbar_0_M00_AXI_ARSIZE;
  wire [0:0]axi_crossbar_0_M00_AXI_ARVALID;
  wire [63:0]axi_crossbar_0_M00_AXI_AWADDR;
  wire [1:0]axi_crossbar_0_M00_AXI_AWBURST;
  wire [3:0]axi_crossbar_0_M00_AXI_AWCACHE;
  wire [5:0]axi_crossbar_0_M00_AXI_AWID;
  wire [7:0]axi_crossbar_0_M00_AXI_AWLEN;
  wire [0:0]axi_crossbar_0_M00_AXI_AWLOCK;
  wire [2:0]axi_crossbar_0_M00_AXI_AWPROT;
  wire [3:0]axi_crossbar_0_M00_AXI_AWQOS;
  wire axi_crossbar_0_M00_AXI_AWREADY;
  wire [3:0]axi_crossbar_0_M00_AXI_AWREGION;
  wire [2:0]axi_crossbar_0_M00_AXI_AWSIZE;
  wire [0:0]axi_crossbar_0_M00_AXI_AWVALID;
  wire [5:0]axi_crossbar_0_M00_AXI_BID;
  wire [0:0]axi_crossbar_0_M00_AXI_BREADY;
  wire [1:0]axi_crossbar_0_M00_AXI_BRESP;
  wire axi_crossbar_0_M00_AXI_BVALID;
  wire [511:0]axi_crossbar_0_M00_AXI_RDATA;
  wire [5:0]axi_crossbar_0_M00_AXI_RID;
  wire axi_crossbar_0_M00_AXI_RLAST;
  wire [0:0]axi_crossbar_0_M00_AXI_RREADY;
  wire [1:0]axi_crossbar_0_M00_AXI_RRESP;
  wire axi_crossbar_0_M00_AXI_RVALID;
  wire [511:0]axi_crossbar_0_M00_AXI_WDATA;
  wire [0:0]axi_crossbar_0_M00_AXI_WLAST;
  wire axi_crossbar_0_M00_AXI_WREADY;
  wire [63:0]axi_crossbar_0_M00_AXI_WSTRB;
  wire [0:0]axi_crossbar_0_M00_AXI_WVALID;
  wire ddr4_C0_DDR4_ACT_N;
  wire [16:0]ddr4_C0_DDR4_ADR;
  wire [1:0]ddr4_C0_DDR4_BA;
  wire [1:0]ddr4_C0_DDR4_BG;
  wire [0:0]ddr4_C0_DDR4_CKE;
  wire [0:0]ddr4_C0_DDR4_CK_C;
  wire [0:0]ddr4_C0_DDR4_CK_T;
  wire [0:0]ddr4_C0_DDR4_CS_N;
  wire [7:0]ddr4_C0_DDR4_DM_N;
  wire [63:0]ddr4_C0_DDR4_DQ;
  wire [7:0]ddr4_C0_DDR4_DQS_C;
  wire [7:0]ddr4_C0_DDR4_DQS_T;
  wire [0:0]ddr4_C0_DDR4_ODT;
  wire ddr4_C0_DDR4_RESET_N;
  wire ddr4_c0_ddr4_ui_clk;
  wire ddr4_c0_ddr4_ui_clk_sync_rst;
  wire ddr4_c0_init_calib_complete;
  wire ddr4_clk_1_CLK_N;
  wire ddr4_clk_1_CLK_P;
  wire ddr_widget_0_ddr_resetn_out;
  wire ddr_widget_0_zero;

  assign RD_AXI_1_ARADDR = RD_AXI_araddr[63:0];
  assign RD_AXI_1_ARBURST = RD_AXI_arburst[1:0];
  assign RD_AXI_1_ARCACHE = RD_AXI_arcache[3:0];
  assign RD_AXI_1_ARID = RD_AXI_arid[4:0];
  assign RD_AXI_1_ARLEN = RD_AXI_arlen[7:0];
  assign RD_AXI_1_ARLOCK = RD_AXI_arlock;
  assign RD_AXI_1_ARPROT = RD_AXI_arprot[2:0];
  assign RD_AXI_1_ARQOS = RD_AXI_arqos[3:0];
  assign RD_AXI_1_ARSIZE = RD_AXI_arsize[2:0];
  assign RD_AXI_1_ARVALID = RD_AXI_arvalid;
  assign RD_AXI_1_AWADDR = RD_AXI_awaddr[63:0];
  assign RD_AXI_1_AWBURST = RD_AXI_awburst[1:0];
  assign RD_AXI_1_AWCACHE = RD_AXI_awcache[3:0];
  assign RD_AXI_1_AWID = RD_AXI_awid[4:0];
  assign RD_AXI_1_AWLEN = RD_AXI_awlen[7:0];
  assign RD_AXI_1_AWLOCK = RD_AXI_awlock;
  assign RD_AXI_1_AWPROT = RD_AXI_awprot[2:0];
  assign RD_AXI_1_AWQOS = RD_AXI_awqos[3:0];
  assign RD_AXI_1_AWSIZE = RD_AXI_awsize[2:0];
  assign RD_AXI_1_AWVALID = RD_AXI_awvalid;
  assign RD_AXI_1_BREADY = RD_AXI_bready;
  assign RD_AXI_1_RREADY = RD_AXI_rready;
  assign RD_AXI_1_WDATA = RD_AXI_wdata[511:0];
  assign RD_AXI_1_WLAST = RD_AXI_wlast;
  assign RD_AXI_1_WSTRB = RD_AXI_wstrb[63:0];
  assign RD_AXI_1_WVALID = RD_AXI_wvalid;
  assign RD_AXI_arready = RD_AXI_1_ARREADY;
  assign RD_AXI_awready = RD_AXI_1_AWREADY;
  assign RD_AXI_bresp[1:0] = RD_AXI_1_BRESP;
  assign RD_AXI_bvalid = RD_AXI_1_BVALID;
  assign RD_AXI_rdata[511:0] = RD_AXI_1_RDATA;
  assign RD_AXI_rlast = RD_AXI_1_RLAST;
  assign RD_AXI_rresp[1:0] = RD_AXI_1_RRESP;
  assign RD_AXI_rvalid = RD_AXI_1_RVALID;
  assign RD_AXI_wready = RD_AXI_1_WREADY;
  assign WR_AXI_1_ARADDR = WR_AXI_araddr[63:0];
  assign WR_AXI_1_ARBURST = WR_AXI_arburst[1:0];
  assign WR_AXI_1_ARCACHE = WR_AXI_arcache[3:0];
  assign WR_AXI_1_ARID = WR_AXI_arid[4:0];
  assign WR_AXI_1_ARLEN = WR_AXI_arlen[7:0];
  assign WR_AXI_1_ARLOCK = WR_AXI_arlock;
  assign WR_AXI_1_ARPROT = WR_AXI_arprot[2:0];
  assign WR_AXI_1_ARQOS = WR_AXI_arqos[3:0];
  assign WR_AXI_1_ARSIZE = WR_AXI_arsize[2:0];
  assign WR_AXI_1_ARVALID = WR_AXI_arvalid;
  assign WR_AXI_1_AWADDR = WR_AXI_awaddr[63:0];
  assign WR_AXI_1_AWBURST = WR_AXI_awburst[1:0];
  assign WR_AXI_1_AWCACHE = WR_AXI_awcache[3:0];
  assign WR_AXI_1_AWID = WR_AXI_awid[4:0];
  assign WR_AXI_1_AWLEN = WR_AXI_awlen[7:0];
  assign WR_AXI_1_AWLOCK = WR_AXI_awlock;
  assign WR_AXI_1_AWPROT = WR_AXI_awprot[2:0];
  assign WR_AXI_1_AWQOS = WR_AXI_awqos[3:0];
  assign WR_AXI_1_AWSIZE = WR_AXI_awsize[2:0];
  assign WR_AXI_1_AWVALID = WR_AXI_awvalid;
  assign WR_AXI_1_BREADY = WR_AXI_bready;
  assign WR_AXI_1_RREADY = WR_AXI_rready;
  assign WR_AXI_1_WDATA = WR_AXI_wdata[511:0];
  assign WR_AXI_1_WLAST = WR_AXI_wlast;
  assign WR_AXI_1_WSTRB = WR_AXI_wstrb[63:0];
  assign WR_AXI_1_WVALID = WR_AXI_wvalid;
  assign WR_AXI_arready = WR_AXI_1_ARREADY;
  assign WR_AXI_awready = WR_AXI_1_AWREADY;
  assign WR_AXI_bresp[1:0] = WR_AXI_1_BRESP;
  assign WR_AXI_bvalid = WR_AXI_1_BVALID;
  assign WR_AXI_rdata[511:0] = WR_AXI_1_RDATA;
  assign WR_AXI_rlast = WR_AXI_1_RLAST;
  assign WR_AXI_rresp[1:0] = WR_AXI_1_RRESP;
  assign WR_AXI_rvalid = WR_AXI_1_RVALID;
  assign WR_AXI_wready = WR_AXI_1_WREADY;
  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  assign c0_init_calib_complete = ddr4_c0_init_calib_complete;
  assign ddr4_act_n = ddr4_C0_DDR4_ACT_N;
  assign ddr4_adr[16:0] = ddr4_C0_DDR4_ADR;
  assign ddr4_ba[1:0] = ddr4_C0_DDR4_BA;
  assign ddr4_bg[1:0] = ddr4_C0_DDR4_BG;
  assign ddr4_ck_c[0] = ddr4_C0_DDR4_CK_C;
  assign ddr4_ck_t[0] = ddr4_C0_DDR4_CK_T;
  assign ddr4_cke[0] = ddr4_C0_DDR4_CKE;
  assign ddr4_clk_1_CLK_N = ddr4_clk_clk_n;
  assign ddr4_clk_1_CLK_P = ddr4_clk_clk_p;
  assign ddr4_cs_n[0] = ddr4_C0_DDR4_CS_N;
  assign ddr4_odt[0] = ddr4_C0_DDR4_ODT;
  assign ddr4_reset_n = ddr4_C0_DDR4_RESET_N;
  top_level_axi_clock_converter_0_0 axi_clock_converter
       (.m_axi_aclk(ddr4_c0_ddr4_ui_clk),
        .m_axi_araddr(axi_clock_converter_M_AXI_ARADDR),
        .m_axi_arburst(axi_clock_converter_M_AXI_ARBURST),
        .m_axi_arcache(axi_clock_converter_M_AXI_ARCACHE),
        .m_axi_aresetn(ddr_widget_0_ddr_resetn_out),
        .m_axi_arid(axi_clock_converter_M_AXI_ARID),
        .m_axi_arlen(axi_clock_converter_M_AXI_ARLEN),
        .m_axi_arlock(axi_clock_converter_M_AXI_ARLOCK),
        .m_axi_arprot(axi_clock_converter_M_AXI_ARPROT),
        .m_axi_arqos(axi_clock_converter_M_AXI_ARQOS),
        .m_axi_arready(axi_clock_converter_M_AXI_ARREADY),
        .m_axi_arsize(axi_clock_converter_M_AXI_ARSIZE),
        .m_axi_arvalid(axi_clock_converter_M_AXI_ARVALID),
        .m_axi_awaddr(axi_clock_converter_M_AXI_AWADDR),
        .m_axi_awburst(axi_clock_converter_M_AXI_AWBURST),
        .m_axi_awcache(axi_clock_converter_M_AXI_AWCACHE),
        .m_axi_awid(axi_clock_converter_M_AXI_AWID),
        .m_axi_awlen(axi_clock_converter_M_AXI_AWLEN),
        .m_axi_awlock(axi_clock_converter_M_AXI_AWLOCK),
        .m_axi_awprot(axi_clock_converter_M_AXI_AWPROT),
        .m_axi_awqos(axi_clock_converter_M_AXI_AWQOS),
        .m_axi_awready(axi_clock_converter_M_AXI_AWREADY),
        .m_axi_awsize(axi_clock_converter_M_AXI_AWSIZE),
        .m_axi_awvalid(axi_clock_converter_M_AXI_AWVALID),
        .m_axi_bid(axi_clock_converter_M_AXI_BID),
        .m_axi_bready(axi_clock_converter_M_AXI_BREADY),
        .m_axi_bresp(axi_clock_converter_M_AXI_BRESP),
        .m_axi_bvalid(axi_clock_converter_M_AXI_BVALID),
        .m_axi_rdata(axi_clock_converter_M_AXI_RDATA),
        .m_axi_rid(axi_clock_converter_M_AXI_RID),
        .m_axi_rlast(axi_clock_converter_M_AXI_RLAST),
        .m_axi_rready(axi_clock_converter_M_AXI_RREADY),
        .m_axi_rresp(axi_clock_converter_M_AXI_RRESP),
        .m_axi_rvalid(axi_clock_converter_M_AXI_RVALID),
        .m_axi_wdata(axi_clock_converter_M_AXI_WDATA),
        .m_axi_wlast(axi_clock_converter_M_AXI_WLAST),
        .m_axi_wready(axi_clock_converter_M_AXI_WREADY),
        .m_axi_wstrb(axi_clock_converter_M_AXI_WSTRB),
        .m_axi_wvalid(axi_clock_converter_M_AXI_WVALID),
        .s_axi_aclk(aclk_1),
        .s_axi_araddr(axi_crossbar_0_M00_AXI_ARADDR[31:0]),
        .s_axi_arburst(axi_crossbar_0_M00_AXI_ARBURST),
        .s_axi_arcache(axi_crossbar_0_M00_AXI_ARCACHE),
        .s_axi_aresetn(aresetn_1),
        .s_axi_arid(axi_crossbar_0_M00_AXI_ARID),
        .s_axi_arlen(axi_crossbar_0_M00_AXI_ARLEN),
        .s_axi_arlock(axi_crossbar_0_M00_AXI_ARLOCK),
        .s_axi_arprot(axi_crossbar_0_M00_AXI_ARPROT),
        .s_axi_arqos(axi_crossbar_0_M00_AXI_ARQOS),
        .s_axi_arready(axi_crossbar_0_M00_AXI_ARREADY),
        .s_axi_arregion(axi_crossbar_0_M00_AXI_ARREGION),
        .s_axi_arsize(axi_crossbar_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(axi_crossbar_0_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_crossbar_0_M00_AXI_AWADDR[31:0]),
        .s_axi_awburst(axi_crossbar_0_M00_AXI_AWBURST),
        .s_axi_awcache(axi_crossbar_0_M00_AXI_AWCACHE),
        .s_axi_awid(axi_crossbar_0_M00_AXI_AWID),
        .s_axi_awlen(axi_crossbar_0_M00_AXI_AWLEN),
        .s_axi_awlock(axi_crossbar_0_M00_AXI_AWLOCK),
        .s_axi_awprot(axi_crossbar_0_M00_AXI_AWPROT),
        .s_axi_awqos(axi_crossbar_0_M00_AXI_AWQOS),
        .s_axi_awready(axi_crossbar_0_M00_AXI_AWREADY),
        .s_axi_awregion(axi_crossbar_0_M00_AXI_AWREGION),
        .s_axi_awsize(axi_crossbar_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(axi_crossbar_0_M00_AXI_AWVALID),
        .s_axi_bid(axi_crossbar_0_M00_AXI_BID),
        .s_axi_bready(axi_crossbar_0_M00_AXI_BREADY),
        .s_axi_bresp(axi_crossbar_0_M00_AXI_BRESP),
        .s_axi_bvalid(axi_crossbar_0_M00_AXI_BVALID),
        .s_axi_rdata(axi_crossbar_0_M00_AXI_RDATA),
        .s_axi_rid(axi_crossbar_0_M00_AXI_RID),
        .s_axi_rlast(axi_crossbar_0_M00_AXI_RLAST),
        .s_axi_rready(axi_crossbar_0_M00_AXI_RREADY),
        .s_axi_rresp(axi_crossbar_0_M00_AXI_RRESP),
        .s_axi_rvalid(axi_crossbar_0_M00_AXI_RVALID),
        .s_axi_wdata(axi_crossbar_0_M00_AXI_WDATA),
        .s_axi_wlast(axi_crossbar_0_M00_AXI_WLAST),
        .s_axi_wready(axi_crossbar_0_M00_AXI_WREADY),
        .s_axi_wstrb(axi_crossbar_0_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_crossbar_0_M00_AXI_WVALID));
  top_level_axi_crossbar_0_0 axi_crossbar
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axi_araddr(axi_crossbar_0_M00_AXI_ARADDR),
        .m_axi_arburst(axi_crossbar_0_M00_AXI_ARBURST),
        .m_axi_arcache(axi_crossbar_0_M00_AXI_ARCACHE),
        .m_axi_arid(axi_crossbar_0_M00_AXI_ARID),
        .m_axi_arlen(axi_crossbar_0_M00_AXI_ARLEN),
        .m_axi_arlock(axi_crossbar_0_M00_AXI_ARLOCK),
        .m_axi_arprot(axi_crossbar_0_M00_AXI_ARPROT),
        .m_axi_arqos(axi_crossbar_0_M00_AXI_ARQOS),
        .m_axi_arready(axi_crossbar_0_M00_AXI_ARREADY),
        .m_axi_arregion(axi_crossbar_0_M00_AXI_ARREGION),
        .m_axi_arsize(axi_crossbar_0_M00_AXI_ARSIZE),
        .m_axi_arvalid(axi_crossbar_0_M00_AXI_ARVALID),
        .m_axi_awaddr(axi_crossbar_0_M00_AXI_AWADDR),
        .m_axi_awburst(axi_crossbar_0_M00_AXI_AWBURST),
        .m_axi_awcache(axi_crossbar_0_M00_AXI_AWCACHE),
        .m_axi_awid(axi_crossbar_0_M00_AXI_AWID),
        .m_axi_awlen(axi_crossbar_0_M00_AXI_AWLEN),
        .m_axi_awlock(axi_crossbar_0_M00_AXI_AWLOCK),
        .m_axi_awprot(axi_crossbar_0_M00_AXI_AWPROT),
        .m_axi_awqos(axi_crossbar_0_M00_AXI_AWQOS),
        .m_axi_awready(axi_crossbar_0_M00_AXI_AWREADY),
        .m_axi_awregion(axi_crossbar_0_M00_AXI_AWREGION),
        .m_axi_awsize(axi_crossbar_0_M00_AXI_AWSIZE),
        .m_axi_awvalid(axi_crossbar_0_M00_AXI_AWVALID),
        .m_axi_bid(axi_crossbar_0_M00_AXI_BID),
        .m_axi_bready(axi_crossbar_0_M00_AXI_BREADY),
        .m_axi_bresp(axi_crossbar_0_M00_AXI_BRESP),
        .m_axi_bvalid(axi_crossbar_0_M00_AXI_BVALID),
        .m_axi_rdata(axi_crossbar_0_M00_AXI_RDATA),
        .m_axi_rid(axi_crossbar_0_M00_AXI_RID),
        .m_axi_rlast(axi_crossbar_0_M00_AXI_RLAST),
        .m_axi_rready(axi_crossbar_0_M00_AXI_RREADY),
        .m_axi_rresp(axi_crossbar_0_M00_AXI_RRESP),
        .m_axi_rvalid(axi_crossbar_0_M00_AXI_RVALID),
        .m_axi_wdata(axi_crossbar_0_M00_AXI_WDATA),
        .m_axi_wlast(axi_crossbar_0_M00_AXI_WLAST),
        .m_axi_wready(axi_crossbar_0_M00_AXI_WREADY),
        .m_axi_wstrb(axi_crossbar_0_M00_AXI_WSTRB),
        .m_axi_wvalid(axi_crossbar_0_M00_AXI_WVALID),
        .s_axi_araddr({RD_AXI_1_ARADDR,WR_AXI_1_ARADDR}),
        .s_axi_arburst({RD_AXI_1_ARBURST,WR_AXI_1_ARBURST}),
        .s_axi_arcache({RD_AXI_1_ARCACHE,WR_AXI_1_ARCACHE}),
        .s_axi_arid({1'b0,RD_AXI_1_ARID,1'b0,WR_AXI_1_ARID}),
        .s_axi_arlen({RD_AXI_1_ARLEN,WR_AXI_1_ARLEN}),
        .s_axi_arlock({RD_AXI_1_ARLOCK,WR_AXI_1_ARLOCK}),
        .s_axi_arprot({RD_AXI_1_ARPROT,WR_AXI_1_ARPROT}),
        .s_axi_arqos({RD_AXI_1_ARQOS,WR_AXI_1_ARQOS}),
        .s_axi_arready({RD_AXI_1_ARREADY,WR_AXI_1_ARREADY}),
        .s_axi_arsize({RD_AXI_1_ARSIZE,WR_AXI_1_ARSIZE}),
        .s_axi_arvalid({RD_AXI_1_ARVALID,WR_AXI_1_ARVALID}),
        .s_axi_awaddr({RD_AXI_1_AWADDR,WR_AXI_1_AWADDR}),
        .s_axi_awburst({RD_AXI_1_AWBURST,WR_AXI_1_AWBURST}),
        .s_axi_awcache({RD_AXI_1_AWCACHE,WR_AXI_1_AWCACHE}),
        .s_axi_awid({1'b0,RD_AXI_1_AWID,1'b0,WR_AXI_1_AWID}),
        .s_axi_awlen({RD_AXI_1_AWLEN,WR_AXI_1_AWLEN}),
        .s_axi_awlock({RD_AXI_1_AWLOCK,WR_AXI_1_AWLOCK}),
        .s_axi_awprot({RD_AXI_1_AWPROT,WR_AXI_1_AWPROT}),
        .s_axi_awqos({RD_AXI_1_AWQOS,WR_AXI_1_AWQOS}),
        .s_axi_awready({RD_AXI_1_AWREADY,WR_AXI_1_AWREADY}),
        .s_axi_awsize({RD_AXI_1_AWSIZE,WR_AXI_1_AWSIZE}),
        .s_axi_awvalid({RD_AXI_1_AWVALID,WR_AXI_1_AWVALID}),
        .s_axi_bready({RD_AXI_1_BREADY,WR_AXI_1_BREADY}),
        .s_axi_bresp({RD_AXI_1_BRESP,WR_AXI_1_BRESP}),
        .s_axi_bvalid({RD_AXI_1_BVALID,WR_AXI_1_BVALID}),
        .s_axi_rdata({RD_AXI_1_RDATA,WR_AXI_1_RDATA}),
        .s_axi_rlast({RD_AXI_1_RLAST,WR_AXI_1_RLAST}),
        .s_axi_rready({RD_AXI_1_RREADY,WR_AXI_1_RREADY}),
        .s_axi_rresp({RD_AXI_1_RRESP,WR_AXI_1_RRESP}),
        .s_axi_rvalid({RD_AXI_1_RVALID,WR_AXI_1_RVALID}),
        .s_axi_wdata({RD_AXI_1_WDATA,WR_AXI_1_WDATA}),
        .s_axi_wlast({RD_AXI_1_WLAST,WR_AXI_1_WLAST}),
        .s_axi_wready({RD_AXI_1_WREADY,WR_AXI_1_WREADY}),
        .s_axi_wstrb({RD_AXI_1_WSTRB,WR_AXI_1_WSTRB}),
        .s_axi_wvalid({RD_AXI_1_WVALID,WR_AXI_1_WVALID}));
  top_level_ddr4_0_0 ddr4
       (.c0_ddr4_act_n(ddr4_C0_DDR4_ACT_N),
        .c0_ddr4_adr(ddr4_C0_DDR4_ADR),
        .c0_ddr4_aresetn(ddr_widget_0_ddr_resetn_out),
        .c0_ddr4_ba(ddr4_C0_DDR4_BA),
        .c0_ddr4_bg(ddr4_C0_DDR4_BG),
        .c0_ddr4_ck_c(ddr4_C0_DDR4_CK_C),
        .c0_ddr4_ck_t(ddr4_C0_DDR4_CK_T),
        .c0_ddr4_cke(ddr4_C0_DDR4_CKE),
        .c0_ddr4_cs_n(ddr4_C0_DDR4_CS_N),
        .c0_ddr4_dm_dbi_n(ddr4_dm_n[7:0]),
        .c0_ddr4_dq(ddr4_dq[63:0]),
        .c0_ddr4_dqs_c(ddr4_dqs_c[7:0]),
        .c0_ddr4_dqs_t(ddr4_dqs_t[7:0]),
        .c0_ddr4_odt(ddr4_C0_DDR4_ODT),
        .c0_ddr4_reset_n(ddr4_C0_DDR4_RESET_N),
        .c0_ddr4_s_axi_araddr(axi_clock_converter_M_AXI_ARADDR),
        .c0_ddr4_s_axi_arburst(axi_clock_converter_M_AXI_ARBURST),
        .c0_ddr4_s_axi_arcache(axi_clock_converter_M_AXI_ARCACHE),
        .c0_ddr4_s_axi_arid(axi_clock_converter_M_AXI_ARID),
        .c0_ddr4_s_axi_arlen(axi_clock_converter_M_AXI_ARLEN),
        .c0_ddr4_s_axi_arlock(axi_clock_converter_M_AXI_ARLOCK),
        .c0_ddr4_s_axi_arprot(axi_clock_converter_M_AXI_ARPROT),
        .c0_ddr4_s_axi_arqos(axi_clock_converter_M_AXI_ARQOS),
        .c0_ddr4_s_axi_arready(axi_clock_converter_M_AXI_ARREADY),
        .c0_ddr4_s_axi_arsize(axi_clock_converter_M_AXI_ARSIZE),
        .c0_ddr4_s_axi_arvalid(axi_clock_converter_M_AXI_ARVALID),
        .c0_ddr4_s_axi_awaddr(axi_clock_converter_M_AXI_AWADDR),
        .c0_ddr4_s_axi_awburst(axi_clock_converter_M_AXI_AWBURST),
        .c0_ddr4_s_axi_awcache(axi_clock_converter_M_AXI_AWCACHE),
        .c0_ddr4_s_axi_awid(axi_clock_converter_M_AXI_AWID),
        .c0_ddr4_s_axi_awlen(axi_clock_converter_M_AXI_AWLEN),
        .c0_ddr4_s_axi_awlock(axi_clock_converter_M_AXI_AWLOCK),
        .c0_ddr4_s_axi_awprot(axi_clock_converter_M_AXI_AWPROT),
        .c0_ddr4_s_axi_awqos(axi_clock_converter_M_AXI_AWQOS),
        .c0_ddr4_s_axi_awready(axi_clock_converter_M_AXI_AWREADY),
        .c0_ddr4_s_axi_awsize(axi_clock_converter_M_AXI_AWSIZE),
        .c0_ddr4_s_axi_awvalid(axi_clock_converter_M_AXI_AWVALID),
        .c0_ddr4_s_axi_bid(axi_clock_converter_M_AXI_BID),
        .c0_ddr4_s_axi_bready(axi_clock_converter_M_AXI_BREADY),
        .c0_ddr4_s_axi_bresp(axi_clock_converter_M_AXI_BRESP),
        .c0_ddr4_s_axi_bvalid(axi_clock_converter_M_AXI_BVALID),
        .c0_ddr4_s_axi_rdata(axi_clock_converter_M_AXI_RDATA),
        .c0_ddr4_s_axi_rid(axi_clock_converter_M_AXI_RID),
        .c0_ddr4_s_axi_rlast(axi_clock_converter_M_AXI_RLAST),
        .c0_ddr4_s_axi_rready(axi_clock_converter_M_AXI_RREADY),
        .c0_ddr4_s_axi_rresp(axi_clock_converter_M_AXI_RRESP),
        .c0_ddr4_s_axi_rvalid(axi_clock_converter_M_AXI_RVALID),
        .c0_ddr4_s_axi_wdata(axi_clock_converter_M_AXI_WDATA),
        .c0_ddr4_s_axi_wlast(axi_clock_converter_M_AXI_WLAST),
        .c0_ddr4_s_axi_wready(axi_clock_converter_M_AXI_WREADY),
        .c0_ddr4_s_axi_wstrb(axi_clock_converter_M_AXI_WSTRB),
        .c0_ddr4_s_axi_wvalid(axi_clock_converter_M_AXI_WVALID),
        .c0_ddr4_ui_clk(ddr4_c0_ddr4_ui_clk),
        .c0_ddr4_ui_clk_sync_rst(ddr4_c0_ddr4_ui_clk_sync_rst),
        .c0_init_calib_complete(ddr4_c0_init_calib_complete),
        .c0_sys_clk_n(ddr4_clk_1_CLK_N),
        .c0_sys_clk_p(ddr4_clk_1_CLK_P),
        .sys_rst(ddr_widget_0_zero));
  top_level_ddr_widget_0_0 ddr_widget
       (.ddr_reset_in(ddr4_c0_ddr4_ui_clk_sync_rst),
        .ddr_resetn_out(ddr_widget_0_ddr_resetn_out),
        .zero(ddr_widget_0_zero));
endmodule

module ethernet_imp_1VUOSMD
   (axis_rx_tdata,
    axis_rx_tlast,
    axis_rx_tready,
    axis_rx_tvalid,
    axis_tx_tdata,
    axis_tx_tkeep,
    axis_tx_tlast,
    axis_tx_tready,
    axis_tx_tvalid,
    gt_ref_clk_clk_n,
    gt_ref_clk_clk_p,
    gt_serial_port_grx_n,
    gt_serial_port_grx_p,
    gt_serial_port_gtx_n,
    gt_serial_port_gtx_p,
    init_clk,
    rx_aligned,
    sys_clk,
    sys_resetn_in);
  output [511:0]axis_rx_tdata;
  output axis_rx_tlast;
  input axis_rx_tready;
  output axis_rx_tvalid;
  input [511:0]axis_tx_tdata;
  input [63:0]axis_tx_tkeep;
  input axis_tx_tlast;
  output axis_tx_tready;
  input axis_tx_tvalid;
  input gt_ref_clk_clk_n;
  input gt_ref_clk_clk_p;
  input [3:0]gt_serial_port_grx_n;
  input [3:0]gt_serial_port_grx_p;
  output [3:0]gt_serial_port_gtx_n;
  output [3:0]gt_serial_port_gtx_p;
  input init_clk;
  output rx_aligned;
  input sys_clk;
  input sys_resetn_in;

  wire [511:0]axis_tx_1_TDATA;
  wire [63:0]axis_tx_1_TKEEP;
  wire axis_tx_1_TLAST;
  wire axis_tx_1_TREADY;
  wire axis_tx_1_TVALID;
  wire [511:0]cdc_fifo_M_AXIS_TDATA;
  wire cdc_fifo_M_AXIS_TLAST;
  wire cdc_fifo_M_AXIS_TREADY;
  wire cdc_fifo_M_AXIS_TVALID;
  wire cmac_control_ctl_rx_ctl_enable;
  wire cmac_control_ctl_tx_ctl_enable;
  wire cmac_control_ctl_tx_ctl_tx_send_rfi;
  wire [19:0]cmac_control_gt_trans_debug_gt_txdiffctrl;
  wire [19:0]cmac_control_gt_trans_debug_gt_txprecursor;
  wire cmac_control_reset_rx_datapath;
  wire cmac_control_rs_fec_ctl_rx_rsfec_enable;
  wire cmac_control_rs_fec_ctl_rx_rsfec_enable_correction;
  wire cmac_control_rs_fec_ctl_rx_rsfec_enable_indication;
  wire cmac_control_rs_fec_ctl_tx_rsfec_enable;
  wire cmac_control_rx_resetn_out;
  wire cmac_control_sync_rx_aligned;
  wire [511:0]cmac_usplus_axis_rx_TDATA;
  wire [63:0]cmac_usplus_axis_rx_TKEEP;
  wire cmac_usplus_axis_rx_TLAST;
  wire cmac_usplus_axis_rx_TUSER;
  wire cmac_usplus_axis_rx_TVALID;
  wire [3:0]cmac_usplus_gt_serial_port_GRX_N;
  wire [3:0]cmac_usplus_gt_serial_port_GRX_P;
  wire [3:0]cmac_usplus_gt_serial_port_GTX_N;
  wire [3:0]cmac_usplus_gt_serial_port_GTX_P;
  wire cmac_usplus_gt_txusrclk2;
  wire cmac_usplus_stat_rx_stat_rx_aligned;
  wire gt_ref_clk_1_CLK_N;
  wire gt_ref_clk_1_CLK_P;
  wire init_clk_1;
  wire sys_clk_1;
  wire sys_resetn_in_1;
  wire [511:0]tx_cdc_fifo1_M_AXIS_TDATA;
  wire [63:0]tx_cdc_fifo1_M_AXIS_TKEEP;
  wire tx_cdc_fifo1_M_AXIS_TLAST;
  wire tx_cdc_fifo1_M_AXIS_TREADY;
  wire tx_cdc_fifo1_M_AXIS_TVALID;

  assign axis_rx_tdata[511:0] = cdc_fifo_M_AXIS_TDATA;
  assign axis_rx_tlast = cdc_fifo_M_AXIS_TLAST;
  assign axis_rx_tvalid = cdc_fifo_M_AXIS_TVALID;
  assign axis_tx_1_TDATA = axis_tx_tdata[511:0];
  assign axis_tx_1_TKEEP = axis_tx_tkeep[63:0];
  assign axis_tx_1_TLAST = axis_tx_tlast;
  assign axis_tx_1_TVALID = axis_tx_tvalid;
  assign axis_tx_tready = axis_tx_1_TREADY;
  assign cdc_fifo_M_AXIS_TREADY = axis_rx_tready;
  assign cmac_usplus_gt_serial_port_GRX_N = gt_serial_port_grx_n[3:0];
  assign cmac_usplus_gt_serial_port_GRX_P = gt_serial_port_grx_p[3:0];
  assign gt_ref_clk_1_CLK_N = gt_ref_clk_clk_n;
  assign gt_ref_clk_1_CLK_P = gt_ref_clk_clk_p;
  assign gt_serial_port_gtx_n[3:0] = cmac_usplus_gt_serial_port_GTX_N;
  assign gt_serial_port_gtx_p[3:0] = cmac_usplus_gt_serial_port_GTX_P;
  assign init_clk_1 = init_clk;
  assign rx_aligned = cmac_control_sync_rx_aligned;
  assign sys_clk_1 = sys_clk;
  assign sys_resetn_in_1 = sys_resetn_in;
  cdc_packetizer_imp_1PCWAGB cdc_packetizer
       (.M_AXIS_tdata(tx_cdc_fifo1_M_AXIS_TDATA),
        .M_AXIS_tkeep(tx_cdc_fifo1_M_AXIS_TKEEP),
        .M_AXIS_tlast(tx_cdc_fifo1_M_AXIS_TLAST),
        .M_AXIS_tready(tx_cdc_fifo1_M_AXIS_TREADY),
        .M_AXIS_tvalid(tx_cdc_fifo1_M_AXIS_TVALID),
        .S_AXIS_tdata(axis_tx_1_TDATA),
        .S_AXIS_tkeep(axis_tx_1_TKEEP),
        .S_AXIS_tlast(axis_tx_1_TLAST),
        .S_AXIS_tready(axis_tx_1_TREADY),
        .S_AXIS_tvalid(axis_tx_1_TVALID),
        .cmac_clk(cmac_usplus_gt_txusrclk2),
        .cmac_resetn(cmac_control_rx_resetn_out),
        .sys_clk(sys_clk_1),
        .sys_resetn_in(sys_resetn_in_1));
  top_level_cmac_control_0_0 cmac_control
       (.ctl_rx_enable(cmac_control_ctl_rx_ctl_enable),
        .ctl_rx_rsfec_enable(cmac_control_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_tx_enable(cmac_control_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_rfi(cmac_control_ctl_tx_ctl_tx_send_rfi),
        .gt_txdiffctrl(cmac_control_gt_trans_debug_gt_txdiffctrl),
        .gt_txprecursor(cmac_control_gt_trans_debug_gt_txprecursor),
        .reset_rx_datapath(cmac_control_reset_rx_datapath),
        .rx_clk(cmac_usplus_gt_txusrclk2),
        .rx_resetn_out(cmac_control_rx_resetn_out),
        .stat_rx_aligned(cmac_usplus_stat_rx_stat_rx_aligned),
        .sync_rx_aligned(cmac_control_sync_rx_aligned),
        .sys_resetn_in(sys_resetn_in_1));
  top_level_cmac_usplus_0_0 cmac_usplus
       (.common0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpen(1'b0),
        .common0_drpwe(1'b0),
        .core_drp_reset(1'b0),
        .core_rx_reset(1'b0),
        .core_tx_reset(1'b0),
        .ctl_rsfec_ieee_error_indication_mode(1'b0),
        .ctl_rx_enable(cmac_control_ctl_rx_ctl_enable),
        .ctl_rx_force_resync(1'b0),
        .ctl_rx_rsfec_enable(cmac_control_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_rx_test_pattern(1'b0),
        .ctl_tx_enable(cmac_control_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_idle(1'b0),
        .ctl_tx_send_lfi(1'b0),
        .ctl_tx_send_rfi(cmac_control_ctl_tx_ctl_tx_send_rfi),
        .ctl_tx_test_pattern(1'b0),
        .drp_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_clk(init_clk_1),
        .drp_di({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_en(1'b0),
        .drp_we(1'b0),
        .gt0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpen(1'b0),
        .gt0_drpwe(1'b0),
        .gt1_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpen(1'b0),
        .gt1_drpwe(1'b0),
        .gt2_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpen(1'b0),
        .gt2_drpwe(1'b0),
        .gt3_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpen(1'b0),
        .gt3_drpwe(1'b0),
        .gt_drpclk(init_clk_1),
        .gt_eyescanreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_eyescantrigger({1'b0,1'b0,1'b0,1'b0}),
        .gt_loopback_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_ref_clk_n(gt_ref_clk_1_CLK_N),
        .gt_ref_clk_p(gt_ref_clk_1_CLK_P),
        .gt_rxcdrhold({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxdfelpmreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxlpmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxn_in(cmac_usplus_gt_serial_port_GRX_N),
        .gt_rxp_in(cmac_usplus_gt_serial_port_GRX_P),
        .gt_rxpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbscntreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_rxrate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txdiffctrl(cmac_control_gt_trans_debug_gt_txdiffctrl),
        .gt_txinhibit({1'b0,1'b0,1'b0,1'b0}),
        .gt_txn_out(cmac_usplus_gt_serial_port_GTX_N),
        .gt_txp_out(cmac_usplus_gt_serial_port_GTX_P),
        .gt_txpippmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpippmsel({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpostcursor({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbsforceerr({1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprecursor(cmac_control_gt_trans_debug_gt_txprecursor),
        .gt_txusrclk2(cmac_usplus_gt_txusrclk2),
        .gtwiz_reset_rx_datapath(cmac_control_reset_rx_datapath),
        .gtwiz_reset_tx_datapath(1'b0),
        .init_clk(init_clk_1),
        .rx_axis_tdata(cmac_usplus_axis_rx_TDATA),
        .rx_axis_tkeep(cmac_usplus_axis_rx_TKEEP),
        .rx_axis_tlast(cmac_usplus_axis_rx_TLAST),
        .rx_axis_tuser(cmac_usplus_axis_rx_TUSER),
        .rx_axis_tvalid(cmac_usplus_axis_rx_TVALID),
        .rx_clk(cmac_usplus_gt_txusrclk2),
        .stat_rx_aligned(cmac_usplus_stat_rx_stat_rx_aligned),
        .sys_reset(1'b0),
        .tx_axis_tdata(tx_cdc_fifo1_M_AXIS_TDATA),
        .tx_axis_tkeep(tx_cdc_fifo1_M_AXIS_TKEEP),
        .tx_axis_tlast(tx_cdc_fifo1_M_AXIS_TLAST),
        .tx_axis_tready(tx_cdc_fifo1_M_AXIS_TREADY),
        .tx_axis_tuser(1'b0),
        .tx_axis_tvalid(tx_cdc_fifo1_M_AXIS_TVALID),
        .tx_preamblein({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  top_level_axis_data_fifo_0_0 rx_cdc_fifo
       (.m_axis_aclk(sys_clk_1),
        .m_axis_tdata(cdc_fifo_M_AXIS_TDATA),
        .m_axis_tlast(cdc_fifo_M_AXIS_TLAST),
        .m_axis_tready(cdc_fifo_M_AXIS_TREADY),
        .m_axis_tvalid(cdc_fifo_M_AXIS_TVALID),
        .s_axis_aclk(cmac_usplus_gt_txusrclk2),
        .s_axis_aresetn(cmac_control_rx_resetn_out),
        .s_axis_tdata(cmac_usplus_axis_rx_TDATA),
        .s_axis_tkeep(cmac_usplus_axis_rx_TKEEP),
        .s_axis_tlast(cmac_usplus_axis_rx_TLAST),
        .s_axis_tuser(cmac_usplus_axis_rx_TUSER),
        .s_axis_tvalid(cmac_usplus_axis_rx_TVALID));
endmodule

module packet_buffer_imp_1NAPKPF
   (axis_in_tdata,
    axis_in_tlast,
    axis_in_tready,
    axis_in_tvalid,
    axis_pcie_out_tdata,
    axis_pcie_out_tlast,
    axis_pcie_out_tready,
    axis_pcie_out_tvalid,
    axis_qsfp_out_tdata,
    axis_qsfp_out_tready,
    axis_qsfp_out_tvalid,
    bad_packet_strb,
    clk,
    ddr4_0_act_n,
    ddr4_0_adr,
    ddr4_0_ba,
    ddr4_0_bg,
    ddr4_0_ck_c,
    ddr4_0_ck_t,
    ddr4_0_cke,
    ddr4_0_cs_n,
    ddr4_0_dm_n,
    ddr4_0_dq,
    ddr4_0_dqs_c,
    ddr4_0_dqs_t,
    ddr4_0_odt,
    ddr4_0_reset_n,
    ddr4_1_act_n,
    ddr4_1_adr,
    ddr4_1_ba,
    ddr4_1_bg,
    ddr4_1_ck_c,
    ddr4_1_ck_t,
    ddr4_1_cke,
    ddr4_1_cs_n,
    ddr4_1_dm_n,
    ddr4_1_dq,
    ddr4_1_dqs_c,
    ddr4_1_dqs_t,
    ddr4_1_odt,
    ddr4_1_reset_n,
    ddr4_clk_0_clk_n,
    ddr4_clk_0_clk_p,
    ddr4_clk_1_clk_n,
    ddr4_clk_1_clk_p,
    ddr_calib_complete_0,
    ddr_calib_complete_1,
    good_packet_strb,
    hwm_0,
    hwm_1,
    loopback_mode,
    overflow_0,
    overflow_1,
    resetn);
  input [511:0]axis_in_tdata;
  input axis_in_tlast;
  output axis_in_tready;
  input axis_in_tvalid;
  output [511:0]axis_pcie_out_tdata;
  output axis_pcie_out_tlast;
  input axis_pcie_out_tready;
  output axis_pcie_out_tvalid;
  output [511:0]axis_qsfp_out_tdata;
  input axis_qsfp_out_tready;
  output axis_qsfp_out_tvalid;
  output bad_packet_strb;
  input clk;
  output ddr4_0_act_n;
  output [16:0]ddr4_0_adr;
  output [1:0]ddr4_0_ba;
  output [1:0]ddr4_0_bg;
  output [0:0]ddr4_0_ck_c;
  output [0:0]ddr4_0_ck_t;
  output [0:0]ddr4_0_cke;
  output [0:0]ddr4_0_cs_n;
  inout [7:0]ddr4_0_dm_n;
  inout [63:0]ddr4_0_dq;
  inout [7:0]ddr4_0_dqs_c;
  inout [7:0]ddr4_0_dqs_t;
  output [0:0]ddr4_0_odt;
  output ddr4_0_reset_n;
  output ddr4_1_act_n;
  output [16:0]ddr4_1_adr;
  output [1:0]ddr4_1_ba;
  output [1:0]ddr4_1_bg;
  output [0:0]ddr4_1_ck_c;
  output [0:0]ddr4_1_ck_t;
  output [0:0]ddr4_1_cke;
  output [0:0]ddr4_1_cs_n;
  inout [7:0]ddr4_1_dm_n;
  inout [63:0]ddr4_1_dq;
  inout [7:0]ddr4_1_dqs_c;
  inout [7:0]ddr4_1_dqs_t;
  output [0:0]ddr4_1_odt;
  output ddr4_1_reset_n;
  input ddr4_clk_0_clk_n;
  input ddr4_clk_0_clk_p;
  input ddr4_clk_1_clk_n;
  input ddr4_clk_1_clk_p;
  output ddr_calib_complete_0;
  output ddr_calib_complete_1;
  output good_packet_strb;
  output [63:0]hwm_0;
  output [63:0]hwm_1;
  input loopback_mode;
  output overflow_0;
  output overflow_1;
  input resetn;

  wire [511:0]Conn1_TDATA;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire [511:0]axis_in_1_TDATA;
  wire axis_in_1_TLAST;
  wire axis_in_1_TREADY;
  wire axis_in_1_TVALID;
  wire [511:0]axis_mux_axis_out1_TDATA;
  wire axis_mux_axis_out1_TLAST;
  wire axis_mux_axis_out1_TREADY;
  wire axis_mux_axis_out1_TVALID;
  wire [511:0]axis_switch_axis_out0_TDATA;
  wire axis_switch_axis_out0_TREADY;
  wire axis_switch_axis_out0_TVALID;
  wire [511:0]axis_switch_axis_out1_TDATA;
  wire axis_switch_axis_out1_TREADY;
  wire axis_switch_axis_out1_TVALID;
  wire [511:0]bad_packet_filter_AXIS_OUT_TDATA;
  wire bad_packet_filter_AXIS_OUT_TLAST;
  wire bad_packet_filter_AXIS_OUT_TREADY;
  wire bad_packet_filter_AXIS_OUT_TVALID;
  wire bad_packet_filter_bad_packet_strb;
  wire [511:0]channel_0_AXIS_OUT_TDATA;
  wire channel_0_AXIS_OUT_TREADY;
  wire channel_0_AXIS_OUT_TVALID;
  wire channel_0_ddr4_ACT_N;
  wire [16:0]channel_0_ddr4_ADR;
  wire [1:0]channel_0_ddr4_BA;
  wire [1:0]channel_0_ddr4_BG;
  wire [0:0]channel_0_ddr4_CKE;
  wire [0:0]channel_0_ddr4_CK_C;
  wire [0:0]channel_0_ddr4_CK_T;
  wire [0:0]channel_0_ddr4_CS_N;
  wire [7:0]channel_0_ddr4_DM_N;
  wire [63:0]channel_0_ddr4_DQ;
  wire [7:0]channel_0_ddr4_DQS_C;
  wire [7:0]channel_0_ddr4_DQS_T;
  wire [0:0]channel_0_ddr4_ODT;
  wire channel_0_ddr4_RESET_N;
  wire channel_0_ddr_init_calib_complete;
  wire [63:0]channel_0_high_water_mark;
  wire channel_0_overflow;
  wire channel_0_ram_reader_idle;
  wire [511:0]channel_1_AXIS_OUT_TDATA;
  wire channel_1_AXIS_OUT_TREADY;
  wire channel_1_AXIS_OUT_TVALID;
  wire channel_1_ddr4_ACT_N;
  wire [16:0]channel_1_ddr4_ADR;
  wire [1:0]channel_1_ddr4_BA;
  wire [1:0]channel_1_ddr4_BG;
  wire [0:0]channel_1_ddr4_CKE;
  wire [0:0]channel_1_ddr4_CK_C;
  wire [0:0]channel_1_ddr4_CK_T;
  wire [0:0]channel_1_ddr4_CS_N;
  wire [7:0]channel_1_ddr4_DM_N;
  wire [63:0]channel_1_ddr4_DQ;
  wire [7:0]channel_1_ddr4_DQS_C;
  wire [7:0]channel_1_ddr4_DQS_T;
  wire [0:0]channel_1_ddr4_ODT;
  wire channel_1_ddr4_RESET_N;
  wire channel_1_ddr_init_calib_complete;
  wire [63:0]channel_1_high_water_mark;
  wire channel_1_overflow;
  wire channel_1_ram_reader_idle;
  wire ddr4_clk_0_1_CLK_N;
  wire ddr4_clk_0_1_CLK_P;
  wire ddr4_clk_1_CLK_N;
  wire ddr4_clk_1_CLK_P;
  wire input_axis_switch_packet_strb;
  wire [511:0]output_axis_switch_axis_out1_TDATA;
  wire output_axis_switch_axis_out1_TREADY;
  wire output_axis_switch_axis_out1_TVALID;
  wire pcie_bridge_axi_aclk;
  wire port_select_1;
  wire resetn_1;
  wire start_ram_reader_0;
  wire start_ram_reader_1;
  wire stream_to_ram_0_done;
  wire stream_to_ram_0_has_data;
  wire stream_to_ram_1_done;
  wire stream_to_ram_1_has_data;
  wire switch_ctrl_0_inflow_q;

  assign Conn1_TREADY = axis_pcie_out_tready;
  assign axis_in_1_TDATA = axis_in_tdata[511:0];
  assign axis_in_1_TLAST = axis_in_tlast;
  assign axis_in_1_TVALID = axis_in_tvalid;
  assign axis_in_tready = axis_in_1_TREADY;
  assign axis_pcie_out_tdata[511:0] = Conn1_TDATA;
  assign axis_pcie_out_tlast = Conn1_TLAST;
  assign axis_pcie_out_tvalid = Conn1_TVALID;
  assign axis_qsfp_out_tdata[511:0] = output_axis_switch_axis_out1_TDATA;
  assign axis_qsfp_out_tvalid = output_axis_switch_axis_out1_TVALID;
  assign bad_packet_strb = bad_packet_filter_bad_packet_strb;
  assign ddr4_0_act_n = channel_0_ddr4_ACT_N;
  assign ddr4_0_adr[16:0] = channel_0_ddr4_ADR;
  assign ddr4_0_ba[1:0] = channel_0_ddr4_BA;
  assign ddr4_0_bg[1:0] = channel_0_ddr4_BG;
  assign ddr4_0_ck_c[0] = channel_0_ddr4_CK_C;
  assign ddr4_0_ck_t[0] = channel_0_ddr4_CK_T;
  assign ddr4_0_cke[0] = channel_0_ddr4_CKE;
  assign ddr4_0_cs_n[0] = channel_0_ddr4_CS_N;
  assign ddr4_0_odt[0] = channel_0_ddr4_ODT;
  assign ddr4_0_reset_n = channel_0_ddr4_RESET_N;
  assign ddr4_1_act_n = channel_1_ddr4_ACT_N;
  assign ddr4_1_adr[16:0] = channel_1_ddr4_ADR;
  assign ddr4_1_ba[1:0] = channel_1_ddr4_BA;
  assign ddr4_1_bg[1:0] = channel_1_ddr4_BG;
  assign ddr4_1_ck_c[0] = channel_1_ddr4_CK_C;
  assign ddr4_1_ck_t[0] = channel_1_ddr4_CK_T;
  assign ddr4_1_cke[0] = channel_1_ddr4_CKE;
  assign ddr4_1_cs_n[0] = channel_1_ddr4_CS_N;
  assign ddr4_1_odt[0] = channel_1_ddr4_ODT;
  assign ddr4_1_reset_n = channel_1_ddr4_RESET_N;
  assign ddr4_clk_0_1_CLK_N = ddr4_clk_0_clk_n;
  assign ddr4_clk_0_1_CLK_P = ddr4_clk_0_clk_p;
  assign ddr4_clk_1_CLK_N = ddr4_clk_1_clk_n;
  assign ddr4_clk_1_CLK_P = ddr4_clk_1_clk_p;
  assign ddr_calib_complete_0 = channel_0_ddr_init_calib_complete;
  assign ddr_calib_complete_1 = channel_1_ddr_init_calib_complete;
  assign good_packet_strb = input_axis_switch_packet_strb;
  assign hwm_0[63:0] = channel_0_high_water_mark;
  assign hwm_1[63:0] = channel_1_high_water_mark;
  assign output_axis_switch_axis_out1_TREADY = axis_qsfp_out_tready;
  assign overflow_0 = channel_0_overflow;
  assign overflow_1 = channel_1_overflow;
  assign pcie_bridge_axi_aclk = clk;
  assign port_select_1 = loopback_mode;
  assign resetn_1 = resetn;
  top_level_axis_mux_0_0 axis_mux
       (.axis0_tdata(channel_0_AXIS_OUT_TDATA),
        .axis0_tlast(1'b0),
        .axis0_tready(channel_0_AXIS_OUT_TREADY),
        .axis0_tvalid(channel_0_AXIS_OUT_TVALID),
        .axis1_tdata(channel_1_AXIS_OUT_TDATA),
        .axis1_tlast(1'b0),
        .axis1_tready(channel_1_AXIS_OUT_TREADY),
        .axis1_tvalid(channel_1_AXIS_OUT_TVALID),
        .axis_out_tdata(axis_mux_axis_out1_TDATA),
        .axis_out_tlast(axis_mux_axis_out1_TLAST),
        .axis_out_tready(axis_mux_axis_out1_TREADY),
        .axis_out_tvalid(axis_mux_axis_out1_TVALID),
        .clk(pcie_bridge_axi_aclk));
  top_level_bad_packet_filter_0_0 bad_packet_filter
       (.AXIS_IN_TDATA(axis_in_1_TDATA),
        .AXIS_IN_TKEEP({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .AXIS_IN_TLAST(axis_in_1_TLAST),
        .AXIS_IN_TREADY(axis_in_1_TREADY),
        .AXIS_IN_TUSER(1'b0),
        .AXIS_IN_TVALID(axis_in_1_TVALID),
        .AXIS_OUT_TDATA(bad_packet_filter_AXIS_OUT_TDATA),
        .AXIS_OUT_TLAST(bad_packet_filter_AXIS_OUT_TLAST),
        .AXIS_OUT_TREADY(bad_packet_filter_AXIS_OUT_TREADY),
        .AXIS_OUT_TVALID(bad_packet_filter_AXIS_OUT_TVALID),
        .bad_packet_strb(bad_packet_filter_bad_packet_strb),
        .clk(pcie_bridge_axi_aclk),
        .resetn(resetn_1));
  channel_0_imp_4UD4XR channel_0
       (.AXIS_IN_tdata(axis_switch_axis_out0_TDATA),
        .AXIS_IN_tready(axis_switch_axis_out0_TREADY),
        .AXIS_IN_tvalid(axis_switch_axis_out0_TVALID),
        .AXIS_OUT_tdata(channel_0_AXIS_OUT_TDATA),
        .AXIS_OUT_tready(channel_0_AXIS_OUT_TREADY),
        .AXIS_OUT_tvalid(channel_0_AXIS_OUT_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .ddr4_act_n(channel_0_ddr4_ACT_N),
        .ddr4_adr(channel_0_ddr4_ADR),
        .ddr4_ba(channel_0_ddr4_BA),
        .ddr4_bg(channel_0_ddr4_BG),
        .ddr4_ck_c(channel_0_ddr4_CK_C),
        .ddr4_ck_t(channel_0_ddr4_CK_T),
        .ddr4_cke(channel_0_ddr4_CKE),
        .ddr4_clk_clk_n(ddr4_clk_0_1_CLK_N),
        .ddr4_clk_clk_p(ddr4_clk_0_1_CLK_P),
        .ddr4_cs_n(channel_0_ddr4_CS_N),
        .ddr4_dm_n(ddr4_0_dm_n[7:0]),
        .ddr4_dq(ddr4_0_dq[63:0]),
        .ddr4_dqs_c(ddr4_0_dqs_c[7:0]),
        .ddr4_dqs_t(ddr4_0_dqs_t[7:0]),
        .ddr4_odt(channel_0_ddr4_ODT),
        .ddr4_reset_n(channel_0_ddr4_RESET_N),
        .ddr_init_calib_complete(channel_0_ddr_init_calib_complete),
        .has_data(stream_to_ram_0_has_data),
        .high_water_mark(channel_0_high_water_mark),
        .inflow_done(stream_to_ram_0_done),
        .inflow_q(switch_ctrl_0_inflow_q),
        .overflow(channel_0_overflow),
        .ram_reader_idle(channel_0_ram_reader_idle),
        .resetn(resetn_1),
        .start_ram_reader(start_ram_reader_0));
  channel_1_imp_1YO9ERL channel_1
       (.AXIS_IN_tdata(axis_switch_axis_out1_TDATA),
        .AXIS_IN_tready(axis_switch_axis_out1_TREADY),
        .AXIS_IN_tvalid(axis_switch_axis_out1_TVALID),
        .AXIS_OUT_tdata(channel_1_AXIS_OUT_TDATA),
        .AXIS_OUT_tready(channel_1_AXIS_OUT_TREADY),
        .AXIS_OUT_tvalid(channel_1_AXIS_OUT_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .ddr4_act_n(channel_1_ddr4_ACT_N),
        .ddr4_adr(channel_1_ddr4_ADR),
        .ddr4_ba(channel_1_ddr4_BA),
        .ddr4_bg(channel_1_ddr4_BG),
        .ddr4_ck_c(channel_1_ddr4_CK_C),
        .ddr4_ck_t(channel_1_ddr4_CK_T),
        .ddr4_cke(channel_1_ddr4_CKE),
        .ddr4_clk_clk_n(ddr4_clk_1_CLK_N),
        .ddr4_clk_clk_p(ddr4_clk_1_CLK_P),
        .ddr4_cs_n(channel_1_ddr4_CS_N),
        .ddr4_dm_n(ddr4_1_dm_n[7:0]),
        .ddr4_dq(ddr4_1_dq[63:0]),
        .ddr4_dqs_c(ddr4_1_dqs_c[7:0]),
        .ddr4_dqs_t(ddr4_1_dqs_t[7:0]),
        .ddr4_odt(channel_1_ddr4_ODT),
        .ddr4_reset_n(channel_1_ddr4_RESET_N),
        .ddr_init_calib_complete(channel_1_ddr_init_calib_complete),
        .has_data(stream_to_ram_1_has_data),
        .high_water_mark(channel_1_high_water_mark),
        .inflow_done(stream_to_ram_1_done),
        .inflow_q(switch_ctrl_0_inflow_q),
        .overflow(channel_1_overflow),
        .ram_reader_idle(channel_1_ram_reader_idle),
        .resetn(resetn_1),
        .start_ram_reader(start_ram_reader_1));
  top_level_axis_switch_0_0 input_axis_switch
       (.axis_in_tdata(bad_packet_filter_AXIS_OUT_TDATA),
        .axis_in_tlast(bad_packet_filter_AXIS_OUT_TLAST),
        .axis_in_tready(bad_packet_filter_AXIS_OUT_TREADY),
        .axis_in_tvalid(bad_packet_filter_AXIS_OUT_TVALID),
        .axis_out0_tdata(axis_switch_axis_out0_TDATA),
        .axis_out0_tready(axis_switch_axis_out0_TREADY),
        .axis_out0_tvalid(axis_switch_axis_out0_TVALID),
        .axis_out1_tdata(axis_switch_axis_out1_TDATA),
        .axis_out1_tready(axis_switch_axis_out1_TREADY),
        .axis_out1_tvalid(axis_switch_axis_out1_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .packet_strb(input_axis_switch_packet_strb),
        .port_select(switch_ctrl_0_inflow_q));
  top_level_axis_switch_0_1 output_axis_switch
       (.axis_in_tdata(axis_mux_axis_out1_TDATA),
        .axis_in_tlast(axis_mux_axis_out1_TLAST),
        .axis_in_tready(axis_mux_axis_out1_TREADY),
        .axis_in_tvalid(axis_mux_axis_out1_TVALID),
        .axis_out0_tdata(Conn1_TDATA),
        .axis_out0_tlast(Conn1_TLAST),
        .axis_out0_tready(Conn1_TREADY),
        .axis_out0_tvalid(Conn1_TVALID),
        .axis_out1_tdata(output_axis_switch_axis_out1_TDATA),
        .axis_out1_tready(output_axis_switch_axis_out1_TREADY),
        .axis_out1_tvalid(output_axis_switch_axis_out1_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .port_select(port_select_1));
  top_level_switch_ctrl_0_0 switch_ctrl
       (.clk(pcie_bridge_axi_aclk),
        .has_data0(stream_to_ram_0_has_data),
        .has_data1(stream_to_ram_1_has_data),
        .inflow_done0(stream_to_ram_0_done),
        .inflow_done1(stream_to_ram_1_done),
        .inflow_q(switch_ctrl_0_inflow_q),
        .ram_reader_idle0(channel_0_ram_reader_idle),
        .ram_reader_idle1(channel_1_ram_reader_idle),
        .ram_reader_start0(start_ram_reader_0),
        .ram_reader_start1(start_ram_reader_1),
        .resetn(resetn_1));
endmodule

module pcie_bridge_imp_1AINXYK
   (AXIS_IN_tdata,
    AXIS_IN_tlast,
    AXIS_IN_tready,
    AXIS_IN_tvalid,
    M_AXI_B_araddr,
    M_AXI_B_arburst,
    M_AXI_B_arcache,
    M_AXI_B_arid,
    M_AXI_B_arlen,
    M_AXI_B_arlock,
    M_AXI_B_arprot,
    M_AXI_B_arready,
    M_AXI_B_arsize,
    M_AXI_B_arvalid,
    M_AXI_B_awaddr,
    M_AXI_B_awburst,
    M_AXI_B_awcache,
    M_AXI_B_awid,
    M_AXI_B_awlen,
    M_AXI_B_awlock,
    M_AXI_B_awprot,
    M_AXI_B_awready,
    M_AXI_B_awsize,
    M_AXI_B_awvalid,
    M_AXI_B_bid,
    M_AXI_B_bready,
    M_AXI_B_bresp,
    M_AXI_B_bvalid,
    M_AXI_B_rdata,
    M_AXI_B_rid,
    M_AXI_B_rlast,
    M_AXI_B_rready,
    M_AXI_B_rresp,
    M_AXI_B_rvalid,
    M_AXI_B_wdata,
    M_AXI_B_wlast,
    M_AXI_B_wready,
    M_AXI_B_wstrb,
    M_AXI_B_wvalid,
    axi_aclk,
    axi_aresetn,
    pause_pci,
    pci_base,
    pci_range_err_strb,
    pci_size,
    pcie_mgt_0_rxn,
    pcie_mgt_0_rxp,
    pcie_mgt_0_txn,
    pcie_mgt_0_txp,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    resetn_in);
  input [511:0]AXIS_IN_tdata;
  input AXIS_IN_tlast;
  output AXIS_IN_tready;
  input AXIS_IN_tvalid;
  output [63:0]M_AXI_B_araddr;
  output [1:0]M_AXI_B_arburst;
  output [3:0]M_AXI_B_arcache;
  output [3:0]M_AXI_B_arid;
  output [7:0]M_AXI_B_arlen;
  output [0:0]M_AXI_B_arlock;
  output [2:0]M_AXI_B_arprot;
  input M_AXI_B_arready;
  output [2:0]M_AXI_B_arsize;
  output M_AXI_B_arvalid;
  output [63:0]M_AXI_B_awaddr;
  output [1:0]M_AXI_B_awburst;
  output [3:0]M_AXI_B_awcache;
  output [3:0]M_AXI_B_awid;
  output [7:0]M_AXI_B_awlen;
  output [0:0]M_AXI_B_awlock;
  output [2:0]M_AXI_B_awprot;
  input M_AXI_B_awready;
  output [2:0]M_AXI_B_awsize;
  output M_AXI_B_awvalid;
  input [3:0]M_AXI_B_bid;
  output M_AXI_B_bready;
  input [1:0]M_AXI_B_bresp;
  input M_AXI_B_bvalid;
  input [511:0]M_AXI_B_rdata;
  input [3:0]M_AXI_B_rid;
  input M_AXI_B_rlast;
  output M_AXI_B_rready;
  input [1:0]M_AXI_B_rresp;
  input M_AXI_B_rvalid;
  output [511:0]M_AXI_B_wdata;
  output M_AXI_B_wlast;
  input M_AXI_B_wready;
  output [63:0]M_AXI_B_wstrb;
  output M_AXI_B_wvalid;
  output axi_aclk;
  output axi_aresetn;
  input pause_pci;
  input [63:0]pci_base;
  output pci_range_err_strb;
  input [63:0]pci_size;
  input [15:0]pcie_mgt_0_rxn;
  input [15:0]pcie_mgt_0_rxp;
  output [15:0]pcie_mgt_0_txn;
  output [15:0]pcie_mgt_0_txp;
  input [0:0]pcie_refclk_clk_n;
  input [0:0]pcie_refclk_clk_p;
  input resetn_in;

  (* CONN_BUS_INFO = "AXIS_IN_1 xilinx.com:interface:axis:1.0 None TDATA" *) (* DONT_TOUCH *) wire [511:0]AXIS_IN_1_TDATA;
  (* CONN_BUS_INFO = "AXIS_IN_1 xilinx.com:interface:axis:1.0 None TLAST" *) (* DONT_TOUCH *) wire AXIS_IN_1_TLAST;
  (* CONN_BUS_INFO = "AXIS_IN_1 xilinx.com:interface:axis:1.0 None TREADY" *) (* DONT_TOUCH *) wire AXIS_IN_1_TREADY;
  (* CONN_BUS_INFO = "AXIS_IN_1 xilinx.com:interface:axis:1.0 None TVALID" *) (* DONT_TOUCH *) wire AXIS_IN_1_TVALID;
  wire [511:0]AXIS_IN_2_TDATA;
  wire AXIS_IN_2_TLAST;
  wire AXIS_IN_2_TREADY;
  wire AXIS_IN_2_TVALID;
  wire [0:0]CLK_IN_D_0_1_CLK_N;
  wire [0:0]CLK_IN_D_0_1_CLK_P;
  wire [511:0]axis_register_slice_M_AXIS_TDATA;
  wire axis_register_slice_M_AXIS_TLAST;
  wire axis_register_slice_M_AXIS_TREADY;
  wire axis_register_slice_M_AXIS_TVALID;
  wire [0:0]one_dout;
  wire pause_1;
  wire [63:0]pci_base_1;
  wire [63:0]pci_size_1;
  wire [63:0]pcie_bridge_M_AXI_B_ARADDR;
  wire [1:0]pcie_bridge_M_AXI_B_ARBURST;
  wire [3:0]pcie_bridge_M_AXI_B_ARCACHE;
  wire [3:0]pcie_bridge_M_AXI_B_ARID;
  wire [7:0]pcie_bridge_M_AXI_B_ARLEN;
  wire pcie_bridge_M_AXI_B_ARLOCK;
  wire [2:0]pcie_bridge_M_AXI_B_ARPROT;
  wire pcie_bridge_M_AXI_B_ARREADY;
  wire [2:0]pcie_bridge_M_AXI_B_ARSIZE;
  wire pcie_bridge_M_AXI_B_ARVALID;
  wire [63:0]pcie_bridge_M_AXI_B_AWADDR;
  wire [1:0]pcie_bridge_M_AXI_B_AWBURST;
  wire [3:0]pcie_bridge_M_AXI_B_AWCACHE;
  wire [3:0]pcie_bridge_M_AXI_B_AWID;
  wire [7:0]pcie_bridge_M_AXI_B_AWLEN;
  wire pcie_bridge_M_AXI_B_AWLOCK;
  wire [2:0]pcie_bridge_M_AXI_B_AWPROT;
  wire pcie_bridge_M_AXI_B_AWREADY;
  wire [2:0]pcie_bridge_M_AXI_B_AWSIZE;
  wire pcie_bridge_M_AXI_B_AWVALID;
  wire [3:0]pcie_bridge_M_AXI_B_BID;
  wire pcie_bridge_M_AXI_B_BREADY;
  wire [1:0]pcie_bridge_M_AXI_B_BRESP;
  wire pcie_bridge_M_AXI_B_BVALID;
  wire [511:0]pcie_bridge_M_AXI_B_RDATA;
  wire [3:0]pcie_bridge_M_AXI_B_RID;
  wire pcie_bridge_M_AXI_B_RLAST;
  wire pcie_bridge_M_AXI_B_RREADY;
  wire [1:0]pcie_bridge_M_AXI_B_RRESP;
  wire pcie_bridge_M_AXI_B_RVALID;
  wire [511:0]pcie_bridge_M_AXI_B_WDATA;
  wire pcie_bridge_M_AXI_B_WLAST;
  wire pcie_bridge_M_AXI_B_WREADY;
  wire [63:0]pcie_bridge_M_AXI_B_WSTRB;
  wire pcie_bridge_M_AXI_B_WVALID;
  wire pcie_bridge_axi_aclk;
  wire pcie_bridge_axi_aresetn;
  wire [15:0]pcie_bridge_pcie_mgt_rxn;
  wire [15:0]pcie_bridge_pcie_mgt_rxp;
  wire [15:0]pcie_bridge_pcie_mgt_txn;
  wire [15:0]pcie_bridge_pcie_mgt_txp;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARADDR" *) (* DONT_TOUCH *) wire [63:0]rdmx_to_pci_M_AXI_ARADDR;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARBURST" *) (* DONT_TOUCH *) wire [1:0]rdmx_to_pci_M_AXI_ARBURST;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARCACHE" *) (* DONT_TOUCH *) wire [3:0]rdmx_to_pci_M_AXI_ARCACHE;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARID" *) (* DONT_TOUCH *) wire [3:0]rdmx_to_pci_M_AXI_ARID;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLEN" *) (* DONT_TOUCH *) wire [7:0]rdmx_to_pci_M_AXI_ARLEN;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLOCK" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_ARLOCK;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARPROT" *) (* DONT_TOUCH *) wire [2:0]rdmx_to_pci_M_AXI_ARPROT;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARQOS" *) (* DONT_TOUCH *) wire [3:0]rdmx_to_pci_M_AXI_ARQOS;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARREADY" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_ARREADY;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARSIZE" *) (* DONT_TOUCH *) wire [2:0]rdmx_to_pci_M_AXI_ARSIZE;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 ARVALID" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_ARVALID;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWADDR" *) (* DONT_TOUCH *) wire [63:0]rdmx_to_pci_M_AXI_AWADDR;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWBURST" *) (* DONT_TOUCH *) wire [1:0]rdmx_to_pci_M_AXI_AWBURST;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWCACHE" *) (* DONT_TOUCH *) wire [3:0]rdmx_to_pci_M_AXI_AWCACHE;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWID" *) (* DONT_TOUCH *) wire [3:0]rdmx_to_pci_M_AXI_AWID;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLEN" *) (* DONT_TOUCH *) wire [7:0]rdmx_to_pci_M_AXI_AWLEN;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLOCK" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_AWLOCK;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWPROT" *) (* DONT_TOUCH *) wire [2:0]rdmx_to_pci_M_AXI_AWPROT;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWQOS" *) (* DONT_TOUCH *) wire [3:0]rdmx_to_pci_M_AXI_AWQOS;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWREADY" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_AWREADY;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWSIZE" *) (* DONT_TOUCH *) wire [2:0]rdmx_to_pci_M_AXI_AWSIZE;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 AWVALID" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_AWVALID;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 BID" *) (* DONT_TOUCH *) wire [3:0]rdmx_to_pci_M_AXI_BID;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 BREADY" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_BREADY;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 BRESP" *) (* DONT_TOUCH *) wire [1:0]rdmx_to_pci_M_AXI_BRESP;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 BVALID" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_BVALID;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 RDATA" *) (* DONT_TOUCH *) wire [511:0]rdmx_to_pci_M_AXI_RDATA;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 RID" *) (* DONT_TOUCH *) wire [3:0]rdmx_to_pci_M_AXI_RID;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 RLAST" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_RLAST;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 RREADY" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_RREADY;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 RRESP" *) (* DONT_TOUCH *) wire [1:0]rdmx_to_pci_M_AXI_RRESP;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 RVALID" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_RVALID;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 WDATA" *) (* DONT_TOUCH *) wire [511:0]rdmx_to_pci_M_AXI_WDATA;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 WLAST" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_WLAST;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 WREADY" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_WREADY;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 WSTRB" *) (* DONT_TOUCH *) wire [63:0]rdmx_to_pci_M_AXI_WSTRB;
  (* CONN_BUS_INFO = "rdmx_to_pci_M_AXI xilinx.com:interface:aximm:1.0 AXI4 WVALID" *) (* DONT_TOUCH *) wire rdmx_to_pci_M_AXI_WVALID;
  wire rdmx_to_pci_pci_range_err;
  wire resetn_in_1;
  wire [0:0]util_ds_buf_0_IBUF_DS_ODIV2;
  wire [0:0]util_ds_buf_0_IBUF_OUT;

  assign AXIS_IN_2_TDATA = AXIS_IN_tdata[511:0];
  assign AXIS_IN_2_TLAST = AXIS_IN_tlast;
  assign AXIS_IN_2_TVALID = AXIS_IN_tvalid;
  assign AXIS_IN_tready = AXIS_IN_2_TREADY;
  assign CLK_IN_D_0_1_CLK_N = pcie_refclk_clk_n[0];
  assign CLK_IN_D_0_1_CLK_P = pcie_refclk_clk_p[0];
  assign M_AXI_B_araddr[63:0] = pcie_bridge_M_AXI_B_ARADDR;
  assign M_AXI_B_arburst[1:0] = pcie_bridge_M_AXI_B_ARBURST;
  assign M_AXI_B_arcache[3:0] = pcie_bridge_M_AXI_B_ARCACHE;
  assign M_AXI_B_arid[3:0] = pcie_bridge_M_AXI_B_ARID;
  assign M_AXI_B_arlen[7:0] = pcie_bridge_M_AXI_B_ARLEN;
  assign M_AXI_B_arlock[0] = pcie_bridge_M_AXI_B_ARLOCK;
  assign M_AXI_B_arprot[2:0] = pcie_bridge_M_AXI_B_ARPROT;
  assign M_AXI_B_arsize[2:0] = pcie_bridge_M_AXI_B_ARSIZE;
  assign M_AXI_B_arvalid = pcie_bridge_M_AXI_B_ARVALID;
  assign M_AXI_B_awaddr[63:0] = pcie_bridge_M_AXI_B_AWADDR;
  assign M_AXI_B_awburst[1:0] = pcie_bridge_M_AXI_B_AWBURST;
  assign M_AXI_B_awcache[3:0] = pcie_bridge_M_AXI_B_AWCACHE;
  assign M_AXI_B_awid[3:0] = pcie_bridge_M_AXI_B_AWID;
  assign M_AXI_B_awlen[7:0] = pcie_bridge_M_AXI_B_AWLEN;
  assign M_AXI_B_awlock[0] = pcie_bridge_M_AXI_B_AWLOCK;
  assign M_AXI_B_awprot[2:0] = pcie_bridge_M_AXI_B_AWPROT;
  assign M_AXI_B_awsize[2:0] = pcie_bridge_M_AXI_B_AWSIZE;
  assign M_AXI_B_awvalid = pcie_bridge_M_AXI_B_AWVALID;
  assign M_AXI_B_bready = pcie_bridge_M_AXI_B_BREADY;
  assign M_AXI_B_rready = pcie_bridge_M_AXI_B_RREADY;
  assign M_AXI_B_wdata[511:0] = pcie_bridge_M_AXI_B_WDATA;
  assign M_AXI_B_wlast = pcie_bridge_M_AXI_B_WLAST;
  assign M_AXI_B_wstrb[63:0] = pcie_bridge_M_AXI_B_WSTRB;
  assign M_AXI_B_wvalid = pcie_bridge_M_AXI_B_WVALID;
  assign axi_aclk = pcie_bridge_axi_aclk;
  assign axi_aresetn = pcie_bridge_axi_aresetn;
  assign pause_1 = pause_pci;
  assign pci_base_1 = pci_base[63:0];
  assign pci_range_err_strb = rdmx_to_pci_pci_range_err;
  assign pci_size_1 = pci_size[63:0];
  assign pcie_bridge_M_AXI_B_ARREADY = M_AXI_B_arready;
  assign pcie_bridge_M_AXI_B_AWREADY = M_AXI_B_awready;
  assign pcie_bridge_M_AXI_B_BID = M_AXI_B_bid[3:0];
  assign pcie_bridge_M_AXI_B_BRESP = M_AXI_B_bresp[1:0];
  assign pcie_bridge_M_AXI_B_BVALID = M_AXI_B_bvalid;
  assign pcie_bridge_M_AXI_B_RDATA = M_AXI_B_rdata[511:0];
  assign pcie_bridge_M_AXI_B_RID = M_AXI_B_rid[3:0];
  assign pcie_bridge_M_AXI_B_RLAST = M_AXI_B_rlast;
  assign pcie_bridge_M_AXI_B_RRESP = M_AXI_B_rresp[1:0];
  assign pcie_bridge_M_AXI_B_RVALID = M_AXI_B_rvalid;
  assign pcie_bridge_M_AXI_B_WREADY = M_AXI_B_wready;
  assign pcie_bridge_pcie_mgt_rxn = pcie_mgt_0_rxn[15:0];
  assign pcie_bridge_pcie_mgt_rxp = pcie_mgt_0_rxp[15:0];
  assign pcie_mgt_0_txn[15:0] = pcie_bridge_pcie_mgt_txn;
  assign pcie_mgt_0_txp[15:0] = pcie_bridge_pcie_mgt_txp;
  assign resetn_in_1 = resetn_in;
  top_level_axis_register_slice_0_0 axis_register_slice
       (.aclk(pcie_bridge_axi_aclk),
        .aresetn(resetn_in_1),
        .m_axis_tdata(axis_register_slice_M_AXIS_TDATA),
        .m_axis_tlast(axis_register_slice_M_AXIS_TLAST),
        .m_axis_tready(axis_register_slice_M_AXIS_TREADY),
        .m_axis_tvalid(axis_register_slice_M_AXIS_TVALID),
        .s_axis_tdata(AXIS_IN_2_TDATA),
        .s_axis_tlast(AXIS_IN_2_TLAST),
        .s_axis_tready(AXIS_IN_2_TREADY),
        .s_axis_tvalid(AXIS_IN_2_TVALID));
  top_level_axis_throttle_0_0 axis_throttle
       (.axis_in_tdata(axis_register_slice_M_AXIS_TDATA),
        .axis_in_tlast(axis_register_slice_M_AXIS_TLAST),
        .axis_in_tready(axis_register_slice_M_AXIS_TREADY),
        .axis_in_tvalid(axis_register_slice_M_AXIS_TVALID),
        .axis_out_tdata(AXIS_IN_1_TDATA),
        .axis_out_tlast(AXIS_IN_1_TLAST),
        .axis_out_tready(AXIS_IN_1_TREADY),
        .axis_out_tvalid(AXIS_IN_1_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .pause(pause_1));
  top_level_xlconstant_0_1 one
       (.dout(one_dout));
  top_level_xdma_0_0 pcie_bridge
       (.axi_aclk(pcie_bridge_axi_aclk),
        .axi_aresetn(pcie_bridge_axi_aresetn),
        .m_axib_araddr(pcie_bridge_M_AXI_B_ARADDR),
        .m_axib_arburst(pcie_bridge_M_AXI_B_ARBURST),
        .m_axib_arcache(pcie_bridge_M_AXI_B_ARCACHE),
        .m_axib_arid(pcie_bridge_M_AXI_B_ARID),
        .m_axib_arlen(pcie_bridge_M_AXI_B_ARLEN),
        .m_axib_arlock(pcie_bridge_M_AXI_B_ARLOCK),
        .m_axib_arprot(pcie_bridge_M_AXI_B_ARPROT),
        .m_axib_arready(pcie_bridge_M_AXI_B_ARREADY),
        .m_axib_arsize(pcie_bridge_M_AXI_B_ARSIZE),
        .m_axib_arvalid(pcie_bridge_M_AXI_B_ARVALID),
        .m_axib_awaddr(pcie_bridge_M_AXI_B_AWADDR),
        .m_axib_awburst(pcie_bridge_M_AXI_B_AWBURST),
        .m_axib_awcache(pcie_bridge_M_AXI_B_AWCACHE),
        .m_axib_awid(pcie_bridge_M_AXI_B_AWID),
        .m_axib_awlen(pcie_bridge_M_AXI_B_AWLEN),
        .m_axib_awlock(pcie_bridge_M_AXI_B_AWLOCK),
        .m_axib_awprot(pcie_bridge_M_AXI_B_AWPROT),
        .m_axib_awready(pcie_bridge_M_AXI_B_AWREADY),
        .m_axib_awsize(pcie_bridge_M_AXI_B_AWSIZE),
        .m_axib_awvalid(pcie_bridge_M_AXI_B_AWVALID),
        .m_axib_bid(pcie_bridge_M_AXI_B_BID),
        .m_axib_bready(pcie_bridge_M_AXI_B_BREADY),
        .m_axib_bresp(pcie_bridge_M_AXI_B_BRESP),
        .m_axib_bvalid(pcie_bridge_M_AXI_B_BVALID),
        .m_axib_rdata(pcie_bridge_M_AXI_B_RDATA),
        .m_axib_rid(pcie_bridge_M_AXI_B_RID),
        .m_axib_rlast(pcie_bridge_M_AXI_B_RLAST),
        .m_axib_rready(pcie_bridge_M_AXI_B_RREADY),
        .m_axib_rresp(pcie_bridge_M_AXI_B_RRESP),
        .m_axib_rvalid(pcie_bridge_M_AXI_B_RVALID),
        .m_axib_wdata(pcie_bridge_M_AXI_B_WDATA),
        .m_axib_wlast(pcie_bridge_M_AXI_B_WLAST),
        .m_axib_wready(pcie_bridge_M_AXI_B_WREADY),
        .m_axib_wstrb(pcie_bridge_M_AXI_B_WSTRB),
        .m_axib_wvalid(pcie_bridge_M_AXI_B_WVALID),
        .pci_exp_rxn(pcie_bridge_pcie_mgt_rxn),
        .pci_exp_rxp(pcie_bridge_pcie_mgt_rxp),
        .pci_exp_txn(pcie_bridge_pcie_mgt_txn),
        .pci_exp_txp(pcie_bridge_pcie_mgt_txp),
        .s_axib_araddr(rdmx_to_pci_M_AXI_ARADDR),
        .s_axib_arburst(rdmx_to_pci_M_AXI_ARBURST),
        .s_axib_arid(rdmx_to_pci_M_AXI_ARID),
        .s_axib_arlen(rdmx_to_pci_M_AXI_ARLEN),
        .s_axib_arready(rdmx_to_pci_M_AXI_ARREADY),
        .s_axib_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axib_arsize(rdmx_to_pci_M_AXI_ARSIZE),
        .s_axib_arvalid(rdmx_to_pci_M_AXI_ARVALID),
        .s_axib_awaddr(rdmx_to_pci_M_AXI_AWADDR),
        .s_axib_awburst(rdmx_to_pci_M_AXI_AWBURST),
        .s_axib_awid(rdmx_to_pci_M_AXI_AWID),
        .s_axib_awlen(rdmx_to_pci_M_AXI_AWLEN),
        .s_axib_awready(rdmx_to_pci_M_AXI_AWREADY),
        .s_axib_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axib_awsize(rdmx_to_pci_M_AXI_AWSIZE),
        .s_axib_awvalid(rdmx_to_pci_M_AXI_AWVALID),
        .s_axib_bid(rdmx_to_pci_M_AXI_BID),
        .s_axib_bready(rdmx_to_pci_M_AXI_BREADY),
        .s_axib_bresp(rdmx_to_pci_M_AXI_BRESP),
        .s_axib_bvalid(rdmx_to_pci_M_AXI_BVALID),
        .s_axib_rdata(rdmx_to_pci_M_AXI_RDATA),
        .s_axib_rid(rdmx_to_pci_M_AXI_RID),
        .s_axib_rlast(rdmx_to_pci_M_AXI_RLAST),
        .s_axib_rready(rdmx_to_pci_M_AXI_RREADY),
        .s_axib_rresp(rdmx_to_pci_M_AXI_RRESP),
        .s_axib_rvalid(rdmx_to_pci_M_AXI_RVALID),
        .s_axib_wdata(rdmx_to_pci_M_AXI_WDATA),
        .s_axib_wlast(rdmx_to_pci_M_AXI_WLAST),
        .s_axib_wready(rdmx_to_pci_M_AXI_WREADY),
        .s_axib_wstrb(rdmx_to_pci_M_AXI_WSTRB),
        .s_axib_wvalid(rdmx_to_pci_M_AXI_WVALID),
        .s_axil_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axil_arprot({1'b0,1'b0,1'b0}),
        .s_axil_arvalid(1'b0),
        .s_axil_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axil_awprot({1'b0,1'b0,1'b0}),
        .s_axil_awvalid(1'b0),
        .s_axil_bready(1'b0),
        .s_axil_rready(1'b0),
        .s_axil_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axil_wstrb({1'b1,1'b1,1'b1,1'b1}),
        .s_axil_wvalid(1'b0),
        .sys_clk(util_ds_buf_0_IBUF_DS_ODIV2),
        .sys_clk_gt(util_ds_buf_0_IBUF_OUT),
        .sys_rst_n(one_dout),
        .usr_irq_req(1'b0));
  top_level_rdmx_to_pci_0_0 rdmx_to_pci
       (.AXIS_IN_TDATA(AXIS_IN_1_TDATA),
        .AXIS_IN_TREADY(AXIS_IN_1_TREADY),
        .AXIS_IN_TVALID(AXIS_IN_1_TVALID),
        .M_AXI_ARADDR(rdmx_to_pci_M_AXI_ARADDR),
        .M_AXI_ARBURST(rdmx_to_pci_M_AXI_ARBURST),
        .M_AXI_ARCACHE(rdmx_to_pci_M_AXI_ARCACHE),
        .M_AXI_ARID(rdmx_to_pci_M_AXI_ARID),
        .M_AXI_ARLEN(rdmx_to_pci_M_AXI_ARLEN),
        .M_AXI_ARLOCK(rdmx_to_pci_M_AXI_ARLOCK),
        .M_AXI_ARPROT(rdmx_to_pci_M_AXI_ARPROT),
        .M_AXI_ARQOS(rdmx_to_pci_M_AXI_ARQOS),
        .M_AXI_ARREADY(rdmx_to_pci_M_AXI_ARREADY),
        .M_AXI_ARSIZE(rdmx_to_pci_M_AXI_ARSIZE),
        .M_AXI_ARVALID(rdmx_to_pci_M_AXI_ARVALID),
        .M_AXI_AWADDR(rdmx_to_pci_M_AXI_AWADDR),
        .M_AXI_AWBURST(rdmx_to_pci_M_AXI_AWBURST),
        .M_AXI_AWCACHE(rdmx_to_pci_M_AXI_AWCACHE),
        .M_AXI_AWID(rdmx_to_pci_M_AXI_AWID),
        .M_AXI_AWLEN(rdmx_to_pci_M_AXI_AWLEN),
        .M_AXI_AWLOCK(rdmx_to_pci_M_AXI_AWLOCK),
        .M_AXI_AWPROT(rdmx_to_pci_M_AXI_AWPROT),
        .M_AXI_AWQOS(rdmx_to_pci_M_AXI_AWQOS),
        .M_AXI_AWREADY(rdmx_to_pci_M_AXI_AWREADY),
        .M_AXI_AWSIZE(rdmx_to_pci_M_AXI_AWSIZE),
        .M_AXI_AWVALID(rdmx_to_pci_M_AXI_AWVALID),
        .M_AXI_BREADY(rdmx_to_pci_M_AXI_BREADY),
        .M_AXI_BRESP(rdmx_to_pci_M_AXI_BRESP),
        .M_AXI_BVALID(rdmx_to_pci_M_AXI_BVALID),
        .M_AXI_RDATA(rdmx_to_pci_M_AXI_RDATA),
        .M_AXI_RLAST(rdmx_to_pci_M_AXI_RLAST),
        .M_AXI_RREADY(rdmx_to_pci_M_AXI_RREADY),
        .M_AXI_RRESP(rdmx_to_pci_M_AXI_RRESP),
        .M_AXI_RVALID(rdmx_to_pci_M_AXI_RVALID),
        .M_AXI_WDATA(rdmx_to_pci_M_AXI_WDATA),
        .M_AXI_WLAST(rdmx_to_pci_M_AXI_WLAST),
        .M_AXI_WREADY(rdmx_to_pci_M_AXI_WREADY),
        .M_AXI_WSTRB(rdmx_to_pci_M_AXI_WSTRB),
        .M_AXI_WVALID(rdmx_to_pci_M_AXI_WVALID),
        .clk(pcie_bridge_axi_aclk),
        .pci_base(pci_base_1),
        .pci_range_err_strb(rdmx_to_pci_pci_range_err),
        .pci_size(pci_size_1),
        .resetn(resetn_in_1));
  top_level_system_ila_0_4 system_ila
       (.SLOT_0_AXIS_tdata(AXIS_IN_1_TDATA),
        .SLOT_0_AXIS_tlast(AXIS_IN_1_TLAST),
        .SLOT_0_AXIS_tready(AXIS_IN_1_TREADY),
        .SLOT_0_AXIS_tvalid(AXIS_IN_1_TVALID),
        .SLOT_1_AXI_araddr(rdmx_to_pci_M_AXI_ARADDR),
        .SLOT_1_AXI_arburst(rdmx_to_pci_M_AXI_ARBURST),
        .SLOT_1_AXI_arcache(rdmx_to_pci_M_AXI_ARCACHE),
        .SLOT_1_AXI_arid(rdmx_to_pci_M_AXI_ARID),
        .SLOT_1_AXI_arlen(rdmx_to_pci_M_AXI_ARLEN),
        .SLOT_1_AXI_arlock(rdmx_to_pci_M_AXI_ARLOCK),
        .SLOT_1_AXI_arprot(rdmx_to_pci_M_AXI_ARPROT),
        .SLOT_1_AXI_arqos(rdmx_to_pci_M_AXI_ARQOS),
        .SLOT_1_AXI_arready(rdmx_to_pci_M_AXI_ARREADY),
        .SLOT_1_AXI_arsize(rdmx_to_pci_M_AXI_ARSIZE),
        .SLOT_1_AXI_arvalid(rdmx_to_pci_M_AXI_ARVALID),
        .SLOT_1_AXI_awaddr(rdmx_to_pci_M_AXI_AWADDR),
        .SLOT_1_AXI_awburst(rdmx_to_pci_M_AXI_AWBURST),
        .SLOT_1_AXI_awcache(rdmx_to_pci_M_AXI_AWCACHE),
        .SLOT_1_AXI_awid(rdmx_to_pci_M_AXI_AWID),
        .SLOT_1_AXI_awlen(rdmx_to_pci_M_AXI_AWLEN),
        .SLOT_1_AXI_awlock(rdmx_to_pci_M_AXI_AWLOCK),
        .SLOT_1_AXI_awprot(rdmx_to_pci_M_AXI_AWPROT),
        .SLOT_1_AXI_awqos(rdmx_to_pci_M_AXI_AWQOS),
        .SLOT_1_AXI_awready(rdmx_to_pci_M_AXI_AWREADY),
        .SLOT_1_AXI_awsize(rdmx_to_pci_M_AXI_AWSIZE),
        .SLOT_1_AXI_awvalid(rdmx_to_pci_M_AXI_AWVALID),
        .SLOT_1_AXI_bid(rdmx_to_pci_M_AXI_BID),
        .SLOT_1_AXI_bready(rdmx_to_pci_M_AXI_BREADY),
        .SLOT_1_AXI_bresp(rdmx_to_pci_M_AXI_BRESP),
        .SLOT_1_AXI_bvalid(rdmx_to_pci_M_AXI_BVALID),
        .SLOT_1_AXI_rdata(rdmx_to_pci_M_AXI_RDATA),
        .SLOT_1_AXI_rid(rdmx_to_pci_M_AXI_RID),
        .SLOT_1_AXI_rlast(rdmx_to_pci_M_AXI_RLAST),
        .SLOT_1_AXI_rready(rdmx_to_pci_M_AXI_RREADY),
        .SLOT_1_AXI_rresp(rdmx_to_pci_M_AXI_RRESP),
        .SLOT_1_AXI_rvalid(rdmx_to_pci_M_AXI_RVALID),
        .SLOT_1_AXI_wdata(rdmx_to_pci_M_AXI_WDATA),
        .SLOT_1_AXI_wlast(rdmx_to_pci_M_AXI_WLAST),
        .SLOT_1_AXI_wready(rdmx_to_pci_M_AXI_WREADY),
        .SLOT_1_AXI_wstrb(rdmx_to_pci_M_AXI_WSTRB),
        .SLOT_1_AXI_wvalid(rdmx_to_pci_M_AXI_WVALID),
        .clk(pcie_bridge_axi_aclk),
        .resetn(1'b1));
  top_level_util_ds_buf_0_0 util_ds_buf_0
       (.IBUF_DS_N(CLK_IN_D_0_1_CLK_N),
        .IBUF_DS_ODIV2(util_ds_buf_0_IBUF_DS_ODIV2),
        .IBUF_DS_P(CLK_IN_D_0_1_CLK_P),
        .IBUF_OUT(util_ds_buf_0_IBUF_OUT));
endmodule

module qsfp_imp_1O96RWM
   (axis_rx_tdata,
    axis_rx_tlast,
    axis_rx_tready,
    axis_rx_tvalid,
    axis_tx_a_tdata,
    axis_tx_a_tready,
    axis_tx_a_tvalid,
    clk,
    gen_idle,
    gen_packets,
    gt_ref_clk_clk_n,
    gt_ref_clk_clk_p,
    gt_serial_port_grx_n,
    gt_serial_port_grx_p,
    gt_serial_port_gtx_n,
    gt_serial_port_gtx_p,
    init_clk,
    led_green_l,
    led_orange_l,
    max_packets,
    qsfp_lp,
    qsfp_rst_l,
    resetn,
    rx_aligned);
  output [511:0]axis_rx_tdata;
  output axis_rx_tlast;
  input axis_rx_tready;
  output axis_rx_tvalid;
  input [511:0]axis_tx_a_tdata;
  output axis_tx_a_tready;
  input axis_tx_a_tvalid;
  input clk;
  output gen_idle;
  input gen_packets;
  input gt_ref_clk_clk_n;
  input gt_ref_clk_clk_p;
  input [3:0]gt_serial_port_grx_n;
  input [3:0]gt_serial_port_grx_p;
  output [3:0]gt_serial_port_gtx_n;
  output [3:0]gt_serial_port_gtx_p;
  input init_clk;
  output [3:0]led_green_l;
  output [3:0]led_orange_l;
  input [63:0]max_packets;
  output [1:0]qsfp_lp;
  output [1:0]qsfp_rst_l;
  input resetn;
  output rx_aligned;

  wire Conn1_CLK_N;
  wire Conn1_CLK_P;
  wire [3:0]Conn2_GRX_N;
  wire [3:0]Conn2_GRX_P;
  wire [3:0]Conn2_GTX_N;
  wire [3:0]Conn2_GTX_P;
  wire [511:0]axis_mux_0_axis_out_TDATA;
  wire axis_mux_0_axis_out_TLAST;
  wire axis_mux_0_axis_out_TREADY;
  wire axis_mux_0_axis_out_TVALID;
  wire [511:0]axis_tx_a_1_TDATA;
  wire axis_tx_a_1_TREADY;
  wire axis_tx_a_1_TVALID;
  wire [511:0]ethernet_axis_rx_TDATA;
  wire ethernet_axis_rx_TLAST;
  wire ethernet_axis_rx_TREADY;
  wire ethernet_axis_rx_TVALID;
  wire ethernet_rx_aligned;
  wire init_clk_1;
  wire [63:0]max_packets_1;
  wire [511:0]packet_gen_axis_TDATA;
  wire packet_gen_axis_TLAST;
  wire packet_gen_axis_TREADY;
  wire packet_gen_axis_TVALID;
  wire packet_gen_idle;
  wire [511:0]packetizer_0_axis_out_TDATA;
  wire [63:0]packetizer_0_axis_out_TKEEP;
  wire packetizer_0_axis_out_TLAST;
  wire packetizer_0_axis_out_TREADY;
  wire packetizer_0_axis_out_TVALID;
  wire pcie_bridge_axi_aclk;
  wire pcie_bridge_axi_aresetn;
  wire [1:0]qsfp_pins_0_qsfp_lp;
  wire [1:0]qsfp_pins_0_qsfp_rst_l;
  wire start_1;
  wire [3:0]status_leds_led_green_l;
  wire [3:0]status_leds_led_orange_l;

  assign Conn1_CLK_N = gt_ref_clk_clk_n;
  assign Conn1_CLK_P = gt_ref_clk_clk_p;
  assign Conn2_GRX_N = gt_serial_port_grx_n[3:0];
  assign Conn2_GRX_P = gt_serial_port_grx_p[3:0];
  assign axis_mux_0_axis_out_TREADY = axis_rx_tready;
  assign axis_rx_tdata[511:0] = axis_mux_0_axis_out_TDATA;
  assign axis_rx_tlast = axis_mux_0_axis_out_TLAST;
  assign axis_rx_tvalid = axis_mux_0_axis_out_TVALID;
  assign axis_tx_a_1_TDATA = axis_tx_a_tdata[511:0];
  assign axis_tx_a_1_TVALID = axis_tx_a_tvalid;
  assign axis_tx_a_tready = axis_tx_a_1_TREADY;
  assign gen_idle = packet_gen_idle;
  assign gt_serial_port_gtx_n[3:0] = Conn2_GTX_N;
  assign gt_serial_port_gtx_p[3:0] = Conn2_GTX_P;
  assign init_clk_1 = init_clk;
  assign led_green_l[3:0] = status_leds_led_green_l;
  assign led_orange_l[3:0] = status_leds_led_orange_l;
  assign max_packets_1 = max_packets[63:0];
  assign pcie_bridge_axi_aclk = clk;
  assign pcie_bridge_axi_aresetn = resetn;
  assign qsfp_lp[1:0] = qsfp_pins_0_qsfp_lp;
  assign qsfp_rst_l[1:0] = qsfp_pins_0_qsfp_rst_l;
  assign rx_aligned = ethernet_rx_aligned;
  assign start_1 = gen_packets;
  top_level_axis_mux_0_1 axis_mux
       (.axis0_tdata(packet_gen_axis_TDATA),
        .axis0_tlast(packet_gen_axis_TLAST),
        .axis0_tready(packet_gen_axis_TREADY),
        .axis0_tvalid(packet_gen_axis_TVALID),
        .axis1_tdata(ethernet_axis_rx_TDATA),
        .axis1_tlast(ethernet_axis_rx_TLAST),
        .axis1_tready(ethernet_axis_rx_TREADY),
        .axis1_tvalid(ethernet_axis_rx_TVALID),
        .axis_out_tdata(axis_mux_0_axis_out_TDATA),
        .axis_out_tlast(axis_mux_0_axis_out_TLAST),
        .axis_out_tready(axis_mux_0_axis_out_TREADY),
        .axis_out_tvalid(axis_mux_0_axis_out_TVALID),
        .clk(pcie_bridge_axi_aclk));
  ethernet_imp_1VUOSMD ethernet
       (.axis_rx_tdata(ethernet_axis_rx_TDATA),
        .axis_rx_tlast(ethernet_axis_rx_TLAST),
        .axis_rx_tready(ethernet_axis_rx_TREADY),
        .axis_rx_tvalid(ethernet_axis_rx_TVALID),
        .axis_tx_tdata(packetizer_0_axis_out_TDATA),
        .axis_tx_tkeep(packetizer_0_axis_out_TKEEP),
        .axis_tx_tlast(packetizer_0_axis_out_TLAST),
        .axis_tx_tready(packetizer_0_axis_out_TREADY),
        .axis_tx_tvalid(packetizer_0_axis_out_TVALID),
        .gt_ref_clk_clk_n(Conn1_CLK_N),
        .gt_ref_clk_clk_p(Conn1_CLK_P),
        .gt_serial_port_grx_n(Conn2_GRX_N),
        .gt_serial_port_grx_p(Conn2_GRX_P),
        .gt_serial_port_gtx_n(Conn2_GTX_N),
        .gt_serial_port_gtx_p(Conn2_GTX_P),
        .init_clk(init_clk_1),
        .rx_aligned(ethernet_rx_aligned),
        .sys_clk(pcie_bridge_axi_aclk),
        .sys_resetn_in(pcie_bridge_axi_aresetn));
  top_level_packet_gen_0_0 packet_gen
       (.axis_tdata(packet_gen_axis_TDATA),
        .axis_tlast(packet_gen_axis_TLAST),
        .axis_tready(packet_gen_axis_TREADY),
        .axis_tvalid(packet_gen_axis_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .idle(packet_gen_idle),
        .max_packets(max_packets_1),
        .resetn(pcie_bridge_axi_aresetn),
        .start(start_1));
  top_level_qsfp_pins_0_0 qsfp_pins
       (.qsfp_lp(qsfp_pins_0_qsfp_lp),
        .qsfp_rst_l(qsfp_pins_0_qsfp_rst_l));
  repacketizer_imp_1SILZWM repacketizer
       (.axis_in_tdata(axis_tx_a_1_TDATA),
        .axis_in_tready(axis_tx_a_1_TREADY),
        .axis_in_tvalid(axis_tx_a_1_TVALID),
        .axis_monitor_tdata(axis_mux_0_axis_out_TDATA),
        .axis_monitor_tlast(axis_mux_0_axis_out_TLAST),
        .axis_monitor_tready(axis_mux_0_axis_out_TREADY),
        .axis_monitor_tvalid(axis_mux_0_axis_out_TVALID),
        .axis_out_tdata(packetizer_0_axis_out_TDATA),
        .axis_out_tkeep(packetizer_0_axis_out_TKEEP),
        .axis_out_tlast(packetizer_0_axis_out_TLAST),
        .axis_out_tready(packetizer_0_axis_out_TREADY),
        .axis_out_tvalid(packetizer_0_axis_out_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .resetn(pcie_bridge_axi_aresetn));
  top_level_status_leds_0_0 status_leds
       (.led_green_l(status_leds_led_green_l),
        .led_orange_l(status_leds_led_orange_l),
        .qsfp0_up(ethernet_rx_aligned));
endmodule

module repacketizer_imp_1SILZWM
   (axis_in_tdata,
    axis_in_tready,
    axis_in_tvalid,
    axis_monitor_tdata,
    axis_monitor_tlast,
    axis_monitor_tready,
    axis_monitor_tvalid,
    axis_out_tdata,
    axis_out_tkeep,
    axis_out_tlast,
    axis_out_tready,
    axis_out_tvalid,
    clk,
    resetn);
  input [511:0]axis_in_tdata;
  output axis_in_tready;
  input axis_in_tvalid;
  input [511:0]axis_monitor_tdata;
  input axis_monitor_tlast;
  input axis_monitor_tready;
  input axis_monitor_tvalid;
  output [511:0]axis_out_tdata;
  output [63:0]axis_out_tkeep;
  output axis_out_tlast;
  input axis_out_tready;
  output axis_out_tvalid;
  input clk;
  input resetn;

  wire [511:0]axis_mux_0_axis_out_TDATA;
  wire axis_mux_0_axis_out_TLAST;
  wire axis_mux_0_axis_out_TREADY;
  wire axis_mux_0_axis_out_TVALID;
  wire [511:0]axis_tx_a_1_TDATA;
  wire axis_tx_a_1_TREADY;
  wire axis_tx_a_1_TVALID;
  wire [7:0]packet_sizer_packet_cycles;
  wire [511:0]packetizer_0_axis_out_TDATA;
  wire [63:0]packetizer_0_axis_out_TKEEP;
  wire packetizer_0_axis_out_TLAST;
  wire packetizer_0_axis_out_TREADY;
  wire packetizer_0_axis_out_TVALID;
  wire pcie_bridge_axi_aclk;
  wire pcie_bridge_axi_aresetn;

  assign axis_in_tready = axis_tx_a_1_TREADY;
  assign axis_mux_0_axis_out_TDATA = axis_monitor_tdata[511:0];
  assign axis_mux_0_axis_out_TLAST = axis_monitor_tlast;
  assign axis_mux_0_axis_out_TREADY = axis_monitor_tready;
  assign axis_mux_0_axis_out_TVALID = axis_monitor_tvalid;
  assign axis_out_tdata[511:0] = packetizer_0_axis_out_TDATA;
  assign axis_out_tkeep[63:0] = packetizer_0_axis_out_TKEEP;
  assign axis_out_tlast = packetizer_0_axis_out_TLAST;
  assign axis_out_tvalid = packetizer_0_axis_out_TVALID;
  assign axis_tx_a_1_TDATA = axis_in_tdata[511:0];
  assign axis_tx_a_1_TVALID = axis_in_tvalid;
  assign packetizer_0_axis_out_TREADY = axis_out_tready;
  assign pcie_bridge_axi_aclk = clk;
  assign pcie_bridge_axi_aresetn = resetn;
  top_level_packet_sizer_0_0 packet_sizer
       (.axis_tdata(axis_mux_0_axis_out_TDATA),
        .axis_tlast(axis_mux_0_axis_out_TLAST),
        .axis_tready(axis_mux_0_axis_out_TREADY),
        .axis_tvalid(axis_mux_0_axis_out_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .packet_cycles(packet_sizer_packet_cycles),
        .resetn(pcie_bridge_axi_aresetn));
  top_level_packetizer_0_0 packetizer
       (.axis_in_tdata(axis_tx_a_1_TDATA),
        .axis_in_tready(axis_tx_a_1_TREADY),
        .axis_in_tvalid(axis_tx_a_1_TVALID),
        .axis_out_tdata(packetizer_0_axis_out_TDATA),
        .axis_out_tkeep(packetizer_0_axis_out_TKEEP),
        .axis_out_tlast(packetizer_0_axis_out_TLAST),
        .axis_out_tready(packetizer_0_axis_out_TREADY),
        .axis_out_tvalid(packetizer_0_axis_out_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .packet_cycles(packet_sizer_packet_cycles),
        .resetn(pcie_bridge_axi_aresetn));
endmodule

module system_interconnect_imp_1433GC4
   (M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    aclk,
    aresetn);
  output [7:0]M01_AXI_araddr;
  output [2:0]M01_AXI_arprot;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [7:0]M01_AXI_awaddr;
  output [2:0]M01_AXI_awprot;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input [63:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [3:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input [0:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [63:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [3:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [3:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [511:0]S00_AXI_rdata;
  output [3:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [511:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;
  input aclk;
  input aresetn;

  wire [63:0]pcie_bridge_M_AXI_B_ARADDR;
  wire [1:0]pcie_bridge_M_AXI_B_ARBURST;
  wire [3:0]pcie_bridge_M_AXI_B_ARCACHE;
  wire [3:0]pcie_bridge_M_AXI_B_ARID;
  wire [7:0]pcie_bridge_M_AXI_B_ARLEN;
  wire [0:0]pcie_bridge_M_AXI_B_ARLOCK;
  wire [2:0]pcie_bridge_M_AXI_B_ARPROT;
  wire pcie_bridge_M_AXI_B_ARREADY;
  wire [2:0]pcie_bridge_M_AXI_B_ARSIZE;
  wire pcie_bridge_M_AXI_B_ARVALID;
  wire [63:0]pcie_bridge_M_AXI_B_AWADDR;
  wire [1:0]pcie_bridge_M_AXI_B_AWBURST;
  wire [3:0]pcie_bridge_M_AXI_B_AWCACHE;
  wire [3:0]pcie_bridge_M_AXI_B_AWID;
  wire [7:0]pcie_bridge_M_AXI_B_AWLEN;
  wire [0:0]pcie_bridge_M_AXI_B_AWLOCK;
  wire [2:0]pcie_bridge_M_AXI_B_AWPROT;
  wire pcie_bridge_M_AXI_B_AWREADY;
  wire [2:0]pcie_bridge_M_AXI_B_AWSIZE;
  wire pcie_bridge_M_AXI_B_AWVALID;
  wire [3:0]pcie_bridge_M_AXI_B_BID;
  wire pcie_bridge_M_AXI_B_BREADY;
  wire [1:0]pcie_bridge_M_AXI_B_BRESP;
  wire pcie_bridge_M_AXI_B_BVALID;
  wire [511:0]pcie_bridge_M_AXI_B_RDATA;
  wire [3:0]pcie_bridge_M_AXI_B_RID;
  wire pcie_bridge_M_AXI_B_RLAST;
  wire pcie_bridge_M_AXI_B_RREADY;
  wire [1:0]pcie_bridge_M_AXI_B_RRESP;
  wire pcie_bridge_M_AXI_B_RVALID;
  wire [511:0]pcie_bridge_M_AXI_B_WDATA;
  wire pcie_bridge_M_AXI_B_WLAST;
  wire pcie_bridge_M_AXI_B_WREADY;
  wire [63:0]pcie_bridge_M_AXI_B_WSTRB;
  wire pcie_bridge_M_AXI_B_WVALID;
  wire pcie_bridge_axi_aclk;
  wire pcie_bridge_axi_aresetn;
  wire [4:0]system_interconnect_M00_AXI_ARADDR;
  wire [2:0]system_interconnect_M00_AXI_ARPROT;
  wire system_interconnect_M00_AXI_ARREADY;
  wire system_interconnect_M00_AXI_ARVALID;
  wire [4:0]system_interconnect_M00_AXI_AWADDR;
  wire [2:0]system_interconnect_M00_AXI_AWPROT;
  wire system_interconnect_M00_AXI_AWREADY;
  wire system_interconnect_M00_AXI_AWVALID;
  wire system_interconnect_M00_AXI_BREADY;
  wire [1:0]system_interconnect_M00_AXI_BRESP;
  wire system_interconnect_M00_AXI_BVALID;
  wire [31:0]system_interconnect_M00_AXI_RDATA;
  wire system_interconnect_M00_AXI_RREADY;
  wire [1:0]system_interconnect_M00_AXI_RRESP;
  wire system_interconnect_M00_AXI_RVALID;
  wire [31:0]system_interconnect_M00_AXI_WDATA;
  wire system_interconnect_M00_AXI_WREADY;
  wire [3:0]system_interconnect_M00_AXI_WSTRB;
  wire system_interconnect_M00_AXI_WVALID;
  wire [7:0]system_interconnect_M01_AXI_ARADDR;
  wire [2:0]system_interconnect_M01_AXI_ARPROT;
  wire system_interconnect_M01_AXI_ARREADY;
  wire system_interconnect_M01_AXI_ARVALID;
  wire [7:0]system_interconnect_M01_AXI_AWADDR;
  wire [2:0]system_interconnect_M01_AXI_AWPROT;
  wire system_interconnect_M01_AXI_AWREADY;
  wire system_interconnect_M01_AXI_AWVALID;
  wire system_interconnect_M01_AXI_BREADY;
  wire [1:0]system_interconnect_M01_AXI_BRESP;
  wire system_interconnect_M01_AXI_BVALID;
  wire [31:0]system_interconnect_M01_AXI_RDATA;
  wire system_interconnect_M01_AXI_RREADY;
  wire [1:0]system_interconnect_M01_AXI_RRESP;
  wire system_interconnect_M01_AXI_RVALID;
  wire [31:0]system_interconnect_M01_AXI_WDATA;
  wire system_interconnect_M01_AXI_WREADY;
  wire [3:0]system_interconnect_M01_AXI_WSTRB;
  wire system_interconnect_M01_AXI_WVALID;

  assign M01_AXI_araddr[7:0] = system_interconnect_M01_AXI_ARADDR;
  assign M01_AXI_arprot[2:0] = system_interconnect_M01_AXI_ARPROT;
  assign M01_AXI_arvalid = system_interconnect_M01_AXI_ARVALID;
  assign M01_AXI_awaddr[7:0] = system_interconnect_M01_AXI_AWADDR;
  assign M01_AXI_awprot[2:0] = system_interconnect_M01_AXI_AWPROT;
  assign M01_AXI_awvalid = system_interconnect_M01_AXI_AWVALID;
  assign M01_AXI_bready = system_interconnect_M01_AXI_BREADY;
  assign M01_AXI_rready = system_interconnect_M01_AXI_RREADY;
  assign M01_AXI_wdata[31:0] = system_interconnect_M01_AXI_WDATA;
  assign M01_AXI_wstrb[3:0] = system_interconnect_M01_AXI_WSTRB;
  assign M01_AXI_wvalid = system_interconnect_M01_AXI_WVALID;
  assign S00_AXI_arready = pcie_bridge_M_AXI_B_ARREADY;
  assign S00_AXI_awready = pcie_bridge_M_AXI_B_AWREADY;
  assign S00_AXI_bid[3:0] = pcie_bridge_M_AXI_B_BID;
  assign S00_AXI_bresp[1:0] = pcie_bridge_M_AXI_B_BRESP;
  assign S00_AXI_bvalid = pcie_bridge_M_AXI_B_BVALID;
  assign S00_AXI_rdata[511:0] = pcie_bridge_M_AXI_B_RDATA;
  assign S00_AXI_rid[3:0] = pcie_bridge_M_AXI_B_RID;
  assign S00_AXI_rlast = pcie_bridge_M_AXI_B_RLAST;
  assign S00_AXI_rresp[1:0] = pcie_bridge_M_AXI_B_RRESP;
  assign S00_AXI_rvalid = pcie_bridge_M_AXI_B_RVALID;
  assign S00_AXI_wready = pcie_bridge_M_AXI_B_WREADY;
  assign pcie_bridge_M_AXI_B_ARADDR = S00_AXI_araddr[63:0];
  assign pcie_bridge_M_AXI_B_ARBURST = S00_AXI_arburst[1:0];
  assign pcie_bridge_M_AXI_B_ARCACHE = S00_AXI_arcache[3:0];
  assign pcie_bridge_M_AXI_B_ARID = S00_AXI_arid[3:0];
  assign pcie_bridge_M_AXI_B_ARLEN = S00_AXI_arlen[7:0];
  assign pcie_bridge_M_AXI_B_ARLOCK = S00_AXI_arlock[0];
  assign pcie_bridge_M_AXI_B_ARPROT = S00_AXI_arprot[2:0];
  assign pcie_bridge_M_AXI_B_ARSIZE = S00_AXI_arsize[2:0];
  assign pcie_bridge_M_AXI_B_ARVALID = S00_AXI_arvalid;
  assign pcie_bridge_M_AXI_B_AWADDR = S00_AXI_awaddr[63:0];
  assign pcie_bridge_M_AXI_B_AWBURST = S00_AXI_awburst[1:0];
  assign pcie_bridge_M_AXI_B_AWCACHE = S00_AXI_awcache[3:0];
  assign pcie_bridge_M_AXI_B_AWID = S00_AXI_awid[3:0];
  assign pcie_bridge_M_AXI_B_AWLEN = S00_AXI_awlen[7:0];
  assign pcie_bridge_M_AXI_B_AWLOCK = S00_AXI_awlock[0];
  assign pcie_bridge_M_AXI_B_AWPROT = S00_AXI_awprot[2:0];
  assign pcie_bridge_M_AXI_B_AWSIZE = S00_AXI_awsize[2:0];
  assign pcie_bridge_M_AXI_B_AWVALID = S00_AXI_awvalid;
  assign pcie_bridge_M_AXI_B_BREADY = S00_AXI_bready;
  assign pcie_bridge_M_AXI_B_RREADY = S00_AXI_rready;
  assign pcie_bridge_M_AXI_B_WDATA = S00_AXI_wdata[511:0];
  assign pcie_bridge_M_AXI_B_WLAST = S00_AXI_wlast;
  assign pcie_bridge_M_AXI_B_WSTRB = S00_AXI_wstrb[63:0];
  assign pcie_bridge_M_AXI_B_WVALID = S00_AXI_wvalid;
  assign pcie_bridge_axi_aclk = aclk;
  assign pcie_bridge_axi_aresetn = aresetn;
  assign system_interconnect_M01_AXI_ARREADY = M01_AXI_arready;
  assign system_interconnect_M01_AXI_AWREADY = M01_AXI_awready;
  assign system_interconnect_M01_AXI_BRESP = M01_AXI_bresp[1:0];
  assign system_interconnect_M01_AXI_BVALID = M01_AXI_bvalid;
  assign system_interconnect_M01_AXI_RDATA = M01_AXI_rdata[31:0];
  assign system_interconnect_M01_AXI_RRESP = M01_AXI_rresp[1:0];
  assign system_interconnect_M01_AXI_RVALID = M01_AXI_rvalid;
  assign system_interconnect_M01_AXI_WREADY = M01_AXI_wready;
  top_level_axi_revision_0_0 axi_revision
       (.AXI_ACLK(pcie_bridge_axi_aclk),
        .AXI_ARESETN(pcie_bridge_axi_aresetn),
        .S_AXI_ARADDR(system_interconnect_M00_AXI_ARADDR),
        .S_AXI_ARPROT(system_interconnect_M00_AXI_ARPROT),
        .S_AXI_ARREADY(system_interconnect_M00_AXI_ARREADY),
        .S_AXI_ARVALID(system_interconnect_M00_AXI_ARVALID),
        .S_AXI_AWADDR(system_interconnect_M00_AXI_AWADDR),
        .S_AXI_AWPROT(system_interconnect_M00_AXI_AWPROT),
        .S_AXI_AWREADY(system_interconnect_M00_AXI_AWREADY),
        .S_AXI_AWVALID(system_interconnect_M00_AXI_AWVALID),
        .S_AXI_BREADY(system_interconnect_M00_AXI_BREADY),
        .S_AXI_BRESP(system_interconnect_M00_AXI_BRESP),
        .S_AXI_BVALID(system_interconnect_M00_AXI_BVALID),
        .S_AXI_RDATA(system_interconnect_M00_AXI_RDATA),
        .S_AXI_RREADY(system_interconnect_M00_AXI_RREADY),
        .S_AXI_RRESP(system_interconnect_M00_AXI_RRESP),
        .S_AXI_RVALID(system_interconnect_M00_AXI_RVALID),
        .S_AXI_WDATA(system_interconnect_M00_AXI_WDATA),
        .S_AXI_WREADY(system_interconnect_M00_AXI_WREADY),
        .S_AXI_WSTRB(system_interconnect_M00_AXI_WSTRB),
        .S_AXI_WVALID(system_interconnect_M00_AXI_WVALID));
  top_level_smartconnect_0_0 system_interconnect
       (.M00_AXI_araddr(system_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arprot(system_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arready(system_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(system_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(system_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awprot(system_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awready(system_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(system_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(system_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(system_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(system_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(system_interconnect_M00_AXI_RDATA),
        .M00_AXI_rready(system_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(system_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(system_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(system_interconnect_M00_AXI_WDATA),
        .M00_AXI_wready(system_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(system_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(system_interconnect_M00_AXI_WVALID),
        .M01_AXI_araddr(system_interconnect_M01_AXI_ARADDR),
        .M01_AXI_arprot(system_interconnect_M01_AXI_ARPROT),
        .M01_AXI_arready(system_interconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(system_interconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(system_interconnect_M01_AXI_AWADDR),
        .M01_AXI_awprot(system_interconnect_M01_AXI_AWPROT),
        .M01_AXI_awready(system_interconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(system_interconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(system_interconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(system_interconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(system_interconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(system_interconnect_M01_AXI_RDATA),
        .M01_AXI_rready(system_interconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(system_interconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(system_interconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(system_interconnect_M01_AXI_WDATA),
        .M01_AXI_wready(system_interconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(system_interconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(system_interconnect_M01_AXI_WVALID),
        .S00_AXI_araddr(pcie_bridge_M_AXI_B_ARADDR),
        .S00_AXI_arburst(pcie_bridge_M_AXI_B_ARBURST),
        .S00_AXI_arcache(pcie_bridge_M_AXI_B_ARCACHE),
        .S00_AXI_arid(pcie_bridge_M_AXI_B_ARID),
        .S00_AXI_arlen(pcie_bridge_M_AXI_B_ARLEN),
        .S00_AXI_arlock(pcie_bridge_M_AXI_B_ARLOCK),
        .S00_AXI_arprot(pcie_bridge_M_AXI_B_ARPROT),
        .S00_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arready(pcie_bridge_M_AXI_B_ARREADY),
        .S00_AXI_arsize(pcie_bridge_M_AXI_B_ARSIZE),
        .S00_AXI_arvalid(pcie_bridge_M_AXI_B_ARVALID),
        .S00_AXI_awaddr(pcie_bridge_M_AXI_B_AWADDR),
        .S00_AXI_awburst(pcie_bridge_M_AXI_B_AWBURST),
        .S00_AXI_awcache(pcie_bridge_M_AXI_B_AWCACHE),
        .S00_AXI_awid(pcie_bridge_M_AXI_B_AWID),
        .S00_AXI_awlen(pcie_bridge_M_AXI_B_AWLEN),
        .S00_AXI_awlock(pcie_bridge_M_AXI_B_AWLOCK),
        .S00_AXI_awprot(pcie_bridge_M_AXI_B_AWPROT),
        .S00_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awready(pcie_bridge_M_AXI_B_AWREADY),
        .S00_AXI_awsize(pcie_bridge_M_AXI_B_AWSIZE),
        .S00_AXI_awvalid(pcie_bridge_M_AXI_B_AWVALID),
        .S00_AXI_bid(pcie_bridge_M_AXI_B_BID),
        .S00_AXI_bready(pcie_bridge_M_AXI_B_BREADY),
        .S00_AXI_bresp(pcie_bridge_M_AXI_B_BRESP),
        .S00_AXI_bvalid(pcie_bridge_M_AXI_B_BVALID),
        .S00_AXI_rdata(pcie_bridge_M_AXI_B_RDATA),
        .S00_AXI_rid(pcie_bridge_M_AXI_B_RID),
        .S00_AXI_rlast(pcie_bridge_M_AXI_B_RLAST),
        .S00_AXI_rready(pcie_bridge_M_AXI_B_RREADY),
        .S00_AXI_rresp(pcie_bridge_M_AXI_B_RRESP),
        .S00_AXI_rvalid(pcie_bridge_M_AXI_B_RVALID),
        .S00_AXI_wdata(pcie_bridge_M_AXI_B_WDATA),
        .S00_AXI_wlast(pcie_bridge_M_AXI_B_WLAST),
        .S00_AXI_wready(pcie_bridge_M_AXI_B_WREADY),
        .S00_AXI_wstrb(pcie_bridge_M_AXI_B_WSTRB),
        .S00_AXI_wvalid(pcie_bridge_M_AXI_B_WVALID),
        .aclk(pcie_bridge_axi_aclk),
        .aresetn(pcie_bridge_axi_aresetn));
endmodule

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=49,numReposBlks=38,numNonXlnxBlks=0,numHierBlks=11,maxHierDepth=3,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=22,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_clkrst_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (ddr4_bank0_clk_clk_n,
    ddr4_bank0_clk_clk_p,
    ddr4_bank1_clk_clk_n,
    ddr4_bank1_clk_clk_p,
    init_clk,
    led_green_l,
    led_orange_l,
    m0_ddr4_act_n,
    m0_ddr4_adr,
    m0_ddr4_ba,
    m0_ddr4_bg,
    m0_ddr4_ck_c,
    m0_ddr4_ck_t,
    m0_ddr4_cke,
    m0_ddr4_cs_n,
    m0_ddr4_dm_n,
    m0_ddr4_dq,
    m0_ddr4_dqs_c,
    m0_ddr4_dqs_t,
    m0_ddr4_odt,
    m0_ddr4_reset_n,
    m1_ddr4_act_n,
    m1_ddr4_adr,
    m1_ddr4_ba,
    m1_ddr4_bg,
    m1_ddr4_ck_c,
    m1_ddr4_ck_t,
    m1_ddr4_cke,
    m1_ddr4_cs_n,
    m1_ddr4_dm_n,
    m1_ddr4_dq,
    m1_ddr4_dqs_c,
    m1_ddr4_dqs_t,
    m1_ddr4_odt,
    m1_ddr4_reset_n,
    pcie_mgt_rxn,
    pcie_mgt_rxp,
    pcie_mgt_txn,
    pcie_mgt_txp,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    qsfp0_clk_clk_n,
    qsfp0_clk_clk_p,
    qsfp0_gt_grx_n,
    qsfp0_gt_grx_p,
    qsfp0_gt_gtx_n,
    qsfp0_gt_gtx_p,
    qsfp_lp,
    qsfp_rst_l);
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 ddr4_bank0_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr4_bank0_clk, CAN_DEBUG false, FREQ_HZ 100000000" *) input ddr4_bank0_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 ddr4_bank0_clk CLK_P" *) input ddr4_bank0_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 ddr4_bank1_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr4_bank1_clk, CAN_DEBUG false, FREQ_HZ 100000000" *) input ddr4_bank1_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 ddr4_bank1_clk CLK_P" *) input ddr4_bank1_clk_clk_p;
  input init_clk;
  output [3:0]led_green_l;
  output [3:0]led_orange_l;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 ACT_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m0_ddr4, AXI_ARBITRATION_SCHEME RD_PRI_REG, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 18, CAS_WRITE_LATENCY 14, CS_ENABLED true, CUSTOM_PARTS no_file_loaded, DATA_MASK_ENABLED DM_NO_DBI, DATA_WIDTH 64, MEMORY_PART MT40A512M8RH-075E, MEMORY_TYPE Components, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 750" *) output m0_ddr4_act_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 ADR" *) output [16:0]m0_ddr4_adr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 BA" *) output [1:0]m0_ddr4_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 BG" *) output [1:0]m0_ddr4_bg;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 CK_C" *) output [0:0]m0_ddr4_ck_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 CK_T" *) output [0:0]m0_ddr4_ck_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 CKE" *) output [0:0]m0_ddr4_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 CS_N" *) output [0:0]m0_ddr4_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 DM_N" *) inout [7:0]m0_ddr4_dm_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 DQ" *) inout [63:0]m0_ddr4_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 DQS_C" *) inout [7:0]m0_ddr4_dqs_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 DQS_T" *) inout [7:0]m0_ddr4_dqs_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 ODT" *) output [0:0]m0_ddr4_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m0_ddr4 RESET_N" *) output m0_ddr4_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 ACT_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m1_ddr4, AXI_ARBITRATION_SCHEME RD_PRI_REG, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 18, CAS_WRITE_LATENCY 14, CS_ENABLED true, CUSTOM_PARTS no_file_loaded, DATA_MASK_ENABLED DM_NO_DBI, DATA_WIDTH 64, MEMORY_PART MT40A512M8RH-075E, MEMORY_TYPE Components, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 750" *) output m1_ddr4_act_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 ADR" *) output [16:0]m1_ddr4_adr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 BA" *) output [1:0]m1_ddr4_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 BG" *) output [1:0]m1_ddr4_bg;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 CK_C" *) output [0:0]m1_ddr4_ck_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 CK_T" *) output [0:0]m1_ddr4_ck_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 CKE" *) output [0:0]m1_ddr4_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 CS_N" *) output [0:0]m1_ddr4_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 DM_N" *) inout [7:0]m1_ddr4_dm_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 DQ" *) inout [63:0]m1_ddr4_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 DQS_C" *) inout [7:0]m1_ddr4_dqs_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 DQS_T" *) inout [7:0]m1_ddr4_dqs_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 ODT" *) output [0:0]m1_ddr4_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 m1_ddr4 RESET_N" *) output m1_ddr4_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt rxn" *) input [15:0]pcie_mgt_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt rxp" *) input [15:0]pcie_mgt_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt txn" *) output [15:0]pcie_mgt_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt txp" *) output [15:0]pcie_mgt_txp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie_refclk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcie_refclk, CAN_DEBUG false, FREQ_HZ 100000000" *) input [0:0]pcie_refclk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie_refclk CLK_P" *) input [0:0]pcie_refclk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp0_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp0_clk, CAN_DEBUG false, FREQ_HZ 322265625" *) input qsfp0_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp0_clk CLK_P" *) input qsfp0_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp0_gt GRX_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp0_gt, CAN_DEBUG false" *) input [3:0]qsfp0_gt_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp0_gt GRX_P" *) input [3:0]qsfp0_gt_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp0_gt GTX_N" *) output [3:0]qsfp0_gt_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp0_gt GTX_P" *) output [3:0]qsfp0_gt_gtx_p;
  output [1:0]qsfp_lp;
  output [1:0]qsfp_rst_l;

  wire [511:0]AXIS_IN_1_TDATA;
  wire AXIS_IN_1_TLAST;
  wire AXIS_IN_1_TREADY;
  wire AXIS_IN_1_TVALID;
  wire [0:0]CLK_IN_D_0_1_CLK_N;
  wire [0:0]CLK_IN_D_0_1_CLK_P;
  wire control_gen_packets;
  wire control_loopback;
  wire [63:0]control_packet_count;
  wire control_resetn_out1;
  wire [511:0]data_gen_axis_TDATA;
  wire data_gen_axis_TLAST;
  wire data_gen_axis_TREADY;
  wire data_gen_axis_TVALID;
  wire ddr4_clk_0_0_1_CLK_N;
  wire ddr4_clk_0_0_1_CLK_P;
  wire ddr4_clk_1_0_1_CLK_N;
  wire ddr4_clk_1_0_1_CLK_P;
  wire gt_ref_clk_0_1_CLK_N;
  wire gt_ref_clk_0_1_CLK_P;
  wire init_clk_0_1;
  wire [511:0]packet_buffer_axis_qsfp_out_TDATA;
  wire packet_buffer_axis_qsfp_out_TREADY;
  wire packet_buffer_axis_qsfp_out_TVALID;
  wire packet_buffer_bad_packet_strb;
  wire packet_buffer_ddr4_0_ACT_N;
  wire [16:0]packet_buffer_ddr4_0_ADR;
  wire [1:0]packet_buffer_ddr4_0_BA;
  wire [1:0]packet_buffer_ddr4_0_BG;
  wire [0:0]packet_buffer_ddr4_0_CKE;
  wire [0:0]packet_buffer_ddr4_0_CK_C;
  wire [0:0]packet_buffer_ddr4_0_CK_T;
  wire [0:0]packet_buffer_ddr4_0_CS_N;
  wire [7:0]packet_buffer_ddr4_0_DM_N;
  wire [63:0]packet_buffer_ddr4_0_DQ;
  wire [7:0]packet_buffer_ddr4_0_DQS_C;
  wire [7:0]packet_buffer_ddr4_0_DQS_T;
  wire [0:0]packet_buffer_ddr4_0_ODT;
  wire packet_buffer_ddr4_0_RESET_N;
  wire packet_buffer_ddr4_1_ACT_N;
  wire [16:0]packet_buffer_ddr4_1_ADR;
  wire [1:0]packet_buffer_ddr4_1_BA;
  wire [1:0]packet_buffer_ddr4_1_BG;
  wire [0:0]packet_buffer_ddr4_1_CKE;
  wire [0:0]packet_buffer_ddr4_1_CK_C;
  wire [0:0]packet_buffer_ddr4_1_CK_T;
  wire [0:0]packet_buffer_ddr4_1_CS_N;
  wire [7:0]packet_buffer_ddr4_1_DM_N;
  wire [63:0]packet_buffer_ddr4_1_DQ;
  wire [7:0]packet_buffer_ddr4_1_DQS_C;
  wire [7:0]packet_buffer_ddr4_1_DQS_T;
  wire [0:0]packet_buffer_ddr4_1_ODT;
  wire packet_buffer_ddr4_1_RESET_N;
  wire packet_buffer_ddr_calib_complete_0;
  wire packet_buffer_ddr_calib_complete_1;
  wire packet_buffer_good_packet_strb;
  wire [63:0]packet_buffer_hwm_0;
  wire [63:0]packet_buffer_hwm_1;
  wire packet_buffer_overflow_0;
  wire packet_buffer_overflow_1;
  wire pause_pci_1;
  wire [63:0]pci_base_1;
  wire [63:0]pci_size_1;
  wire [63:0]pcie_bridge_M_AXI_B_ARADDR;
  wire [1:0]pcie_bridge_M_AXI_B_ARBURST;
  wire [3:0]pcie_bridge_M_AXI_B_ARCACHE;
  wire [3:0]pcie_bridge_M_AXI_B_ARID;
  wire [7:0]pcie_bridge_M_AXI_B_ARLEN;
  wire [0:0]pcie_bridge_M_AXI_B_ARLOCK;
  wire [2:0]pcie_bridge_M_AXI_B_ARPROT;
  wire pcie_bridge_M_AXI_B_ARREADY;
  wire [2:0]pcie_bridge_M_AXI_B_ARSIZE;
  wire pcie_bridge_M_AXI_B_ARVALID;
  wire [63:0]pcie_bridge_M_AXI_B_AWADDR;
  wire [1:0]pcie_bridge_M_AXI_B_AWBURST;
  wire [3:0]pcie_bridge_M_AXI_B_AWCACHE;
  wire [3:0]pcie_bridge_M_AXI_B_AWID;
  wire [7:0]pcie_bridge_M_AXI_B_AWLEN;
  wire [0:0]pcie_bridge_M_AXI_B_AWLOCK;
  wire [2:0]pcie_bridge_M_AXI_B_AWPROT;
  wire pcie_bridge_M_AXI_B_AWREADY;
  wire [2:0]pcie_bridge_M_AXI_B_AWSIZE;
  wire pcie_bridge_M_AXI_B_AWVALID;
  wire [3:0]pcie_bridge_M_AXI_B_BID;
  wire pcie_bridge_M_AXI_B_BREADY;
  wire [1:0]pcie_bridge_M_AXI_B_BRESP;
  wire pcie_bridge_M_AXI_B_BVALID;
  wire [511:0]pcie_bridge_M_AXI_B_RDATA;
  wire [3:0]pcie_bridge_M_AXI_B_RID;
  wire pcie_bridge_M_AXI_B_RLAST;
  wire pcie_bridge_M_AXI_B_RREADY;
  wire [1:0]pcie_bridge_M_AXI_B_RRESP;
  wire pcie_bridge_M_AXI_B_RVALID;
  wire [511:0]pcie_bridge_M_AXI_B_WDATA;
  wire pcie_bridge_M_AXI_B_WLAST;
  wire pcie_bridge_M_AXI_B_WREADY;
  wire [63:0]pcie_bridge_M_AXI_B_WSTRB;
  wire pcie_bridge_M_AXI_B_WVALID;
  wire pcie_bridge_axi_aclk;
  wire pcie_bridge_axi_aresetn;
  wire pcie_bridge_pci_range_err_strb;
  wire [15:0]pcie_bridge_pcie_mgt_rxn;
  wire [15:0]pcie_bridge_pcie_mgt_rxp;
  wire [15:0]pcie_bridge_pcie_mgt_txn;
  wire [15:0]pcie_bridge_pcie_mgt_txp;
  wire qsfp_gen_idle;
  wire [3:0]qsfp_gt_serial_port_0_GRX_N;
  wire [3:0]qsfp_gt_serial_port_0_GRX_P;
  wire [3:0]qsfp_gt_serial_port_0_GTX_N;
  wire [3:0]qsfp_gt_serial_port_0_GTX_P;
  wire [3:0]qsfp_led_green_l_0;
  wire [3:0]qsfp_led_orange_l_0;
  wire [1:0]qsfp_qsfp_lp;
  wire [1:0]qsfp_qsfp_rst_l;
  wire qsfp_rx_aligned;
  wire [7:0]system_interconnect_M01_AXI_ARADDR;
  wire [2:0]system_interconnect_M01_AXI_ARPROT;
  wire system_interconnect_M01_AXI_ARREADY;
  wire system_interconnect_M01_AXI_ARVALID;
  wire [7:0]system_interconnect_M01_AXI_AWADDR;
  wire [2:0]system_interconnect_M01_AXI_AWPROT;
  wire system_interconnect_M01_AXI_AWREADY;
  wire system_interconnect_M01_AXI_AWVALID;
  wire system_interconnect_M01_AXI_BREADY;
  wire [1:0]system_interconnect_M01_AXI_BRESP;
  wire system_interconnect_M01_AXI_BVALID;
  wire [31:0]system_interconnect_M01_AXI_RDATA;
  wire system_interconnect_M01_AXI_RREADY;
  wire [1:0]system_interconnect_M01_AXI_RRESP;
  wire system_interconnect_M01_AXI_RVALID;
  wire [31:0]system_interconnect_M01_AXI_WDATA;
  wire system_interconnect_M01_AXI_WREADY;
  wire [3:0]system_interconnect_M01_AXI_WSTRB;
  wire system_interconnect_M01_AXI_WVALID;

  assign CLK_IN_D_0_1_CLK_N = pcie_refclk_clk_n[0];
  assign CLK_IN_D_0_1_CLK_P = pcie_refclk_clk_p[0];
  assign ddr4_clk_0_0_1_CLK_N = ddr4_bank0_clk_clk_n;
  assign ddr4_clk_0_0_1_CLK_P = ddr4_bank0_clk_clk_p;
  assign ddr4_clk_1_0_1_CLK_N = ddr4_bank1_clk_clk_n;
  assign ddr4_clk_1_0_1_CLK_P = ddr4_bank1_clk_clk_p;
  assign gt_ref_clk_0_1_CLK_N = qsfp0_clk_clk_n;
  assign gt_ref_clk_0_1_CLK_P = qsfp0_clk_clk_p;
  assign init_clk_0_1 = init_clk;
  assign led_green_l[3:0] = qsfp_led_green_l_0;
  assign led_orange_l[3:0] = qsfp_led_orange_l_0;
  assign m0_ddr4_act_n = packet_buffer_ddr4_0_ACT_N;
  assign m0_ddr4_adr[16:0] = packet_buffer_ddr4_0_ADR;
  assign m0_ddr4_ba[1:0] = packet_buffer_ddr4_0_BA;
  assign m0_ddr4_bg[1:0] = packet_buffer_ddr4_0_BG;
  assign m0_ddr4_ck_c[0] = packet_buffer_ddr4_0_CK_C;
  assign m0_ddr4_ck_t[0] = packet_buffer_ddr4_0_CK_T;
  assign m0_ddr4_cke[0] = packet_buffer_ddr4_0_CKE;
  assign m0_ddr4_cs_n[0] = packet_buffer_ddr4_0_CS_N;
  assign m0_ddr4_odt[0] = packet_buffer_ddr4_0_ODT;
  assign m0_ddr4_reset_n = packet_buffer_ddr4_0_RESET_N;
  assign m1_ddr4_act_n = packet_buffer_ddr4_1_ACT_N;
  assign m1_ddr4_adr[16:0] = packet_buffer_ddr4_1_ADR;
  assign m1_ddr4_ba[1:0] = packet_buffer_ddr4_1_BA;
  assign m1_ddr4_bg[1:0] = packet_buffer_ddr4_1_BG;
  assign m1_ddr4_ck_c[0] = packet_buffer_ddr4_1_CK_C;
  assign m1_ddr4_ck_t[0] = packet_buffer_ddr4_1_CK_T;
  assign m1_ddr4_cke[0] = packet_buffer_ddr4_1_CKE;
  assign m1_ddr4_cs_n[0] = packet_buffer_ddr4_1_CS_N;
  assign m1_ddr4_odt[0] = packet_buffer_ddr4_1_ODT;
  assign m1_ddr4_reset_n = packet_buffer_ddr4_1_RESET_N;
  assign pcie_bridge_pcie_mgt_rxn = pcie_mgt_rxn[15:0];
  assign pcie_bridge_pcie_mgt_rxp = pcie_mgt_rxp[15:0];
  assign pcie_mgt_txn[15:0] = pcie_bridge_pcie_mgt_txn;
  assign pcie_mgt_txp[15:0] = pcie_bridge_pcie_mgt_txp;
  assign qsfp0_gt_gtx_n[3:0] = qsfp_gt_serial_port_0_GTX_N;
  assign qsfp0_gt_gtx_p[3:0] = qsfp_gt_serial_port_0_GTX_P;
  assign qsfp_gt_serial_port_0_GRX_N = qsfp0_gt_grx_n[3:0];
  assign qsfp_gt_serial_port_0_GRX_P = qsfp0_gt_grx_p[3:0];
  assign qsfp_lp[1:0] = qsfp_qsfp_lp;
  assign qsfp_rst_l[1:0] = qsfp_qsfp_rst_l;
  top_level_control_0_0 control
       (.S_AXI_ARADDR(system_interconnect_M01_AXI_ARADDR),
        .S_AXI_ARPROT(system_interconnect_M01_AXI_ARPROT),
        .S_AXI_ARREADY(system_interconnect_M01_AXI_ARREADY),
        .S_AXI_ARVALID(system_interconnect_M01_AXI_ARVALID),
        .S_AXI_AWADDR(system_interconnect_M01_AXI_AWADDR),
        .S_AXI_AWPROT(system_interconnect_M01_AXI_AWPROT),
        .S_AXI_AWREADY(system_interconnect_M01_AXI_AWREADY),
        .S_AXI_AWVALID(system_interconnect_M01_AXI_AWVALID),
        .S_AXI_BREADY(system_interconnect_M01_AXI_BREADY),
        .S_AXI_BRESP(system_interconnect_M01_AXI_BRESP),
        .S_AXI_BVALID(system_interconnect_M01_AXI_BVALID),
        .S_AXI_RDATA(system_interconnect_M01_AXI_RDATA),
        .S_AXI_RREADY(system_interconnect_M01_AXI_RREADY),
        .S_AXI_RRESP(system_interconnect_M01_AXI_RRESP),
        .S_AXI_RVALID(system_interconnect_M01_AXI_RVALID),
        .S_AXI_WDATA(system_interconnect_M01_AXI_WDATA),
        .S_AXI_WREADY(system_interconnect_M01_AXI_WREADY),
        .S_AXI_WSTRB(system_interconnect_M01_AXI_WSTRB),
        .S_AXI_WVALID(system_interconnect_M01_AXI_WVALID),
        .async_ddr_cal_0(packet_buffer_ddr_calib_complete_0),
        .async_ddr_cal_1(packet_buffer_ddr_calib_complete_1),
        .async_pcs_aligned(qsfp_rx_aligned),
        .bad_packet_strb(packet_buffer_bad_packet_strb),
        .clk(pcie_bridge_axi_aclk),
        .gen_packets(control_gen_packets),
        .generator_idle(qsfp_gen_idle),
        .good_packet_strb(packet_buffer_good_packet_strb),
        .hwm_0(packet_buffer_hwm_0),
        .hwm_1(packet_buffer_hwm_1),
        .loopback(control_loopback),
        .overflow_0(packet_buffer_overflow_0),
        .overflow_1(packet_buffer_overflow_1),
        .packet_count(control_packet_count),
        .pause_pci(pause_pci_1),
        .pci_base(pci_base_1),
        .pci_range_err_strb(pcie_bridge_pci_range_err_strb),
        .pci_size(pci_size_1),
        .resetn(pcie_bridge_axi_aresetn),
        .resetn_out(control_resetn_out1),
        .seq_axis_tdata(AXIS_IN_1_TDATA),
        .seq_axis_tlast(AXIS_IN_1_TLAST),
        .seq_axis_tready(AXIS_IN_1_TREADY),
        .seq_axis_tvalid(AXIS_IN_1_TVALID));
  packet_buffer_imp_1NAPKPF packet_buffer
       (.axis_in_tdata(data_gen_axis_TDATA),
        .axis_in_tlast(data_gen_axis_TLAST),
        .axis_in_tready(data_gen_axis_TREADY),
        .axis_in_tvalid(data_gen_axis_TVALID),
        .axis_pcie_out_tdata(AXIS_IN_1_TDATA),
        .axis_pcie_out_tlast(AXIS_IN_1_TLAST),
        .axis_pcie_out_tready(AXIS_IN_1_TREADY),
        .axis_pcie_out_tvalid(AXIS_IN_1_TVALID),
        .axis_qsfp_out_tdata(packet_buffer_axis_qsfp_out_TDATA),
        .axis_qsfp_out_tready(packet_buffer_axis_qsfp_out_TREADY),
        .axis_qsfp_out_tvalid(packet_buffer_axis_qsfp_out_TVALID),
        .bad_packet_strb(packet_buffer_bad_packet_strb),
        .clk(pcie_bridge_axi_aclk),
        .ddr4_0_act_n(packet_buffer_ddr4_0_ACT_N),
        .ddr4_0_adr(packet_buffer_ddr4_0_ADR),
        .ddr4_0_ba(packet_buffer_ddr4_0_BA),
        .ddr4_0_bg(packet_buffer_ddr4_0_BG),
        .ddr4_0_ck_c(packet_buffer_ddr4_0_CK_C),
        .ddr4_0_ck_t(packet_buffer_ddr4_0_CK_T),
        .ddr4_0_cke(packet_buffer_ddr4_0_CKE),
        .ddr4_0_cs_n(packet_buffer_ddr4_0_CS_N),
        .ddr4_0_dm_n(m0_ddr4_dm_n[7:0]),
        .ddr4_0_dq(m0_ddr4_dq[63:0]),
        .ddr4_0_dqs_c(m0_ddr4_dqs_c[7:0]),
        .ddr4_0_dqs_t(m0_ddr4_dqs_t[7:0]),
        .ddr4_0_odt(packet_buffer_ddr4_0_ODT),
        .ddr4_0_reset_n(packet_buffer_ddr4_0_RESET_N),
        .ddr4_1_act_n(packet_buffer_ddr4_1_ACT_N),
        .ddr4_1_adr(packet_buffer_ddr4_1_ADR),
        .ddr4_1_ba(packet_buffer_ddr4_1_BA),
        .ddr4_1_bg(packet_buffer_ddr4_1_BG),
        .ddr4_1_ck_c(packet_buffer_ddr4_1_CK_C),
        .ddr4_1_ck_t(packet_buffer_ddr4_1_CK_T),
        .ddr4_1_cke(packet_buffer_ddr4_1_CKE),
        .ddr4_1_cs_n(packet_buffer_ddr4_1_CS_N),
        .ddr4_1_dm_n(m1_ddr4_dm_n[7:0]),
        .ddr4_1_dq(m1_ddr4_dq[63:0]),
        .ddr4_1_dqs_c(m1_ddr4_dqs_c[7:0]),
        .ddr4_1_dqs_t(m1_ddr4_dqs_t[7:0]),
        .ddr4_1_odt(packet_buffer_ddr4_1_ODT),
        .ddr4_1_reset_n(packet_buffer_ddr4_1_RESET_N),
        .ddr4_clk_0_clk_n(ddr4_clk_0_0_1_CLK_N),
        .ddr4_clk_0_clk_p(ddr4_clk_0_0_1_CLK_P),
        .ddr4_clk_1_clk_n(ddr4_clk_1_0_1_CLK_N),
        .ddr4_clk_1_clk_p(ddr4_clk_1_0_1_CLK_P),
        .ddr_calib_complete_0(packet_buffer_ddr_calib_complete_0),
        .ddr_calib_complete_1(packet_buffer_ddr_calib_complete_1),
        .good_packet_strb(packet_buffer_good_packet_strb),
        .hwm_0(packet_buffer_hwm_0),
        .hwm_1(packet_buffer_hwm_1),
        .loopback_mode(control_loopback),
        .overflow_0(packet_buffer_overflow_0),
        .overflow_1(packet_buffer_overflow_1),
        .resetn(control_resetn_out1));
  pcie_bridge_imp_1AINXYK pcie_bridge
       (.AXIS_IN_tdata(AXIS_IN_1_TDATA),
        .AXIS_IN_tlast(AXIS_IN_1_TLAST),
        .AXIS_IN_tready(AXIS_IN_1_TREADY),
        .AXIS_IN_tvalid(AXIS_IN_1_TVALID),
        .M_AXI_B_araddr(pcie_bridge_M_AXI_B_ARADDR),
        .M_AXI_B_arburst(pcie_bridge_M_AXI_B_ARBURST),
        .M_AXI_B_arcache(pcie_bridge_M_AXI_B_ARCACHE),
        .M_AXI_B_arid(pcie_bridge_M_AXI_B_ARID),
        .M_AXI_B_arlen(pcie_bridge_M_AXI_B_ARLEN),
        .M_AXI_B_arlock(pcie_bridge_M_AXI_B_ARLOCK),
        .M_AXI_B_arprot(pcie_bridge_M_AXI_B_ARPROT),
        .M_AXI_B_arready(pcie_bridge_M_AXI_B_ARREADY),
        .M_AXI_B_arsize(pcie_bridge_M_AXI_B_ARSIZE),
        .M_AXI_B_arvalid(pcie_bridge_M_AXI_B_ARVALID),
        .M_AXI_B_awaddr(pcie_bridge_M_AXI_B_AWADDR),
        .M_AXI_B_awburst(pcie_bridge_M_AXI_B_AWBURST),
        .M_AXI_B_awcache(pcie_bridge_M_AXI_B_AWCACHE),
        .M_AXI_B_awid(pcie_bridge_M_AXI_B_AWID),
        .M_AXI_B_awlen(pcie_bridge_M_AXI_B_AWLEN),
        .M_AXI_B_awlock(pcie_bridge_M_AXI_B_AWLOCK),
        .M_AXI_B_awprot(pcie_bridge_M_AXI_B_AWPROT),
        .M_AXI_B_awready(pcie_bridge_M_AXI_B_AWREADY),
        .M_AXI_B_awsize(pcie_bridge_M_AXI_B_AWSIZE),
        .M_AXI_B_awvalid(pcie_bridge_M_AXI_B_AWVALID),
        .M_AXI_B_bid(pcie_bridge_M_AXI_B_BID),
        .M_AXI_B_bready(pcie_bridge_M_AXI_B_BREADY),
        .M_AXI_B_bresp(pcie_bridge_M_AXI_B_BRESP),
        .M_AXI_B_bvalid(pcie_bridge_M_AXI_B_BVALID),
        .M_AXI_B_rdata(pcie_bridge_M_AXI_B_RDATA),
        .M_AXI_B_rid(pcie_bridge_M_AXI_B_RID),
        .M_AXI_B_rlast(pcie_bridge_M_AXI_B_RLAST),
        .M_AXI_B_rready(pcie_bridge_M_AXI_B_RREADY),
        .M_AXI_B_rresp(pcie_bridge_M_AXI_B_RRESP),
        .M_AXI_B_rvalid(pcie_bridge_M_AXI_B_RVALID),
        .M_AXI_B_wdata(pcie_bridge_M_AXI_B_WDATA),
        .M_AXI_B_wlast(pcie_bridge_M_AXI_B_WLAST),
        .M_AXI_B_wready(pcie_bridge_M_AXI_B_WREADY),
        .M_AXI_B_wstrb(pcie_bridge_M_AXI_B_WSTRB),
        .M_AXI_B_wvalid(pcie_bridge_M_AXI_B_WVALID),
        .axi_aclk(pcie_bridge_axi_aclk),
        .axi_aresetn(pcie_bridge_axi_aresetn),
        .pause_pci(pause_pci_1),
        .pci_base(pci_base_1),
        .pci_range_err_strb(pcie_bridge_pci_range_err_strb),
        .pci_size(pci_size_1),
        .pcie_mgt_0_rxn(pcie_bridge_pcie_mgt_rxn),
        .pcie_mgt_0_rxp(pcie_bridge_pcie_mgt_rxp),
        .pcie_mgt_0_txn(pcie_bridge_pcie_mgt_txn),
        .pcie_mgt_0_txp(pcie_bridge_pcie_mgt_txp),
        .pcie_refclk_clk_n(CLK_IN_D_0_1_CLK_N),
        .pcie_refclk_clk_p(CLK_IN_D_0_1_CLK_P),
        .resetn_in(control_resetn_out1));
  qsfp_imp_1O96RWM qsfp
       (.axis_rx_tdata(data_gen_axis_TDATA),
        .axis_rx_tlast(data_gen_axis_TLAST),
        .axis_rx_tready(data_gen_axis_TREADY),
        .axis_rx_tvalid(data_gen_axis_TVALID),
        .axis_tx_a_tdata(packet_buffer_axis_qsfp_out_TDATA),
        .axis_tx_a_tready(packet_buffer_axis_qsfp_out_TREADY),
        .axis_tx_a_tvalid(packet_buffer_axis_qsfp_out_TVALID),
        .clk(pcie_bridge_axi_aclk),
        .gen_idle(qsfp_gen_idle),
        .gen_packets(control_gen_packets),
        .gt_ref_clk_clk_n(gt_ref_clk_0_1_CLK_N),
        .gt_ref_clk_clk_p(gt_ref_clk_0_1_CLK_P),
        .gt_serial_port_grx_n(qsfp_gt_serial_port_0_GRX_N),
        .gt_serial_port_grx_p(qsfp_gt_serial_port_0_GRX_P),
        .gt_serial_port_gtx_n(qsfp_gt_serial_port_0_GTX_N),
        .gt_serial_port_gtx_p(qsfp_gt_serial_port_0_GTX_P),
        .init_clk(init_clk_0_1),
        .led_green_l(qsfp_led_green_l_0),
        .led_orange_l(qsfp_led_orange_l_0),
        .max_packets(control_packet_count),
        .qsfp_lp(qsfp_qsfp_lp),
        .qsfp_rst_l(qsfp_qsfp_rst_l),
        .resetn(control_resetn_out1),
        .rx_aligned(qsfp_rx_aligned));
  system_interconnect_imp_1433GC4 system_interconnect
       (.M01_AXI_araddr(system_interconnect_M01_AXI_ARADDR),
        .M01_AXI_arprot(system_interconnect_M01_AXI_ARPROT),
        .M01_AXI_arready(system_interconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(system_interconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(system_interconnect_M01_AXI_AWADDR),
        .M01_AXI_awprot(system_interconnect_M01_AXI_AWPROT),
        .M01_AXI_awready(system_interconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(system_interconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(system_interconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(system_interconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(system_interconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(system_interconnect_M01_AXI_RDATA),
        .M01_AXI_rready(system_interconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(system_interconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(system_interconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(system_interconnect_M01_AXI_WDATA),
        .M01_AXI_wready(system_interconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(system_interconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(system_interconnect_M01_AXI_WVALID),
        .S00_AXI_araddr(pcie_bridge_M_AXI_B_ARADDR),
        .S00_AXI_arburst(pcie_bridge_M_AXI_B_ARBURST),
        .S00_AXI_arcache(pcie_bridge_M_AXI_B_ARCACHE),
        .S00_AXI_arid(pcie_bridge_M_AXI_B_ARID),
        .S00_AXI_arlen(pcie_bridge_M_AXI_B_ARLEN),
        .S00_AXI_arlock(pcie_bridge_M_AXI_B_ARLOCK),
        .S00_AXI_arprot(pcie_bridge_M_AXI_B_ARPROT),
        .S00_AXI_arready(pcie_bridge_M_AXI_B_ARREADY),
        .S00_AXI_arsize(pcie_bridge_M_AXI_B_ARSIZE),
        .S00_AXI_arvalid(pcie_bridge_M_AXI_B_ARVALID),
        .S00_AXI_awaddr(pcie_bridge_M_AXI_B_AWADDR),
        .S00_AXI_awburst(pcie_bridge_M_AXI_B_AWBURST),
        .S00_AXI_awcache(pcie_bridge_M_AXI_B_AWCACHE),
        .S00_AXI_awid(pcie_bridge_M_AXI_B_AWID),
        .S00_AXI_awlen(pcie_bridge_M_AXI_B_AWLEN),
        .S00_AXI_awlock(pcie_bridge_M_AXI_B_AWLOCK),
        .S00_AXI_awprot(pcie_bridge_M_AXI_B_AWPROT),
        .S00_AXI_awready(pcie_bridge_M_AXI_B_AWREADY),
        .S00_AXI_awsize(pcie_bridge_M_AXI_B_AWSIZE),
        .S00_AXI_awvalid(pcie_bridge_M_AXI_B_AWVALID),
        .S00_AXI_bid(pcie_bridge_M_AXI_B_BID),
        .S00_AXI_bready(pcie_bridge_M_AXI_B_BREADY),
        .S00_AXI_bresp(pcie_bridge_M_AXI_B_BRESP),
        .S00_AXI_bvalid(pcie_bridge_M_AXI_B_BVALID),
        .S00_AXI_rdata(pcie_bridge_M_AXI_B_RDATA),
        .S00_AXI_rid(pcie_bridge_M_AXI_B_RID),
        .S00_AXI_rlast(pcie_bridge_M_AXI_B_RLAST),
        .S00_AXI_rready(pcie_bridge_M_AXI_B_RREADY),
        .S00_AXI_rresp(pcie_bridge_M_AXI_B_RRESP),
        .S00_AXI_rvalid(pcie_bridge_M_AXI_B_RVALID),
        .S00_AXI_wdata(pcie_bridge_M_AXI_B_WDATA),
        .S00_AXI_wlast(pcie_bridge_M_AXI_B_WLAST),
        .S00_AXI_wready(pcie_bridge_M_AXI_B_WREADY),
        .S00_AXI_wstrb(pcie_bridge_M_AXI_B_WSTRB),
        .S00_AXI_wvalid(pcie_bridge_M_AXI_B_WVALID),
        .aclk(pcie_bridge_axi_aclk),
        .aresetn(pcie_bridge_axi_aresetn));
endmodule
