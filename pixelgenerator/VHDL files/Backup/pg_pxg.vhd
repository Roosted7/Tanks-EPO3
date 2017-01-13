library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------
-----------------   tank pixel generator module   -----------------
-------------------------------------------------------------------

-- module part of subsystem made for epo-3 project at tu delft
-- project 	: tank game 
-- date		: 25/11/2016
-- subsystem	: pixel generator (aart-peter, niels)

-- this component computes the individual "parts" of a tank
-- this means that it turns the x,y coordinate into the actual
--  tank coordinates. 
-- this is done by adding or substracting 1 from the x and/or
--  the y coordinate.
 
entity pg_pxg is
   port(
	-- Input from the registers
	x_in 	 	:in    std_logic_vector(3 downto 0); 
        y_in 		:in    std_logic_vector(3 downto 0);
        theta	     	:in    std_logic_vector(1 downto 0);
	-- Output in individual parts
        x_head  	:out   std_logic_vector(3 downto 0);
        y_head       	:out   std_logic_vector(3 downto 0);
        x_left_leg   	:out   std_logic_vector(3 downto 0);
        y_left_leg   	:out   std_logic_vector(3 downto 0);
        x_right_leg  	:out   std_logic_vector(3 downto 0);
        y_right_leg  	:out   std_logic_vector(3 downto 0);
        x_left_foot  	:out   std_logic_vector(3 downto 0);
        y_left_foot  	:out   std_logic_vector(3 downto 0);
        x_right_foot 	:out   std_logic_vector(3 downto 0);
        y_right_foot 	:out   std_logic_vector(3 downto 0));
end pg_pxg;



