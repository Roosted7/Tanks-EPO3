library IEEE;
use IEEE.std_logic_1164.ALL;

entity game_top is
   port(p_l_1         :in    std_logic;
        p_l_2         :in    std_logic;
        p_r_1         :in    std_logic;
        p_r_2         :in    std_logic;
        p_u_1         :in    std_logic;
        p_u_2         :in    std_logic;
        p_d_1         :in    std_logic;
        p_d_2         :in    std_logic;
        p_f_1         :in    std_logic;
        p_f_2         :in    std_logic;
        clk           :in    std_logic;
        reset         :in    std_logic;

        test_mode_enable                :in     std_logic;
        input_encoder_tank_1_result     :out     std_logic;
        input_encoder_tank_2_result     :out     std_logic;
        pixel_generator_tank_1_out      :out     std_logic;
        pixel_generator_tank_2_out      :out     std_logic;

	r_out		:out std_logic;
	g_out		:out std_logic;
	b_out		:out std_logic;
	hsync_out		:out std_logic;
	vsync_out		:out std_logic);
	
end game_top;