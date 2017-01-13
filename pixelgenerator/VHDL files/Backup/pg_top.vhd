-- pixel generator toplevel file!
-- For questions, ask niels or aart-peter

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------
------------------   pixel generator subsystem   ------------------
-------------------------------------------------------------------

-- subsystem for epo-3 project at tu delft
-- project 	: tank game 
-- date		: 8/12/2016

-- subsystem stores position of tank, samples new position based 
--  on fram signal and generates all pixels of the tank based on 
--  the current position. furthermore, the intersection between
--  all pixel coordinates with reference coordinates are 
--  calculated.

entity pg_top is
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
end pg_top;





