
module data_gen # (parameter DW=512)
(
    input   clk, resetn,

    input       start,
    input[31:0] max_cycles,

    output[DW-1:0] axis_tdata,
    output         axis_tvalid,
    input          axis_tready
);

reg[15:0] data;
reg[31:0] cycles_out;
reg[ 3:0] fsm_state;

assign axis_tvalid = (fsm_state == 1);

wire xfer = axis_tvalid & axis_tready;

always @(posedge clk) begin
    if (resetn == 0 || start)
        data <= 0;
    else if (xfer)
        data <= data + 1;
end

assign axis_tdata = {(DW/2){data}};

reg[15:0] counter;

always @(posedge clk) begin

    if (resetn == 0) begin
        fsm_state <= 0;
    end

    else case(fsm_state)

        0:  if (start) begin
                cycles_out  <= 1;
                counter     <= 1;
                fsm_state   <= 1;
            end

        1:  if (xfer) begin
                if (cycles_out == max_cycles) 
                    fsm_state <= 0;
                else if (counter == 3) begin
                    counter   <= 1;
                    fsm_state <= 2;
                end else begin
                    counter <= counter + 1;
                end

                cycles_out <= cycles_out + 1;
            end

        2:  if (counter == 3) begin
                counter   <= 1;
                fsm_state <= 1;
            end else begin
                counter <= counter + 1;
            end

    endcase

end

endmodule