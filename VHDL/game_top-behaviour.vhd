library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of game_top is
component in_syst_buff is
port(
	p_l		:in    std_logic;
	p_r	   	:in    std_logic;
	p_u		:in    std_logic;
	p_d		:in    std_logic;
	p_f		:in    std_logic;
        frame			:in    std_logic;
        clk  			:in    std_logic;
	reset		:in    std_logic;
	counter		:in    std_logic_vector(2 downto 0);
	counter_enable	 :out	  std_logic;
        t_e 			:out   std_logic_vector(2 downto 0));
end component;

component bullet_mod is
port(	  clk			 :in 	  std_logic;
		  b_clk 		 :in    std_logic;
        reset      :in    std_logic;
        fire_b1    :in    std_logic_vector(2 downto 0);
        l_t1       :in    std_logic;
        x_t1       :in    std_logic_vector(3 downto 0);
        y_t1       :in    std_logic_vector(3 downto 0);
        dir_t1     :in    std_logic_vector(1 downto 0);
        fire_b2    :in    std_logic_vector(2 downto 0);
        l_t2       :in    std_logic;
        x_t2       :in    std_logic_vector(3 downto 0);
        y_t2       :in    std_logic_vector(3 downto 0);
        dir_t2     :in    std_logic_vector(1 downto 0);
        x_vga      :in    std_logic_vector(3 downto 0);
        y_vga      :in    std_logic_vector(3 downto 0);
        feedback_b1:in    std_logic;
        feedback_b2:in    std_logic;
        draw_b1    :out   std_logic;
        draw_b2    :out   std_logic);
end component;

component coll_handler is
port(t1       :in    std_logic;
        t2       :in    std_logic;
        k1       :in    std_logic;
        k2       :in    std_logic;
        m        :in    std_logic;
        v        :in    std_logic;
        red      :out   std_logic;
	green    :out   std_logic;
	blue     :out   std_logic;
        t1_n   	 :out   std_logic;
	t2_n   	 :out   std_logic;
	k1_n   	 :out   std_logic;
	k2_n   	 :out   std_logic);
end component;

component pg_player1 is
port (
		-- Inputs from the tank position generator
		tank_x_in 	: in std_logic_vector(3 downto 0);
		tank_y_in 	: in std_logic_vector(3 downto 0);
		tank_or_in 	: in std_logic_vector(1 downto 0);
		-- Input for the "hit" signal from the collision block
		hit_in		: in std_logic;
		-- Outputs of the registers to be used for other components
		tank_x_out  	: out std_logic_vector(3 downto 0);
		tank_y_out 	: out std_logic_vector(3 downto 0);
		tank_or_out	: out std_logic_vector(1 downto 0);
		hit_out 	: out std_logic;
		-- Current VGA drawing position.
		screen_x_in 	: in std_logic_vector(3 downto 0);
		screen_y_in 	: in std_logic_vector(3 downto 0);
		-- clock for the coordinate register
		update_pos 	: in std_logic_vector( 2 downto 0);
		-- clock for the hit register
		clk		: in std_logic;
		-- Do we draw or do we not?
		draw 		: out std_logic;
		-- system reset
		reset		: in std_logic
	);
end component;

component pg_player2 is
port (
		-- Inputs from the tank position generator
		tank_x_in 	: in std_logic_vector(3 downto 0);
		tank_y_in 	: in std_logic_vector(3 downto 0);
		tank_or_in 	: in std_logic_vector(1 downto 0);
		-- Input for the "hit" signal from the collision block
		hit_in		: in std_logic;
		-- Outputs of the registers to be used for other components
		tank_x_out  	: out std_logic_vector(3 downto 0);
		tank_y_out 	: out std_logic_vector(3 downto 0);
		tank_or_out	: out std_logic_vector(1 downto 0);
		hit_out 	: out std_logic;
		-- Current VGA drawing position.
		screen_x_in 	: in std_logic_vector(3 downto 0);
		screen_y_in 	: in std_logic_vector(3 downto 0);
		-- clock for the coordinate register
		update_pos 	: in std_logic_vector( 2 downto 0);
		-- clock for the hit register
		clk		: in std_logic;
		-- Do we draw or do we not?
		draw 		: out std_logic;
		-- system reset
		reset		: in std_logic
	);
end component;

component input_counter is
port(
	clk   :in	   std_logic;
	reset :in	   std_logic;
	enable:in    std_logic_vector(1 downto 0);
        count :out   std_logic_vector(2 downto 0));
end component;

component tank_pos_top_level is
   port(input_direction_1	:in    std_logic_vector(2 downto 0);
        input_direction_2	:in    std_logic_vector(2 downto 0);
        old_pos_1			  :in    std_logic_vector(10 downto 0);
        new_pos_1			  :out   std_logic_vector(9 downto 0);
        old_pos_2			  :in    std_logic_vector(10 downto 0);
        new_pos_2			  :out   std_logic_vector(9 downto 0);
     -- count_in      			 :in    std_logic_vector(1 downto 0);
		reset		: in std_logic;
		clk 		: in std_logic);
end component;



component vga_out is
port(
		clk, reset:			in  std_logic;
		rgb: 			in  std_logic_vector(2 downto 0);
		r, g, b:			out std_logic;
		frame, bullet:			out std_logic;
		hsync, vsync: 			out std_logic;
		x, y:			out std_logic_vector(3 downto 0);
		collision:			out std_logic);
