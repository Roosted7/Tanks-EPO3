library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------
---------------------   tank compare module   ---------------------
-------------------------------------------------------------------

-- module part of subsystem made for epo-3 project at tu delft
-- project 	: tank game 
-- date		: 25/11/2016
-- subsystem	: pixel generator (aart-peter, niels)
-- author	: aart-peter schipper

-- module computes whether or not one set of 4 bit x,y coordinates
--  out of 6 tank coordinate sets coincides with the video 
--  coordinate set

-------------------------------------------------------------------

entity tank_comp is
	port (	x_tank0		: in std_logic_vector (3 downto 0);
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
		x_video		: in std_logic_vector (3 downto 0);
		y_video		: in std_logic_vector (3 downto 0);
		intersect	: out std_logic
		);
end entity;

-------------------------------------------------------------------

architecture str_tank_comp of tank_comp is

	-- component pix_comp computes whether or not to sets of 4 
	--  bit x,y coordinates coincide.
	component pix_comp
		port (  x_tank 		: in std_logic_vector (3 downto 0);
			y_tank		: in std_logic_vector (3 downto 0);
			x_video		: in std_logic_vector (3 downto 0);
			y_video		: in std_logic_vector (3 downto 0);
			intersect	: out std_logic
			);
	end component;

	-- signal intersections(i) indicates whether there is an 
	--  intersection between the ith x,y tank coordinates and 
	--  the video coordinates
	signal intersections : std_logic_vector (5 downto 0);

begin

l0:	pix_comp port map (x_tank0, y_tank0, x_video, y_video, 
	 intersections(0));
l1:	pix_comp port map (x_tank1, y_tank1, x_video, y_video, 
	 intersections(1));
l2:	pix_comp port map (x_tank2, y_tank2, x_video, y_video, 
	 intersections(2));
l3:	pix_comp port map (x_tank3, y_tank3, x_video, y_video, 
	 intersections(3));
l4:	pix_comp port map (x_tank4, y_tank4, x_video, y_video, 
	 intersections(4));
l5:	pix_comp port map (x_tank5, y_tank5, x_video, y_video, 
	 intersections(5));

	-- intersect equals 1 if at least one of the previously
	--  calculated intersection equals 1.
	intersect <= intersections(5) or intersections (4) or
	 intersections(3) or intersections(2) or 
	 intersections(1) or intersections(0);
end architecture;

	
