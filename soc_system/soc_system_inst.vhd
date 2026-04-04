	component soc_system is
		port (
			clk_clk                               : in  std_logic                    := 'X'; -- clk
			pio_ball_x_external_connection_export : out std_logic_vector(9 downto 0);        -- export
			pio_ball_y_external_connection_export : out std_logic_vector(9 downto 0);        -- export
			pio_pad1_y_external_connection_export : out std_logic_vector(9 downto 0);        -- export
			pio_pad2_y_external_connection_export : out std_logic_vector(9 downto 0);        -- export
			reset_reset_n                         : in  std_logic                    := 'X'  -- reset_n
		);
	end component soc_system;

	u0 : component soc_system
		port map (
			clk_clk                               => CONNECTED_TO_clk_clk,                               --                            clk.clk
			pio_ball_x_external_connection_export => CONNECTED_TO_pio_ball_x_external_connection_export, -- pio_ball_x_external_connection.export
			pio_ball_y_external_connection_export => CONNECTED_TO_pio_ball_y_external_connection_export, -- pio_ball_y_external_connection.export
			pio_pad1_y_external_connection_export => CONNECTED_TO_pio_pad1_y_external_connection_export, -- pio_pad1_y_external_connection.export
			pio_pad2_y_external_connection_export => CONNECTED_TO_pio_pad2_y_external_connection_export, -- pio_pad2_y_external_connection.export
			reset_reset_n                         => CONNECTED_TO_reset_reset_n                          --                          reset.reset_n
		);

