library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_div_tb is
end clk_div_tb;

architecture arch of clk_div_tb is
	component clk_div is
    	port (
    		clk, reset:	in  std_logic;
			pixel, blck, row, frame, vbullet: 	out std_logic);
   	end component clk_div;

signal clk, reset, pixel, blck, row, frame, vbullet: std_logic;

begin
	reset <= 	'1' after 0 ns,
				'0' after 100 ns;
	clk   <= 	'0' after   0 ps,
                '1' after   82 ns when clk /= '1' else '0' after 82 ns;

	l1: clk_div port map(clk, reset, pixel, blck, row, frame, vbullet);
end architecture;
