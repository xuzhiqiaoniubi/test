module random_timer(
    input clk,
    input en,
    output reg rand_out
);

reg [31:0] timer;
reg [31:0] rand = 32'hDEADBEEF;
reg [31:0] count;

always @(posedge clk)
begin
	begin
        rand <= {rand[30:0], rand[0] ^ rand[1]};
        timer <= rand % 6000000;
        if (en)
		  begin
            count <= timer;
            rand_out <= 0;
        end 
		  else if (count != 0)
		  begin
            count <= count - 1;
            if (count == 1) 
				begin
                rand_out <= 1;
            end
        end
    end
end

endmodule
