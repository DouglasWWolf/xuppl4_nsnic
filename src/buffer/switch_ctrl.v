//====================================================================================
//                        ------->  Revision History  <------
//====================================================================================
//
//   Date     Who   Ver  Changes
//====================================================================================
// 17-Mar-25  DWW     1  Initial creation
//====================================================================================

/*
   Controls the switch that determines which datapath incoming QSFP data streams into
*/


module switch_ctrl
(
    input      clk, resetn,

    output reg inflow_q,

    input      has_data0, has_data1,

    input      inflow_done0, inflow_done1
);

wire[1:0] inflow_done;
assign inflow_done[0] = inflow_done0;
assign inflow_done[1] = inflow_done1;

wire[1:0] has_data;
assign has_data[0] = has_data0;
assign has_data[1] = has_data1;

wire other_q = ~inflow_q;

reg fsm_state;
always @(posedge clk) begin
    
    if (resetn == 0) begin
        inflow_q  <= 0;
        fsm_state <= 0;
    end 

    else case(fsm_state)

        0:  if (has_data[inflow_q]) begin
                inflow_q  <= ~inflow_q;
                fsm_state <= 1;
            end

        1:  if (inflow_done[other_q]) begin
                fsm_state <= 0;
            end

    endcase


end


endmodule