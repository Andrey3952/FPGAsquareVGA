	soc_system u0 (
		.clk_clk                               (<connected-to-clk_clk>),                               //                            clk.clk
		.reset_reset_n                         (<connected-to-reset_reset_n>),                         //                          reset.reset_n
		.pio_pad2_y_external_connection_export (<connected-to-pio_pad2_y_external_connection_export>), // pio_pad2_y_external_connection.export
		.pio_pad1_y_external_connection_export (<connected-to-pio_pad1_y_external_connection_export>), // pio_pad1_y_external_connection.export
		.pio_ball_y_external_connection_export (<connected-to-pio_ball_y_external_connection_export>), // pio_ball_y_external_connection.export
		.pio_ball_x_external_connection_export (<connected-to-pio_ball_x_external_connection_export>)  // pio_ball_x_external_connection.export
	);

