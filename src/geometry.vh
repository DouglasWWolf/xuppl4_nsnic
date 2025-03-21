//====================================================================================
//                        ------->  Revision History  <------
//====================================================================================
//
//   Date     Who   Ver  Changes
//====================================================================================
// 17-Mar-25  DWW     1  Initial creation
//====================================================================================

// These are the two banks of RAM
localparam[63:0] RAM0_BASE_ADDR = 64'h1_0000_0000;
localparam[63:0] RAM1_BASE_ADDR = 64'h2_0000_0000;

// This most effecient burst size for writing to RAM is 4KB
localparam BURST_BYTES = 1024;

// The number of clock-cycles in a full burst.  If DW=512, this is 64
localparam CYCLES_PER_RAM_BLOCK = BURST_BYTES / (DW/8);

// This is the base address of the RAM bank for this channel
localparam[63:0] RAM_BASE_ADDR = (CHANNEL == 0) ? RAM0_BASE_ADDR : RAM1_BASE_ADDR;
