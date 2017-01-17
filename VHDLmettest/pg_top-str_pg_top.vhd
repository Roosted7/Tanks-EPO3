library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture str_pg_top of pg_top is
	-- Memory for the middle pixel of the tank and its orientation.
	-- Uses rising edge of the screen-refresh
	component pg_prg is
		port(
			tank_x_in  : in std_logic_vector(3 downto 0);
			tank_x_out : out std_logic_vector(3 downto 0);
			tank_y_in  : in std_logic_vector(3 downto 0);
			tank_y_out : out std_logic_vector(3 downto 0);
			tank_or_in : in std_logic_vector(1 downto 0);
			tank_or_out: out std_logic_vector(1 downto 0);
			clk : in std_logic;
			reset : in std_logic
		);
	end component;
		
	-- Memory for the hit-status of the tank. Determines if the tank is dead, or alive.
	-- Uses rising edge of the clock
	component pg_hrg is
		port(
			hit_in : in std_logic;
			hit_out : out std_logic;
			clk : in std_logic;
			reset : in std_logic
		);
	end component;

	-- Generates the tank based off of its middle pixel and the orientation.
	component pg_pxg is
		port(
			x_in 	     :in    std_logic_vector(3 downto 0);
			y_in 	     :in    std_logic_vector(3 downto 0);
			theta	     :in    std_logic_vector(1 downto 0);
			x_head       :out   std_logic_vector(3 downto 0);
			y_head       :out   std_logic_vector(3 downto 0);
			x_left_leg   :out   std_logic_vector(3 downto 0);
			y_left_leg   :out   std_logic_vector(3 downto 0);
			x_right_leg  :out   std_logic_vector(3 downto 0);
			y_right_leg  :out   std_logic_vector(3 downto 0);
			x_left_foot  :out   std_logic_vector(3 downto 0);
			y_left_foot  :out   std_logic_vector(3 downto 0);
			x_right_foot :out   std_logic_vector(3 downto 0);
			y_right_foot :out   std_logic_vector(3 downto 0)
		);
	end component;

	-- Compares the current screen pixel (x,y), with the individual components of the tank
	-- which are generated by tank_pix	
	component pg_tkc is
		port(	-- For each individual part of the tanks body:
			x_tank0		: in std_logic_vector (3 downto 0);
			y_tank0		: in std_logic_vector (3 downto 0);
			x_tank1		: in std_logic_vector (3 downto 0);
			y_tank1		: in std_logic_vector (3 downto 0);
			x_tank2		: in std_logic_vector (3 downto 0);
			y_tank2		: in std_logic_vector (3 downto 0);
			x_tank3		: in std_logic_vector (3 downto 0);
			y_tank3		: in std_logic_vector (3 downto 0);
			x_tank4		: in std_logic_vector (3 downto 0);
			y_tank4		: in std_logic_vector (3 downto 0);
			x_tank5		: in std_logic_vector (3 downto 0);
			y_tank5		: in std_logic_vector (3 downto 0);
			-- Video signals
			x_video		: in std_logic_vector (3 downto 0);
			y_video		: in std_logic_vector (3 downto 0);
			-- " 
			intersect	: out std_logic
		);
	end component;

	component pg_fsm is
   	port(	clk  		: in    std_logic;
        		reset		: in    std_logic;
        		update_pos		: in    std_logic_vector(2 downto 0);
		tank_x_reg 		: in 	std_logic_vector(3 downto 0);
		tank_x_in 		: in 	std_logic_vector(3 downto 0);
		tank_y_reg 		: in 	std_logic_vector(3 downto 0);
		tank_y_in 		: in 	std_logic_vector(3 downto 0);
		tank_or_reg 		: in 	std_logic_vector(1 downto 0);
		tank_or_in 		: in 	std_logic_vector(1 downto 0);
		tank_y_out 		: out 	std_logic_vector(3 downto 0);
		tank_x_out  		: out 	std_logic_vector(3 downto 0);
		tank_or_out		: out 	std_logic_vector(1 downto 0)
		);
	end component pg_fsm;

	-- Intermediate signals:
	-- Direct inputs (d) and outputs (q) of the memory
	signal 	tank_x_q, tank_y_q : std_logic_vector(3 downto 0);
	signal  tank_x_d, tank_y_d : std_logic_vector(3 downto 0);
	signal 	tank_or_q : std_logic_vector(1 downto 0);
	signal  tank_or_d : std_logic_vector(1 downto 0);
	-- Direct outputs of the pixel generator
	signal  x_head, y_head,
   		x_left_leg, y_left_leg,
   		x_right_leg, y_right_leg,
   		x_left_foot, y_left_foot,
   		x_right_foot, y_right_foot : std_logic_vector(3 downto 0);
	-- Intermediate draw signal. Is "Anded" with the hit register to determine if drawing is appropriate.
	signal 	draw_out : std_logic;
	-- Signals for hits
	signal 	hit_out_q : std_logic;
	signal  hit_intermediate : std_logic;

