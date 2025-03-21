//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Fri Mar 21 15:16:51 2025
//Host        : simtool-5 running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target top_level_wrapper.bd
//Design      : top_level_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top_level_wrapper
   (ddr4_bank0_clk_clk_n,
    ddr4_bank0_clk_clk_p,
    ddr4_bank1_clk_clk_n,
    ddr4_bank1_clk_clk_p,
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
    pcie_refclk_clk_p);
  input ddr4_bank0_clk_clk_n;
  input ddr4_bank0_clk_clk_p;
  input ddr4_bank1_clk_clk_n;
  input ddr4_bank1_clk_clk_p;
  output m0_ddr4_act_n;
  output [16:0]m0_ddr4_adr;
  output [1:0]m0_ddr4_ba;
  output [1:0]m0_ddr4_bg;
  output [0:0]m0_ddr4_ck_c;
  output [0:0]m0_ddr4_ck_t;
  output [0:0]m0_ddr4_cke;
  output [0:0]m0_ddr4_cs_n;
  inout [7:0]m0_ddr4_dm_n;
  inout [63:0]m0_ddr4_dq;
  inout [7:0]m0_ddr4_dqs_c;
  inout [7:0]m0_ddr4_dqs_t;
  output [0:0]m0_ddr4_odt;
  output m0_ddr4_reset_n;
  output m1_ddr4_act_n;
  output [16:0]m1_ddr4_adr;
  output [1:0]m1_ddr4_ba;
  output [1:0]m1_ddr4_bg;
  output [0:0]m1_ddr4_ck_c;
  output [0:0]m1_ddr4_ck_t;
  output [0:0]m1_ddr4_cke;
  output [0:0]m1_ddr4_cs_n;
  inout [7:0]m1_ddr4_dm_n;
  inout [63:0]m1_ddr4_dq;
  inout [7:0]m1_ddr4_dqs_c;
  inout [7:0]m1_ddr4_dqs_t;
  output [0:0]m1_ddr4_odt;
  output m1_ddr4_reset_n;
  input [15:0]pcie_mgt_rxn;
  input [15:0]pcie_mgt_rxp;
  output [15:0]pcie_mgt_txn;
  output [15:0]pcie_mgt_txp;
  input [0:0]pcie_refclk_clk_n;
  input [0:0]pcie_refclk_clk_p;

  wire ddr4_bank0_clk_clk_n;
  wire ddr4_bank0_clk_clk_p;
  wire ddr4_bank1_clk_clk_n;
  wire ddr4_bank1_clk_clk_p;
  wire m0_ddr4_act_n;
  wire [16:0]m0_ddr4_adr;
  wire [1:0]m0_ddr4_ba;
  wire [1:0]m0_ddr4_bg;
  wire [0:0]m0_ddr4_ck_c;
  wire [0:0]m0_ddr4_ck_t;
  wire [0:0]m0_ddr4_cke;
  wire [0:0]m0_ddr4_cs_n;
  wire [7:0]m0_ddr4_dm_n;
  wire [63:0]m0_ddr4_dq;
  wire [7:0]m0_ddr4_dqs_c;
  wire [7:0]m0_ddr4_dqs_t;
  wire [0:0]m0_ddr4_odt;
  wire m0_ddr4_reset_n;
  wire m1_ddr4_act_n;
  wire [16:0]m1_ddr4_adr;
  wire [1:0]m1_ddr4_ba;
  wire [1:0]m1_ddr4_bg;
  wire [0:0]m1_ddr4_ck_c;
  wire [0:0]m1_ddr4_ck_t;
  wire [0:0]m1_ddr4_cke;
  wire [0:0]m1_ddr4_cs_n;
  wire [7:0]m1_ddr4_dm_n;
  wire [63:0]m1_ddr4_dq;
  wire [7:0]m1_ddr4_dqs_c;
  wire [7:0]m1_ddr4_dqs_t;
  wire [0:0]m1_ddr4_odt;
  wire m1_ddr4_reset_n;
  wire [15:0]pcie_mgt_rxn;
  wire [15:0]pcie_mgt_rxp;
  wire [15:0]pcie_mgt_txn;
  wire [15:0]pcie_mgt_txp;
  wire [0:0]pcie_refclk_clk_n;
  wire [0:0]pcie_refclk_clk_p;

  top_level top_level_i
       (.ddr4_bank0_clk_clk_n(ddr4_bank0_clk_clk_n),
        .ddr4_bank0_clk_clk_p(ddr4_bank0_clk_clk_p),
        .ddr4_bank1_clk_clk_n(ddr4_bank1_clk_clk_n),
        .ddr4_bank1_clk_clk_p(ddr4_bank1_clk_clk_p),
        .m0_ddr4_act_n(m0_ddr4_act_n),
        .m0_ddr4_adr(m0_ddr4_adr),
        .m0_ddr4_ba(m0_ddr4_ba),
        .m0_ddr4_bg(m0_ddr4_bg),
        .m0_ddr4_ck_c(m0_ddr4_ck_c),
        .m0_ddr4_ck_t(m0_ddr4_ck_t),
        .m0_ddr4_cke(m0_ddr4_cke),
        .m0_ddr4_cs_n(m0_ddr4_cs_n),
        .m0_ddr4_dm_n(m0_ddr4_dm_n),
        .m0_ddr4_dq(m0_ddr4_dq),
        .m0_ddr4_dqs_c(m0_ddr4_dqs_c),
        .m0_ddr4_dqs_t(m0_ddr4_dqs_t),
        .m0_ddr4_odt(m0_ddr4_odt),
        .m0_ddr4_reset_n(m0_ddr4_reset_n),
        .m1_ddr4_act_n(m1_ddr4_act_n),
        .m1_ddr4_adr(m1_ddr4_adr),
        .m1_ddr4_ba(m1_ddr4_ba),
        .m1_ddr4_bg(m1_ddr4_bg),
        .m1_ddr4_ck_c(m1_ddr4_ck_c),
        .m1_ddr4_ck_t(m1_ddr4_ck_t),
        .m1_ddr4_cke(m1_ddr4_cke),
        .m1_ddr4_cs_n(m1_ddr4_cs_n),
        .m1_ddr4_dm_n(m1_ddr4_dm_n),
        .m1_ddr4_dq(m1_ddr4_dq),
        .m1_ddr4_dqs_c(m1_ddr4_dqs_c),
        .m1_ddr4_dqs_t(m1_ddr4_dqs_t),
        .m1_ddr4_odt(m1_ddr4_odt),
        .m1_ddr4_reset_n(m1_ddr4_reset_n),
        .pcie_mgt_rxn(pcie_mgt_rxn),
        .pcie_mgt_rxp(pcie_mgt_rxp),
        .pcie_mgt_txn(pcie_mgt_txn),
        .pcie_mgt_txp(pcie_mgt_txp),
        .pcie_refclk_clk_n(pcie_refclk_clk_n),
        .pcie_refclk_clk_p(pcie_refclk_clk_p));
endmodule
