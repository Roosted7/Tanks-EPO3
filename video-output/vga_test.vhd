library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_test is
	port(
		x, y:	in  std_logic_vector(3 downto 0);
		rgb:	out std_logic_vector(2 downto 0));
end vga_test;

architecture arch of vga_test is
begin
--	process(x, y)
--	begin
--		if(y = "0111" or y = "1000") then
--			rgb <= "111";
--		elsif(x = "0010") then
--			rgb <= "100";
--		elsif(x = "0011") then
--			rgb <= "010";
--		elsif(x = "0100") then
--			rgb <= "001";
--		elsif(x = "1010") then
--			rgb <= "110";
--		elsif(x = "1011") then
--			rgb <= "011";
--		elsif(x = "1100") then
--			rgb <= "101";
--		else
--			rgb <= "000";
--		end if;
--	end process;

	process(x, y)
	begin
		if(x = "0010" or x = "1101" or y = "0010" or y = "1101") then
			rgb <= "101";
		elsif((x = "0111" or x = "1000") and (y = "0111" or y = "1000")) then
			rgb <= "100";
		else
			rgb <= "001";
		end if;
	end process;
end arch;
--vo