begin
-- when an hit_in is detected, the hit register stores a 1 irrespective of the hit_in.
hit_intermediate <= hit_out_q or hit_in;

c00: pg_prg port map (				-- Inputs from input handler
							tank_x_in => tank_x_d, tank_y_in => tank_y_d,	tank_or_in => tank_or_d, 
							-- Register values, connected to intermediate signals.	
							tank_x_out => tank_x_q, tank_y_out => tank_y_q, tank_or_out => tank_or_q,
							-- "clock" at which the registers will update
							clk => clk,
							-- System reset
							reset => reset
						   );
c01: pg_hrg port map (				-- Simple input and output
							hit_in => hit_intermediate, hit_out => hit_out_q,
							-- Actually connected to the system clock. Updates continiously. 
							clk => clk,
							-- System reset
							reset => reset
						   );
c02: pg_pxg port map (				-- Connected to the internal registers
							-- Theta represents the current orientation
							x_in => tank_x_q, y_in => tank_y_q, theta => tank_or_q,
							-- Connect the body parts!
							x_head => x_head, y_head => y_head, 
							x_left_leg => x_left_leg, y_left_leg => y_left_leg, 
							x_right_leg => x_right_leg, y_right_leg => y_right_leg, 
							x_left_foot => x_left_foot, y_left_foot => y_left_foot, 
							x_right_foot => x_right_foot, y_right_foot => y_right_foot 
						   );
c03: pg_tkc port map (				-- Signals from the VGA module. Represents current drawing pixel
							x_video => screen_x_in, y_video => screen_y_in,
							-- Connect body parts to body parts :)
							x_tank0 => x_head, y_tank0 => y_head, 
							x_tank1 => tank_x_d, y_tank1 => tank_y_d, 
							x_tank2 => x_left_leg, y_tank2 => y_left_leg, 
							x_tank3 => x_right_leg, y_tank3 => y_right_leg, 
							x_tank4 => x_left_foot, y_tank4 => y_left_foot, 
							x_tank5 => x_right_foot, y_tank5 => y_right_foot,
							-- Logical output of this component:
							-- 1: Draw a tank here.
							-- 0: Don't
							intersect => draw_out
						   );

c04: pg_fsm port map (
							clk => clk,
							reset => reset,
							update_pos => update_pos,
							tank_x_reg => tank_x_q,
							tank_y_reg => tank_y_q,
							tank_or_reg => tank_or_q,
							tank_x_out => tank_x_d,
							tank_y_out => tank_y_d,
							tank_or_out => tank_or_d,
							tank_x_in => tank_x_in,
							tank_y_in => tank_y_in,
							tank_or_in => tank_or_in
						    );
							
							
								
							

-- Connect the registers to the outside world!
s00: tank_x_out <= tank_x_q;
s01: tank_y_out<= tank_y_q;
s02: tank_or_out<= tank_or_q;
s04: hit_out <= hit_out_q;
-- Only draw if the tank is actually alive :P
s03: draw <= draw_out and not hit_out_q;
end str_pg_top;



































