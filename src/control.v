//====================================================================================
//                        ------->  Revision History  <------
//====================================================================================
//
//   Date     Who   Ver  Changes
//====================================================================================
// 17-Mar-25  DWW     1  Initial creation
//====================================================================================

/*
    This is an example (and template) for an AXI4-lite slave

    This slave accepts 32-bit values written to a pair of register, and allows
    their sum to be read from a third register
*/


module control # (parameter AW=8)
(
    input clk, resetn,

    output reg[31:0] packet_count,
    output reg       start,

    // When this is a '1', input packets are routed back out the QSFP port
    output reg       loopback,

    // These are the high-water mark of RAM usage for each RAM bank
    input[63:0] hwm_0, hwm_1,

    // The min and max valid addresses for PCI writes
    output reg[63:0] pci_range_min, pci_range_max,


    // We use this to monitor the output of the buffer for sequence errors
    (* X_INTERFACE_MODE = "monitor" *)
    input[511:0] seq_axis_tdata,
    input        seq_axis_tvalid,
    input        seq_axis_tlast,
    input        seq_axis_tready,

    //================== This is an AXI4-Lite slave interface ==================
        
    // "Specify write address"              -- Master --    -- Slave --
    input[AW-1:0]                           S_AXI_AWADDR,   
    input                                   S_AXI_AWVALID,  
    output                                                  S_AXI_AWREADY,
    input[2:0]                              S_AXI_AWPROT,

    // "Write Data"                         -- Master --    -- Slave --
    input[31:0]                             S_AXI_WDATA,      
    input                                   S_AXI_WVALID,
    input[3:0]                              S_AXI_WSTRB,
    output                                                  S_AXI_WREADY,

    // "Send Write Response"                -- Master --    -- Slave --
    output[1:0]                                             S_AXI_BRESP,
    output                                                  S_AXI_BVALID,
    input                                   S_AXI_BREADY,

    // "Specify read address"               -- Master --    -- Slave --
    input[AW-1:0]                           S_AXI_ARADDR,     
    input                                   S_AXI_ARVALID,
    input[2:0]                              S_AXI_ARPROT,     
    output                                                  S_AXI_ARREADY,

    // "Read data back to master"           -- Master --    -- Slave --
    output[31:0]                                            S_AXI_RDATA,
    output                                                  S_AXI_RVALID,
    output[1:0]                                             S_AXI_RRESP,
    input                                   S_AXI_RREADY
    //==========================================================================
);  

//=========================  AXI Register Map  =============================
localparam REG_PACKET_COUNT =  0;
localparam REG_HWMARK_0H    =  1;
localparam REG_HWMARK_0L    =  2;
localparam REG_HWMARK_1H    =  3;
localparam REG_HWMARK_1L    =  4;
localparam REG_PCI_MIN_H    =  5;
localparam REG_PCI_MIN_L    =  6;
localparam REG_PCI_MAX_H    =  7;
localparam REG_PCI_MAX_L    =  8;
localparam REG_LOOPBACK     =  9;
localparam REG_ERRORS       = 10;
//==========================================================================


//==========================================================================
// We'll communicate with the AXI4-Lite Slave core with these signals.
//==========================================================================
// AXI Slave Handler Interface for write requests
wire[31:0]  ashi_windx;     // Input   Write register-index
wire[31:0]  ashi_waddr;     // Input:  Write-address
wire[31:0]  ashi_wdata;     // Input:  Write-data
wire        ashi_write;     // Input:  1 = Handle a write request
reg[1:0]    ashi_wresp;     // Output: Write-response (OKAY, DECERR, SLVERR)
wire        ashi_widle;     // Output: 1 = Write state machine is idle

// AXI Slave Handler Interface for read requests
wire[31:0]  ashi_rindx;     // Input   Read register-index
wire[31:0]  ashi_raddr;     // Input:  Read-address
wire        ashi_read;      // Input:  1 = Handle a read request
reg[31:0]   ashi_rdata;     // Output: Read data
reg[1:0]    ashi_rresp;     // Output: Read-response (OKAY, DECERR, SLVERR);
wire        ashi_ridle;     // Output: 1 = Read state machine is idle
//==========================================================================

// The state of the state-machines that handle AXI4-Lite read and AXI4-Lite write
reg ashi_write_state, ashi_read_state;

// The AXI4 slave state machines are idle when in state 0 and their "start" signals are low
assign ashi_widle = (ashi_write == 0) && (ashi_write_state == 0);
assign ashi_ridle = (ashi_read  == 0) && (ashi_read_state  == 0);
   
// These are the valid values for ashi_rresp and ashi_wresp
localparam OKAY   = 0;
localparam SLVERR = 2;
localparam DECERR = 3;

// The address mask is 'AW' 1-bits in a row
localparam ADDR_MASK = (1 << AW) - 1;


// This will be a 1 when a sequence error of detected
reg seq_error;

//=============================================================================
// This block monitors for sequence errors
//
// When packets are generated with the built-in packet generator, the high
// 32 bits of TDATA always contain a counter.  If any data cycle occurs where
// that counter is wrong, it indicates that something went awry in the buffer.
//=============================================================================
wire[31:0] seq_data = seq_axis_tdata[64*8-1 -: 32];
reg [31:0] seq_prior;
//-----------------------------------------------------------------------------
always @(posedge clk) begin
    if (resetn == 0)
        seq_error <= 0;

    else if (seq_axis_tvalid & seq_axis_tready) begin

        if (seq_data != 0 && seq_data != (seq_prior+1))
            seq_error <= 1;

        seq_prior <= seq_data;

    end