end component;

component mapcompare is
port(	
	x   :in    std_logic_vector(3 downto 0);
        y   :in    std_logic_vector(3 downto 0);
        wall:out   std_logic);
end component;

signal t1_encoded_in, t2_encoded_in : std_logic_vector(2 downto 0);
signal tf, tb : std_logic;
signal input_counter_enable : std_logic_vector(1 downto 0);
signal input_counter_val : std_logic_vector(2 downto 0);
signal video_x, video_y : std_logic_vector(3 downto 0);
signal collision_enable : std_logic;
signal t1_pos, t1_pos_n, t2_pos, t2_pos_n : std_logic_vector(9 downto 0);
signal t1_rot, t2_rot : std_logic_vector(1 downto 0);
signal t1_act, t2_act, k1_act, k2_act, m_act : std_logic;
signal t1_live, t2_live, k1_live, k2_live : std_logic;
signal r_sig, g_sig, b_sig : std_logic;

signal t1_rip, t2_rip : std_logic;

begin

tank1_input : in_syst_buff port map(
				p_l => p_l_1,
				p_r => p_r_1,
				p_u => p_u_1,
				p_d => p_d_1,
				p_f => not (p_f_1),
				frame => tf,
				clk => clk,
				reset => reset,
				counter => input_counter_val,
				counter_enable => input_counter_enable(0),
				t_e => t1_encoded_in);
tank2_input : in_syst_buff port map(
				p_l => p_l_2,
				p_r => p_r_2,
				p_u => p_u_2,
				p_d => p_d_2,
				p_f => not (p_f_2),
				frame => tf,
				clk => clk,
				reset => reset,
				counter => input_counter_val,
				counter_enable => input_counter_enable(1),
				t_e => t2_encoded_in);
tank_pos_calc : tank_pos_top_level port map(
				input_direction_1 => t1_encoded_in,
				input_direction_2 => t2_encoded_in,
				old_pos_1(9 downto 0) => t1_pos,
				old_pos_2(9 downto 0) => t2_pos,
				clk => clk,
				reset => reset,
				new_pos_1 => t1_pos_n,
				new_pos_2 => t2_pos_n);
pixel_generator_t1 : pg_player1 port map(
				tank_x_in => t1_pos_n(9 downto 6),
				tank_y_in => t1_pos_n(5 downto 2),
				tank_or_in => t1_pos_n(1 downto 0),
				hit_in => not(t1_live),
				tank_x_out => t1_pos(9 downto 6),
				tank_y_out => t1_pos(5 downto 2),
				tank_or_out => t1_pos(1 downto 0),
				hit_out => t1_rip,
				screen_x_in => video_x,
				screen_y_in => video_y,
				update_pos => input_counter_val,
				clk => clk,
				draw => t1_act,
				reset => reset);
pixel_generator_t2 : pg_player2 port map(
				tank_x_in => t2_pos_n(9 downto 6),
				tank_y_in => t2_pos_n(5 downto 2),
				tank_or_in => t2_pos_n(1 downto 0),
				hit_in => not(t2_live),
				tank_x_out => t2_pos(9 downto 6),
				tank_y_out => t2_pos(5 downto 2),
				tank_or_out => t2_pos(1 downto 0),
				hit_out => t2_rip,
				screen_x_in => video_x,
				screen_y_in => video_y,
				update_pos => input_counter_val,
				clk => clk,
				draw => t2_act,
				reset => reset);
mapcompare_1 : mapcompare port map(
				x => video_x,
				y => video_y,
				wall => m_act);
collision_handler : coll_handler port map(
				t1 => t1_act,
				t2 => t2_act,
				k1 => k1_act,
				k2 => k2_act,
				m => m_act,
				v => collision_enable,
				red => r_sig,
				green => g_sig,
				blue => b_sig,
				t1_n => t1_live,
				t2_n => t2_live,
				k1_n => k1_live,
				k2_n => k2_live);
bullet_generator : bullet_mod port map(
				clk => clk,
				b_clk => tb,
				reset => reset,
				fire_b1 => t1_encoded_in,
				l_t1 => not (t1_rip),
				x_t1 => t1_pos(9 downto 6),
				y_t1 => t1_pos(5 downto 2),
				dir_t1 => t1_pos(1 downto 0),
				fire_b2 => t2_encoded_in,
				l_t2 => not (t2_rip),
				x_t2 => t2_pos(9 downto 6),
				y_t2 => t2_pos(5 downto 2),
				dir_t2 => t2_pos(1 downto 0),
				x_vga => video_x,
				y_vga => video_y,
				feedback_b1 => k1_live,
				feedback_b2 => k2_live,
				draw_b1 => k1_act,
				draw_b2 => k2_act);
video_generator : vga_out port map(
				clk => clk,
				reset => reset,
				rgb(2) => r_sig,
				rgb(1) => g_sig,
				rgb(0) => b_sig,
				r => r_out,
				g => g_out,
				b => b_out,
				frame => tf,
				bullet => tb,
				hsync => hsync_out,
				vsync => vsync_out,
				x => video_x,
				y => video_y,
				collision => collision_enable);
input_counter_1 : input_counter port map(
				clk => clk,
				reset => reset,
				enable => input_counter_enable,
				count => input_counter_val);

				
end behaviour;



















