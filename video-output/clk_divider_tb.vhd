library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_div_tb is
end clk_div_tb;

architecture arch of clk_div_tb is
	component clk_div is
    	port (
    		clk, reset:	in  std_logic;
		pixel, blck: 	out std_logic);
   	end component clk_div;

signal clk, reset, pixel, blck: std_logic;

begin
	clk   <= '0' after   0 ns,
                 '1' after   5 ns when clk /= '1' else '0' after 5 ns;

	l1: clk_div port map(clk, reset, pixel, blck);
end architecture;