end
//=============================================================================


//==========================================================================
// This state machine handles AXI4-Lite write requests
//==========================================================================
always @(posedge clk) begin

    start <= 0;

    // If we're in reset, initialize important registers
    if (resetn == 0) begin
        ashi_write_state  <= 0;
        pci_range_min <= 64'h1_0000_0000;
        pci_range_max <= 64'h1_FFFF_FFFF;
        loopback      <= 0;
    end
    
    // Otherwise, we're not in reset...
    else case (ashi_write_state)
        
        // If an AXI write-request has occured...
        0:  if (ashi_write) begin
       
                // Assume for the moment that the result will be OKAY
                ashi_wresp <= OKAY;              
            
                // ashi_windex = index of register to be written
                case (ashi_windx)
               
                    REG_PACKET_COUNT:
                        begin
                            packet_count <= ashi_wdata;
                            start       <= 1;
                        end

                    REG_PCI_MAX_H:  pci_range_max[63:32] <= ashi_wdata;
                    REG_PCI_MAX_L:  pci_range_max[31:00] <= ashi_wdata;                    
                    REG_PCI_MIN_H:  pci_range_min[63:32] <= ashi_wdata;
                    REG_PCI_MIN_L:  pci_range_min[31:00] <= ashi_wdata; 
                    REG_LOOPBACK:   loopback             <= ashi_wdata;                   

                    // Writes to any other register are a decode-error
                    default: ashi_wresp <= DECERR;
                endcase
            end

        // Dummy state, doesn't do anything
        1: ashi_write_state <= 0;

    endcase
end
//==========================================================================





//==========================================================================
// World's simplest state machine for handling AXI4-Lite read requests
//==========================================================================
always @(posedge clk) begin

    // If we're in reset, initialize important registers
    if (resetn == 0) begin
        ashi_read_state <= 0;
    
    // If we're not in reset, and a read-request has occured...        
    end else if (ashi_read) begin
   
        // Assume for the moment that the result will be OKAY
        ashi_rresp <= OKAY;              
        
        // ashi_rindex = index of register to be read
        case (ashi_rindx)
            
            // Allow a read from any valid register                
            REG_PACKET_COUNT:   ashi_rdata <= packet_count;
            REG_HWMARK_0H:      ashi_rdata <= hwm_0[63:32];
            REG_HWMARK_0L:      ashi_rdata <= hwm_0[31:00];
            REG_HWMARK_1H:      ashi_rdata <= hwm_1[63:32];
            REG_HWMARK_1L:      ashi_rdata <= hwm_1[31:00];
            REG_PCI_MIN_H:      ashi_rdata <= pci_range_min[63:32];
            REG_PCI_MIN_L:      ashi_rdata <= pci_range_min[31:00];
            REG_PCI_MAX_H:      ashi_rdata <= pci_range_max[63:32];
            REG_PCI_MAX_L:      ashi_rdata <= pci_range_max[31:00];
            REG_LOOPBACK:       ashi_rdata <= loopback;
            REG_ERRORS:         ashi_rdata <= seq_error;

            // Reads of any other register are a decode-error
            default: ashi_rresp <= DECERR;

        endcase
    end
end
//==========================================================================



//==========================================================================
// This connects us to an AXI4-Lite slave core
//==========================================================================
axi4_lite_slave#(ADDR_MASK) i_axi4lite_slave
(
    .clk            (clk),
    .resetn         (resetn),
    
    // AXI AW channel
    .AXI_AWADDR     (S_AXI_AWADDR),
    .AXI_AWVALID    (S_AXI_AWVALID),   
    .AXI_AWREADY    (S_AXI_AWREADY),
    
    // AXI W channel
    .AXI_WDATA      (S_AXI_WDATA),
    .AXI_WVALID     (S_AXI_WVALID),
    .AXI_WSTRB      (S_AXI_WSTRB),
    .AXI_WREADY     (S_AXI_WREADY),

    // AXI B channel
    .AXI_BRESP      (S_AXI_BRESP),
    .AXI_BVALID     (S_AXI_BVALID),
    .AXI_BREADY     (S_AXI_BREADY),

    // AXI AR channel
    .AXI_ARADDR     (S_AXI_ARADDR), 
    .AXI_ARVALID    (S_AXI_ARVALID),
    .AXI_ARREADY    (S_AXI_ARREADY),

    // AXI R channel
    .AXI_RDATA      (S_AXI_RDATA),
    .AXI_RVALID     (S_AXI_RVALID),
    .AXI_RRESP      (S_AXI_RRESP),
    .AXI_RREADY     (S_AXI_RREADY),

    // ASHI write-request registers
    .ASHI_WADDR     (ashi_waddr),
    .ASHI_WINDX     (ashi_windx),
    .ASHI_WDATA     (ashi_wdata),
    .ASHI_WRITE     (ashi_write),
    .ASHI_WRESP     (ashi_wresp),
    .ASHI_WIDLE     (ashi_widle),

    // ASHI read registers
    .ASHI_RADDR     (ashi_raddr),
    .ASHI_RINDX     (ashi_rindx),
    .ASHI_RDATA     (ashi_rdata),
    .ASHI_READ      (ashi_read ),
    .ASHI_RRESP     (ashi_rresp),
    .ASHI_RIDLE     (ashi_ridle)
);
//==========================================================================



endmodule
