module xiaodou (
input clk,
input BUTTON_IN,
output BUTTON_OUT);
reg [1:0] BUTTON_buf = 2'b11;

always @(posedge clk)
begin 
	BUTTON_buf[0] <= BUTTON_IN;
	BUTTON_buf[1] <= BUTTON_buf[0];
end

assign BUTTON_OUT <= |BUTTON_buf || BUTTON_IN; 

endmodule 