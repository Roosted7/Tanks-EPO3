library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------
---------------------   hit register module   ---------------------
-------------------------------------------------------------------

-- module part of subsystem made for epo-3 project at tu delft
-- project 	: tank game 
-- date		: 25/11/2016
-- subsystem	: pixel generator (aart-peter, niels)

-- module includes one bit register indicating whether or not a tank 
--  has been hit by a bullet.

entity pg_hrg is
port(
		hit_in : in std_logic;
		hit_out : out std_logic;
		clk : in std_logic;
		reset : in std_logic
	);
end pg_hrg;


