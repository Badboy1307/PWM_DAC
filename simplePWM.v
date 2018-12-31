module pwmGen(clk, rst_n, duty, pwm_out);
	input clk, rst_n;
	input[7:0] duty;
	output pwm_out;
	
	reg [7:0] cnt, duty_reg;
	
	always @(posedge clk) begin
		if (rst_n == 1)begin
			cnt <= 0;
			duty_reg <= 0;
		end
		else
			if(cnt == 8'd255) begin
				duty_reg <= duty;
				cnt <= 0;
			end
			else
				cnt <= cnt + 1;
	end
	
	assign pwm_out = (duty_reg > cnt);
		
endmodule