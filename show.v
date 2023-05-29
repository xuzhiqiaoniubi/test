module show(
input eclk,
input en,
input [3:0] data0,data1,data2,data3,data4,data5,data6,data7,
output reg [6:0] codeout,//说明数组宽度为7的输出信号
output reg [7:0] seg		 //说明数组宽度为6的输出信号
);

reg [3:0] cnt;
reg [3:0] d;

	always@(posedge eclk)//8进的计数器
	begin
		if(en)
			if(cnt==4'd15)	cnt <= 4'd0;
			else cnt <= cnt+4'd1;
		else 
			cnt <= 0;
	end	
	
	always @(cnt) //8-1数据选择器
	begin
		 case(cnt)
			  4'b0000: d = data0;
			  4'b0001: d = data1;
			  4'b0010: d = data2;
			  4'b0011: d = data3;
			  4'b0100: d = data4;
			  4'b0101: d = data5;
			  4'b0110: d = data6;
			  4'b0111: d = data7;
		 endcase
	end
	
	always @(d) //显示译码器
	if(en)
		case (d)
		4'd0 : seg<=8'b00000001;
		4'd1 : seg<=8'b00000010;
		4'd2 : seg<=8'b00000100;
		4'd3 : seg<=8'b00001000;
		4'd4 : seg<=8'b00010000;
		4'd5 : seg<=8'b00100000;
		4'd6 : seg<=8'b01000000;
		4'd7 : seg<=8'b10000000;
		default: seg=8'bx;
		endcase
	else
		seg<=8'b00000000;
	
	always @(cnt) //3-8译码器
	if(en)	
		case (cnt)
		4'd0 : codeout<=7'b1111110;
		4'd1 : codeout<=7'b0110000;
		4'd2 : codeout<=7'b1101101;
		4'd3 : codeout<=7'b1111001;
		4'd4 : codeout<=7'b0110011;
		4'd5 : codeout<=7'b1011011;
		4'd6 : codeout<=7'b1011111;
		4'd7 : codeout<=7'b1110000;
		4'd8 : codeout<=7'b1111111;
		4'd9 : codeout<=7'b1110011;
		default: codeout=7'bx;
		endcase
	else
		codeout<=7'b0000000;
		
endmodule 