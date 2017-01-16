library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------
-------------------   tank position register   --------------------
-------------------------------------------------------------------

-- module part of subsystem made for epo-3 project at tu delft
-- project 	: tank game 
-- date		: 8/12/2016
-- subsystem	: pixel generator (aart-peter, niels)

-- module contains 10 bit register with synchronous reset

entity pg_prg1 is
	port(
		tank_x_in : in std_logic_vector(3 downto 0);
		tank_x_out  : out std_logic_vector(3 downto 0);
		tank_y_in : in std_logic_vector(3 downto 0);
		tank_y_out : out std_logic_vector(3 downto 0);
		tank_or_in : in std_logic_vector(1 downto 0);
		tank_or_out: out std_logic_vector(1 downto 0);
		clk : in std_logic;
		reset : in std_logic
	);
end pg_prg1;




