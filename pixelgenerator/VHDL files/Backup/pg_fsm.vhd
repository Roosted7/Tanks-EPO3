library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------
----------------------   input fsm module   -----------------------
-------------------------------------------------------------------

-- module part of subsystem made for epo-3 project at tu delft
-- project 	: tank game 
-- date		: 25/11/2016
-- subsystem	: pixel generator (aart-peter, niels)

-- module regulates input for the register depending on the frame 
--  signal.

entity pg_fsm is
   port(		clk  		: in    std_logic;
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
end pg_fsm;

