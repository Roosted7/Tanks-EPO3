library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


architecture behaviour of counter3bit is
	signal cin : std_logic_vector(2 downto 0) := "000";
begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			if (cin = "111") then
				cin <= "000";
			else
				cin <= cin + 1;
			end if;
		end if;
 
		count <= cin;
	end process;
end behaviour;

