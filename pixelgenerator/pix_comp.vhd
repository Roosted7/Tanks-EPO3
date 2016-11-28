library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
end entity;

architecture beh_pix_comp of pix_comp is
	-- signal int_x(i) indicates whether the ith tank x 
	--  coordinate bit and ith video x coordinate coincide
	signal int_x, int_y	: std_logic_vector (3 downto 0);

begin
	int_x(3) <= x_tank(3) xnor x_video(3);
	int_x(2) <= x_tank(2) xnor x_video(2);
	int_x(1) <= x_tank(1) xnor x_video(1);
	int_x(0) <= x_tank(0) xnor x_video(0);
	
	int_y(3) <= y_tank(3) xnor y_video(3);
	int_y(2) <= y_tank(2) xnor y_video(2);
	int_y(1) <= y_tank(1) xnor y_video(1);
	int_y(0) <= y_tank(0) xnor y_video(0);

	-- output equals 1 when all intersections are 1
	intersect <= (int_x(3) and int_x(2) and int_x(1) and int_x(0)) 
		and (int_y(3) and int_y(2) and int_y(1) and int_y(0));
end architecture;
				



