library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------
---------------   pixel compare module testbench   ----------------
-------------------------------------------------------------------

-- testbench for module for  a subsystem made for epo-3 project at 
--  tu delft
-- project 	: tank game 
-- date		: 25/11/2016
-- subsystem	: pixel generator (aart-peter, niels)
-- author	: aart-peter schipper

-- module computes whether or not to sets of 4 bit x,y coordinates
--  coincide.

-------------------------------------------------------------------

entity tb_pix_comp is
end entity;

-------------------------------------------------------------------

architecture beh_tb_pix_c of tb_pix_comp is
	
	component pix_comp is
		port ( 	x_tank 		: in std_logic_vector (3 downto 0);
		       	y_tank		: in std_logic_vector (3 downto 0);
			x_video		: in std_logic_vector (3 downto 0);
			y_video		: in std_logic_vector (3 downto 0);
			intersect	: out std_logic
			);
	end component;

	signal x_tank, y_tank, x_video, y_video : std_logic_vector (3 downto 0);
	signal intersect : std_logic;

begin

l0:	pix_comp port map (x_tank, y_tank, x_video, y_video, intersect);

	y_video <= "0000" after 0 ns, 
		std_logic_vector(unsigned(y_video) +1) after 4096 ns 
		when y_video /= "1111" else "0000" after 4096 ns;
	x_video <= "0000" after 0 ns, 
		std_logic_vector(unsigned(x_video) +1) after 256 ns 
		when x_video /= "1111" else "0000" after 256 ns;
	y_tank 	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(y_tank) +1) after 16 ns 
		when y_tank /= "1111" else "0000" after 16 ns;
	x_tank 	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(x_tank) +1) after 1 ns 
		when x_tank /= "1111" else "0000" after 1 ns;
end architecture;

