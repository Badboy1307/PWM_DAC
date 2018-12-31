module top_pwm(pwm_out);
	output pwm_out;
	
	wire osc_clk;
	
	defparam OSCH_inst.NOM_FREQ = "53.20";
	OSCH OSCH_inst( 
		.STDBY(1'b0), 
		.OSC(osc_clk),
		.SEDSTDBY()
		); 
		
	wire[7:0] duty_w;
	
	pwmGen pwmGen_instance (
		.clk(osc_clk),
		.rst_n(1'b0),
		.duty(duty_w),
		.pwm_out(pwm_out)
	);
	
	reg[18:0] divider_reg;
	reg slow_clk_r;
	
	initial begin
		slow_clk_r = 0;
	end
	
	always @(posedge osc_clk) begin
		if(divider_reg == 19'd265999)begin
			divider_reg = 19'd0;
			slow_clk_r = ~slow_clk_r;
		end
		else
			divider_reg = divider_reg + 1;
	end
	
	sineLUT sineLUT_instance(
		.clk(slow_clk_r),
		.rst(1'b0),
		.data(duty_w)
	);
			
			
	
endmodule