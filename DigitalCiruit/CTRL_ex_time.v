`timescale 1 ms / 1 us
module CTRL_ex_time (input wire exp_inc, exp_dec, clk, reset, output reg [4:0] ex_time);
	always @(posedge clk) begin
		
		// reset set exposure time back to initial value
		if (reset) ex_time <= 15;
		
		// if both buttons are pressed, the exposure time remains unchanged
		
		if (exp_inc && exp_dec) ex_time <= ex_time;

			
		// increase by 1ms if exp_inc is pressed and we are under our maximum exposure time of 30ms
	
		else if (exp_inc & ex_time<30) ex_time <= ex_time+1;

			
		// decrease by 1ms if exp_dec is pressed and we are over our minimum exposure time of 2ms

		else if (exp_dec & ex_time>2) ex_time <= ex_time-1;
		
	end
endmodule					
		