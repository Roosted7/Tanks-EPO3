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
	process(x, y) -- tudelft
	begin
		if((x = "0001" and y = "1110") or
		(x = "0010" and y = "1101") or
		(x = "0010" and y = "1110") or
		(x = "0011" and y = "1010") or
		(x = "0011" and y = "1011") or
		(x = "0011" and y = "1100") or
		(x = "0011" and y = "1101") or
		(x = "0100" and y = "0111") or
		(x = "0100" and y = "1000") or
		(x = "0100" and y = "1001") or
		(x = "0100" and y = "1010") or
		(x = "0100" and y = "1011") or
		(x = "0100" and y = "1100") or
		(x = "0101" and y = "0101") or
		(x = "0101" and y = "0110") or
		(x = "0101" and y = "0111") or
		(x = "0101" and y = "1000") or
		(x = "0101" and y = "1001") or
		(x = "0101" and y = "1010") or
		(x = "0110" and y = "0011") or
		(x = "0110" and y = "0100") or
		(x = "0110" and y = "0101") or
		(x = "0110" and y = "0110") or
		(x = "0110" and y = "0111") or
		(x = "0110" and y = "1000") or
		(x = "0110" and y = "1001") or
		(x = "0111" and y = "0010") or
		(x = "0111" and y = "0011") or
		(x = "0111" and y = "0100") or
		(x = "0111" and y = "0101") or
		(x = "0111" and y = "0111") or
		(x = "0111" and y = "1000") or
		(x = "0111" and y = "1001") or
		(x = "1000" and y = "0010") or
		(x = "1000" and y = "0011") or
		(x = "1000" and y = "0100") or
		(x = "1000" and y = "0110") or
		(x = "1000" and y = "0111") or
		(x = "1000" and y = "1000") or
		(x = "1000" and y = "1001") or
		(x = "1000" and y = "1100") or
		(x = "1001" and y = "0001") or
		(x = "1001" and y = "0010") or
		(x = "1001" and y = "0011") or
		(x = "1001" and y = "0101") or
		(x = "1001" and y = "0110") or
		(x = "1001" and y = "0111") or
		(x = "1001" and y = "1000") or
		(x = "1001" and y = "1001") or
		(x = "1001" and y = "1010") or
		(x = "1001" and y = "1011") or
		(x = "1001" and y = "1100") or
		(x = "1010" and y = "0001") or
		(x = "1010" and y = "0010") or
		(x = "1010" and y = "0101") or
		(x = "1010" and y = "0110") or
		(x = "1010" and y = "0111") or
		(x = "1010" and y = "1001") or
		(x = "1010" and y = "1010") or
		(x = "1010" and y = "1011") or
		(x = "1011" and y = "0001") or
		(x = "1011" and y = "0110") or
		(x = "1011" and y = "1000") or
		(x = "1011" and y = "1001") or
		(x = "1011" and y = "1010") or
		(x = "1011" and y = "1011") or
		(x = "1100" and y = "0001") or
		(x = "1100" and y = "1000") or
		(x = "1100" and y = "1001") or
		(x = "1100" and y = "1010") or
		(x = "1101" and y = "0111") or
		(x = "1101" and y = "1000") or
		(x = "1101" and y = "1001") or
		(x = "1110" and y = "0110") or
		(x = "1110" and y = "0111")) then
			rgb <= "011";
		else
			rgb <= "111";
		end if;
	end process;

--	process(x, y) -- tanks
--	begin
--		if(x = "0000" and y = "0000") then
--			rgb <= "100";
--		elsif(x = "0000" and y = "0001") then
--			rgb <= "100";
--		elsif(x = "0001" and y = "0001") then
--			rgb <= "100";
--		elsif(x = "0001" and y = "0010") then
--			rgb <= "100";
--		elsif(x = "0001" and y = "0110") then
--			rgb <= "101";
--		elsif(x = "0010" and y = "0000") then
--			rgb <= "100";
--		elsif(x = "0010" and y = "0001") then
--			rgb <= "100";
--		elsif(x = "0011" and y = "0011") then
--			rgb <= "000";
--		elsif(x = "0011" and y = "0100") then
--			rgb <= "000";
--		elsif(x = "0011" and y = "0101") then
--			rgb <= "000";
--		elsif(x = "0011" and y = "1010") then
--			rgb <= "000";
--		elsif(x = "0011" and y = "1011") then
--			rgb <= "000";
--		elsif(x = "0011" and y = "1100") then
--			rgb <= "000";
--		elsif(x = "0100" and y = "0011") then
--			rgb <= "000";
--		elsif(x = "0100" and y = "1100") then
--			rgb <= "000";
--		elsif(x = "0101" and y = "0011") then
--			rgb <= "000";
--		elsif(x = "0101" and y = "1100") then
--			rgb <= "000";
--		elsif(x = "0111" and y = "0111") then
--			rgb <= "000";
--		elsif(x = "0111" and y = "1000") then
--			rgb <= "000";
--		elsif(x = "1000" and y = "0111") then
--			rgb <= "000";
--		elsif(x = "1000" and y = "1000") then
--			rgb <= "000";
--		elsif(x = "1010" and y = "0011") then
--			rgb <= "000";
--		elsif(x = "1010" and y = "1100") then
--			rgb <= "000";
--		elsif(x = "1011" and y = "0011") then
--			rgb <= "000";
--		elsif(x = "1011" and y = "1100") then
--			rgb <= "000";
--		elsif(x = "1100" and y = "0011") then
--			rgb <= "000";
--		elsif(x = "1100" and y = "0100") then
--			rgb <= "000";
--		elsif(x = "1100" and y = "0101") then
--			rgb <= "000";
--		elsif(x = "1100" and y = "1010") then
--			rgb <= "000";
--		elsif(x = "1100" and y = "1011") then
--			rgb <= "000";
--		elsif(x = "1100" and y = "1100") then
--			rgb <= "000";
--		elsif(x = "1101" and y = "1110") then
--			rgb <= "001";
--		elsif(x = "1101" and y = "1111") then
--			rgb <= "001";
--		elsif(x = "1110" and y = "1010") then
--			rgb <= "011";
--		elsif(x = "1110" and y = "1101") then
--			rgb <= "001";
--		elsif(x = "1110" and y = "1110") then
--			rgb <= "001";
--		elsif(x = "1111" and y = "1110") then
--			rgb <= "001";
--		elsif(x = "1111" and y = "1111") then
--			rgb <= "001";
--		else
--			rgb <= "111";
--		end if;
--	end process;
end arch;