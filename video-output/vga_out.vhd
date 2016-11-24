library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_out is
	port(
		frame: 			in  std_logic,
		color: 			in  std_logic_vector(2 downto 0),
		x, y: 			out std_logic_vector(3 downto 0),
		vsync, hsync: 	out std_logic);
end vga_out;

architecture arch of vga_out is

begin
	



end arch;