`ifndef DEFS_SVH
`define DEFS_SVH

typedef struct packed {
	// ar
    logic [3:0]  arid;
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
    // aw
    logic [3:0]  awid;
    logic [31:0] awaddr;
    logic [3 :0] awlen;
    logic [2 :0] awsize;
    logic [1 :0] awburst;
    logic [1 :0] awlock;
    logic [3 :0] awcache;
    logic [2 :0] awprot;
    logic        awvalid;
    // w
    logic [3:0]  wid;
    logic [31:0] wdata;
    logic [3 :0] wstrb;
    logic        wlast;
    logic        wvalid;
    // b
    logic        bready;
} axi_req;

typedef struct packed {
	// ar
	logic        arready;
    // r
    logic [3 :0] rid;
	logic [31:0] rdata;
	logic [1 :0] rresp;
	logic        rlast;
	logic        rvalid;
	// aw
	logic        awready;
	// w
	logic        wready;
    // b
    logic [3 :0] bid;
	logic [1 :0] bresp;
	logic        bvalid;
} axi_resp;


typedef struct packed {
    logic [31:0] startaddr;
    logic [31:0] pc; 
    logic [3:0] len;
} mem_read_req;

typedef struct packed{
    logic [31:0] firstpc;
    logic [31:0] firstaddr;
    logic [127:0] data;
    logic valid;
    logic last;
} mem_read_resp;

`endif