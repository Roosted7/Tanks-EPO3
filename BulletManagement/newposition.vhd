-- newposition, part of module bulletmanagement

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity newposition is
	port (	x		: in	std_logic_vector(3 downto 0);
		y		: in	std_logic_vector(3 downto 0);
		dir		: in	std_logic_vector(1 downto 0);
		x_out		: out	std_logic_vector(3 downto 0);
		y_out		: out	std_logic_vector(3 downto 0)
	);
end entity newposition;

architecture structural of newposition is
begin	
	process (x,y,dir)
	begin
		case dir is
			when "00" =>
				x_out <= x - 1;
				y_out <= y;
			when "01" =>
				x_out <= x;
				y_out <= y - 1;
			when "10" =>
				x_out <= x + 1;
				y_out <= y;
			when "11" =>
				x_out <= x;
				y_out <= y + 1;
			when others =>
				x_out <= x;
				y_out <= y;
		end case;
	end process;

end architecture structural;