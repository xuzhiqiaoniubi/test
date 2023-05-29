module counter(
input eclk,en_counter,clr,//输入信号
output reg [10:0] cnt,	//计数
output reg cnt_full
);

//只有当计数使能为高电平的时候，计数器才会计数
always@(posedge eclk or negedge clr)
	begin
		if(!clr)
			cnt <= 0;
		else if(en_counter)
			cnt <= cnt + 1'b1;
		else 
			cnt <= 0;
	end

always@(posedge eclk or negedge clr)
begin
	if(!clr)
		cnt_full <= 1'b0;
	else if(cnt == 3'd999)
		cnt_full <= 1'b1;
	else
		cnt_full <= 1'b0;
end 
endmodule 