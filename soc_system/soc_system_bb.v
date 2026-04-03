
module soc_system (
	clk_clk,
	reset_reset_n,
	pio_pad2_y_external_connection_export,
	pio_pad1_y_external_connection_export,
	pio_ball_y_external_connection_export,
	pio_ball_x_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[9:0]	pio_pad2_y_external_connection_export;
	output	[9:0]	pio_pad1_y_external_connection_export;
	output	[9:0]	pio_ball_y_external_connection_export;
	output	[9:0]	pio_ball_x_external_connection_export;
endmodule
