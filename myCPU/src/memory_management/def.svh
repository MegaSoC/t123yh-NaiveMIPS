`ifndef DEFS_SVH
`define DEFS_SVH

`default_nettype wire

typedef struct packed {
    logic [3:0]  arid;
    logic [31:0] araddr;
    logic [3 :0] arlen;
    logic [2 :0] arsize;
    logic [1 :0] arburst;
    logic [1 :0] arlock;
    logic [3 :0] arcache;
    logic [2 :0] arprot;
    logic        arvalid;
    logic        rready;
    logic [3:0]  awid;
    logic [31:0] awaddr;
    logic [3 :0] awlen;
    logic [2 :0] awsize;
    logic [1 :0] awburst;
    logic [1 :0] awlock;
    logic [3 :0] awcache;
    logic [2 :0] awprot;
    logic        awvalid;
    logic [3:0]  wid;
    logic [31:0] wdata;
    logic [3 :0] wstrb;
    logic        wlast;
    logic        wvalid;
    logic        bready;
} axi_req;

typedef struct packed {
    logic        arready;
    logic [3 :0] rid;
    logic [31:0] rdata;
    logic [1 :0] rresp;
    logic        rlast;
    logic        rvalid;
    logic        awready;
    logic        wready;
    logic [3 :0] bid;
    logic [1 :0] bresp;
    logic        bvalid;
} axi_resp;



typedef struct packed{
	// ar
    logic [3:0]  arid ;
    logic [31:0] araddr;
    logic [3 :0] arlen;
    logic [2 :0] arsize;
    logic [1 :0] arburst;
    logic [1 :0] arlock;
    logic [3 :0] arcache;
    logic [2 :0] arprot;
    logic        arvalid;
	// r
    logic        rready;
} axi_r_req;

typedef struct packed {
	// ar
	logic        arready;
    // r
    logic [3 :0] rid;
	logic [31:0] rdata;
	logic [1 :0] rresp;
	logic        rlast;
	logic        rvalid;
} axi_r_resp;

typedef struct packed {
    // aw
    logic [3:0]  awid ;
    logic [31:0] awaddr;
    logic [3 :0] awlen;
    logic [2 :0] awsize;
    logic [1 :0] awburst;
    logic [1 :0] awlock;
    logic [3 :0] awcache;
    logic [2 :0] awprot;
    logic        awvalid;
    // w
    logic [3:0]  wid ;
    logic [31:0] wdata;
    logic [3 :0] wstrb;
    logic        wlast;
    logic        wvalid;
    // b
    logic        bready;
} axi_w_req;

typedef struct packed {
    // aw
	logic        awready;
	// w
	logic        wready;
    // b
    logic [3 :0] bid;
	logic [1 :0] bresp;
	logic        bvalid;
} axi_w_resp;

typedef logic [31:0] word;

typedef struct packed {
	logic [2:0] c0,c1;
	logic [7:0] asid;
	logic [18:0] vpn2;
	logic [23:0] pfn0,pfn1;
	logic d1,v1,d0,v0;
	logic G;
} tlb;

typedef struct packed {
	word phy_addr;
	logic miss, dirty, valid;
	//logic [2:0] cache_flag;
} tlb_result;

typedef struct packed {
    word entrylo0;
    word entrylo1;
    word entryhi;
    logic [11:0] mask;//PageMask[24:13]
    logic [4:0]  index;//Index[4:0]
} tlb_regs;
`define NOT_USE_TLB {32'd0,32'd0,32'd0,12'd0,5'd0}

typedef struct packed {
    logic [1:0]status;  //10:cache data 11:uncache data 00: cache instruction 01:uncache instruction
    logic [31:0] startaddr;
    logic [31:0] va; 
    logic [2:0] size;
    logic [3:0] len;
} mem_read_req;

typedef struct packed{
    logic [31:0] firstva;
    logic [31:0] firstaddr;
    logic [31:0] data;
    logic valid0;//2:cache data 3:uncache data 0: cache instruction 1:uncache instruction
    logic valid1; 
    logic valid2; 
    logic valid3; 
    logic last;
} mem_read_resp;

typedef struct packed{
    logic [3 : 0] len;
    logic [3:0] wen;
    logic [2:0] size;
    word addr;
} mem_write_req;



`endif
