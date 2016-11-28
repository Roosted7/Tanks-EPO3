library IEEE;
use IEEE.std_logic_1164.ALL;

-------------------------------------------------------------------
--------------------   pixel compare module   ---------------------
-------------------------------------------------------------------

-- module part of subsystem made for epo-3 project at tu delft
-- project 	: tank game 
-- date		: 25/11/2016
-- subsystem	: pixel generator (aart-peter, niels)
-- author	: aart-peter schipper

-- module computes whether or not to sets of 4 bit x,y coordinates
--  coincide. 

entity pix_comp is
	port (	x_tank 		: in std_logic_vector (3 downto 0);
		y_tank		: in std_logic_vector (3 downto 0);
		x_video		: in std_logic_vector (3 downto 0);
		y_video		: in std_logic_vector (3 downto 0);
		intersect	: out std_logic
		);
end pix_comp;





