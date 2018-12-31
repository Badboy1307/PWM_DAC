`timescale 1ns / 10ps
module testPWM;

reg clk_r, rst_n_r;
reg[7:0] duty_w;
wire pwm_w;
pwmGen pwm_dut(
	.clk(clk_r),
	.rst_n(rst_n_r),
	.duty(duty_w),
	.pwm_out(pwm_w)
);

initial begin 
clk_r=0;
forever #1 clk_r=~clk_r;
end

initial begin
rst_n_r=1;
#20;
rst_n_r=0;
#512;
duty_w = 8'd64;
#512
duty_w = 8'd128;
#512
duty_w = 8'd250;

end

endmodule