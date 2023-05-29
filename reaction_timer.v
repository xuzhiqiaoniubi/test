module reaction_timer(
    input clk,//50Mhz
    input eclk,//1khz
    input clear,
    input start,
    input stop,
    output reg [6:0] codeout,
	 output reg [7:0] seg,
    output reg led
);

// 定义变量
reg [10:0] reaction_time;
reg [3:0] current_state, next_state;
reg [10:0] cnt,	//计数

reg clr, started, stopped, rand_out, en_counter, cnt_full, shumaguan_init, fangui;

	xiaodou(clk, clear, clr);//clear按键消抖
	xiaodou(clk, start, started);//start按键消抖
	xiaodou(clk, stop, stopped);//stop按键消抖
	random_timer(clk, started, rand_out);//产生随机时间
	counter(eclk, en_counter, clr, cnt, cnt_full);
	
	show();
	
// 更新状态和变量
always @(posedge clk, negedge clr)
begin
	if(!clr) current_state <= 0;
	else current_state <= next_state;

	case(current_state)
	  0: begin // 初始状态
			led <= 0;
			shumaguan_init <= 1;
	  end
	  1: begin // 计时状态
			en_counter <= 1;
			shumaguan_init <= 0;
	  end
	  2: begin // LED 点亮状态
			led <= 1; // LED 指示灯点亮。
			shumaguan_init <= 0;
	  end
	  3: begin // 停止计数状态
			reaction_time <= cnt; // 存储反应时间。
	  end
	  4: begin // 计数器达到最大值状态
			reaction_time <= cnt; // 存储反应时间。
	  end
	  5: begin // 犯规状态
			fangui <= 1; // 存储反应时间。
	  end
	endcase
end

// 状态机
always @(*)
begin
    case(current_state)
        0: begin // 初始状态
           if(started) next_state = 1;
			  else next_state = 0;
			  end
			  
        1: begin // 刚开始计时，间隔一段时间状态
           if(rand_out) next_state = 2;
           else if(stopped) next_state = 5;//还在等待时间，此时按下stop犯规
           else next_state = 1;
			  end
			  
        2:  begin // LED 点亮状态，此时计数器在计数
            if(stopped) next_state = 3;//合法按下stop，停止计数
            else if(cnt_full) next_state = 4;//计数器达到最大值
            else next_state = 2;
				end
				
        3: begin // 停止计数状态
            if(clr) next_state = 0;
            else next_state = 3;
        end
		  
        4: begin // 计数器达到最大值状态
            if(clr) next_state = 0;
            else next_state = 4;
        end
		  
        5: begin // 犯规状态
            if(clr) next_state = 0;
            else next_state = 5;
        end
    endcase
end


/*===========================================================计数器模块========================================================*/


/*===========================================================数码管显示模块========================================================*/


