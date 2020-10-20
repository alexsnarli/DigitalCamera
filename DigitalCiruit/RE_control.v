`timescale 1 ms / 1 us	

module RE_control ( input reg init , exp_inc, exp_dec, clk , reset , output reg NRE_1 , NRE_2 , ADC , expose , erase );
	reg ovf5 , start ;
	reg [4:0] ex_time ;	
	
	// Exposure time controller
	CTRL_ex_time Ctrl_ex ( exp_inc, exp_dec, clk , reset , ex_time ); 
	
	// Exposure time counter
	Timer_counter Timer (clk , reset , start, ex_time , ovf5);
	
	// Finite state machine
	FSM_ex_control FSM (init , clk , reset , ovf5, NRE_1 , NRE_2, ADC, expose , erase , start );
endmodule