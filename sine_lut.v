module sineLUT(clk, rst, data);
	input clk, rst;
	output reg[7:0] data;
	
	reg[7:0] sine_reg [0:29];
	integer i;
	
	initial begin
		i = 0;
		sine_reg[0] = 128;
		sine_reg[1] = 155;
		sine_reg[2] = 181;
		sine_reg[3] = 205;
		sine_reg[4] = 225;
		sine_reg[5] = 240;
		sine_reg[6] = 250;
		sine_reg[7] = 255;
		sine_reg[8] = 253;
		sine_reg[9] = 246;
		sine_reg[10] = 233;
		sine_reg[11] = 215;
		sine_reg[12] = 193;
		sine_reg[13] = 168;
		sine_reg[14] = 141;
		sine_reg[15] = 114;
		sine_reg[16] = 87;
		sine_reg[17] = 62;
		sine_reg[18] = 40;
		sine_reg[19] = 22;
		sine_reg[20] = 9;
		sine_reg[21] = 2;
		sine_reg[22] = 0;
		sine_reg[23] = 5;
		sine_reg[24] = 15;
		sine_reg[25] = 30;
		sine_reg[26] = 50;
		sine_reg[27] = 74;
		sine_reg[28] = 100;
		sine_reg[29] = 128;
	end
	
	always @(posedge clk) begin
		if(rst == 1)begin
			i = 0;
			data <= 0;
		end
		else begin
			data <= sine_reg[i];
			if(i == 29)
				i = 0;
			else
				i = i + 1;
		end
		
	end
	
	
	
endmodule