library IEEE;
use IEEE.std_logic_1164.ALL;

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





