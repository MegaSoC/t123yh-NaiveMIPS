// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
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
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:naivemips:1.2
// IP Revision: 1

(* X_CORE_INFO = "cpu_ip_core,Vivado 2020.2" *)
(* CHECK_LICENSE_TYPE = "bd_soc_naivemips_1_0,cpu_ip_core,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module naivemips (
  ext_int,
  aclk,
  aresetn,
  cpu_arid,
  cpu_araddr,
  cpu_arlen,
  cpu_arsize,
  cpu_arburst,
  cpu_arlock,
  cpu_arcache,
  cpu_arprot,
  cpu_arvalid,
  cpu_arready,
  cpu_rid,
  cpu_rdata,
  cpu_rresp,
  cpu_rlast,
  cpu_rvalid,
  cpu_rready,
  cpu_awid,
  cpu_awaddr,
  cpu_awlen,
  cpu_awsize,
  cpu_awburst,
  cpu_awlock,
  cpu_awcache,
  cpu_awprot,
  cpu_awvalid,
  cpu_awready,
  cpu_wid,
  cpu_wdata,
  cpu_wstrb,
  cpu_wlast,
  cpu_wvalid,
  cpu_wready,
  cpu_bid,
  cpu_bresp,
  cpu_bvalid,
  cpu_bready,
  debug_wb_pc_m,
  debug_wb_rf_wen_m,
  debug_wb_rf_wnum_m,
  debug_wb_rf_wdata_m,
  debug_instr_i,
  debug_pc_i
);

input wire [5 : 0] ext_int;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF cpu, ASSOCIATED_RESET aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /main_mmcm_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARID" *)
output wire [3 : 0] cpu_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARADDR" *)
output wire [31 : 0] cpu_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARLEN" *)
output wire [3 : 0] cpu_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARSIZE" *)
output wire [2 : 0] cpu_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARBURST" *)
output wire [1 : 0] cpu_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARLOCK" *)
output wire [1 : 0] cpu_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARCACHE" *)
output wire [3 : 0] cpu_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARPROT" *)
output wire [2 : 0] cpu_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARVALID" *)
output wire cpu_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu ARREADY" *)
input wire cpu_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu RID" *)
input wire [3 : 0] cpu_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu RDATA" *)
input wire [31 : 0] cpu_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu RRESP" *)
input wire [1 : 0] cpu_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu RLAST" *)
input wire cpu_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu RVALID" *)
input wire cpu_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu RREADY" *)
output wire cpu_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWID" *)
output wire [3 : 0] cpu_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWADDR" *)
output wire [31 : 0] cpu_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWLEN" *)
output wire [3 : 0] cpu_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWSIZE" *)
output wire [2 : 0] cpu_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWBURST" *)
output wire [1 : 0] cpu_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWLOCK" *)
output wire [1 : 0] cpu_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWCACHE" *)
output wire [3 : 0] cpu_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWPROT" *)
output wire [2 : 0] cpu_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWVALID" *)
output wire cpu_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu AWREADY" *)
input wire cpu_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu WID" *)
output wire [3 : 0] cpu_wid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu WDATA" *)
output wire [31 : 0] cpu_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu WSTRB" *)
output wire [3 : 0] cpu_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu WLAST" *)
output wire cpu_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu WVALID" *)
output wire cpu_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu WREADY" *)
input wire cpu_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu BID" *)
input wire [3 : 0] cpu_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu BRESP" *)
input wire [1 : 0] cpu_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu BVALID" *)
input wire cpu_bvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cpu, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 50000000, ID_WIDTH 4, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN /main_mmcm_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSE\
R_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 cpu BREADY" *)
output wire cpu_bready;
output wire [31 : 0] debug_wb_pc_m;
output wire [3 : 0] debug_wb_rf_wen_m;
output wire [4 : 0] debug_wb_rf_wnum_m;
output wire [31 : 0] debug_wb_rf_wdata_m;
output wire [31 : 0] debug_instr_i;
output wire [31 : 0] debug_pc_i;

mycpu_top #(.IMPLEMENT_LIKELY(1)) u_cpu(
	.debug_wb_pc(debug_wb_pc_m),
        .debug_wb_rf_wen(debug_wb_rf_wen_m), 
        .debug_wb_rf_wnum(debug_wb_rf_wnum_m),
        .debug_wb_rf_wdata(debug_wb_rf_wdata_m),
        .debug_i_pc(debug_pc_i),
        .debug_i_instr(debug_instr_i),
    .ext_int   (ext_int),   //high active

    .aclk      (aclk       ),
    .aresetn   (aresetn    ),   //low active

    .arid      (cpu_arid      ),
    .araddr    (cpu_araddr    ),
    .arlen     (cpu_arlen     ),
    .arsize    (cpu_arsize    ),
    .arburst   (cpu_arburst   ),
    .arlock    (cpu_arlock    ),
    .arcache   (cpu_arcache   ),
    .arprot    (cpu_arprot    ),
    .arvalid   (cpu_arvalid   ),
    .arready   (cpu_arready   ),
                
    .rid       (cpu_rid       ),
    .rdata     (cpu_rdata     ),
    .rresp     (cpu_rresp     ),
    .rlast     (cpu_rlast     ),
    .rvalid    (cpu_rvalid    ),
    .rready    (cpu_rready    ),
               
    .awid      (cpu_awid      ),
    .awaddr    (cpu_awaddr    ),
    .awlen     (cpu_awlen     ),
    .awsize    (cpu_awsize    ),
    .awburst   (cpu_awburst   ),
    .awlock    (cpu_awlock    ),
    .awcache   (cpu_awcache   ),
    .awprot    (cpu_awprot    ),
    .awvalid   (cpu_awvalid   ),
    .awready   (cpu_awready   ),
    
    .wid       (cpu_wid       ),
    .wdata     (cpu_wdata     ),
    .wstrb     (cpu_wstrb     ),
    .wlast     (cpu_wlast     ),
    .wvalid    (cpu_wvalid    ),
    .wready    (cpu_wready    ),
    
    .bid       (cpu_bid       ),
    .bresp     (cpu_bresp     ),
    .bvalid    (cpu_bvalid    ),
    .bready    (cpu_bready    )
);
endmodule


