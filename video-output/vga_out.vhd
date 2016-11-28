library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_out is
	port(
		clk, reset:		in  std_logic,
		rgb: 			in  std_logic_vector(2 downto 0),
		x, y: 			out std_logic_vector(3 downto 0),
		vsync, hsync: 	out std_logic,
		r, g, b:		out std_logic,
		frame, vbullet:	out std_logic);
end vga_out;

architecture arch of vga_out is
component clk_div
	port(
		clk, reset:					in  std_logic;
		blck, row, frame, vbullet: 	out std_logic);
end component;

signal blck, row: std_logic;

begin
r <= rgb(2);
g <= rgb(1);
b <= rgb(0);

process(frame, reset)
begin
	

l4: clk_div port map (clk, reset, blck, row, frame, vbullet);

end arch;