library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_test is
	port(
		frame:	in  std_logic;
		x, y:	in  std_logic_vector(3 downto 0);
		rgb:	out std_logic_vector(2 downto 0));
end vga_test;

architecture arch of vga_test is
signal cnt_frame: std_logic_vector(6 downto 0);

begin
	process(frame)
	begin
		if(rising_edge(frame)) then
			if(to_integer(unsigned(cnt_frame)) = 127) then
				cnt_frame <= (others => '0');
			else
				cnt_frame <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_frame)) + 1, 7));
			end if;
		end if;
	end process;

--	process(x, y) -- tudelft
--	begin
--		if((y = "0001" and x = "1110") or
--		(y = "0010" and x = "1101") or
--		(y = "0010" and x = "1110") or
--		(y = "0011" and x = "1010") or
--		(y = "0011" and x = "1011") or
--		(y = "0011" and x = "1100") or
--		(y = "0011" and x = "1101") or
--		(y = "0100" and x = "0111") or
--		(y = "0100" and x = "1000") or
--		(y = "0100" and x = "1001") or
--		(y = "0100" and x = "1010") or
--		(y = "0100" and x = "1011") or
--		(y = "0100" and x = "1100") or
--		(y = "0101" and x = "0101") or
--		(y = "0101" and x = "0110") or
--		(y = "0101" and x = "0111") or
--		(y = "0101" and x = "1000") or
--		(y = "0101" and x = "1001") or
--		(y = "0101" and x = "1010") or
--		(y = "0110" and x = "0011") or
--		(y = "0110" and x = "0100") or
--		(y = "0110" and x = "0101") or
--		(y = "0110" and x = "0110") or
--		(y = "0110" and x = "0111") or
--		(y = "0110" and x = "1000") or
--		(y = "0110" and x = "1001") or
--		(y = "0111" and x = "0010") or
--		(y = "0111" and x = "0011") or
--		(y = "0111" and x = "0100") or
--		(y = "0111" and x = "0101") or
--		(y = "0111" and x = "0111") or
--		(y = "0111" and x = "1000") or
--		(y = "0111" and x = "1001") or
--		(y = "1000" and x = "0010") or
--		(y = "1000" and x = "0011") or
--		(y = "1000" and x = "0100") or
--		(y = "1000" and x = "0110") or
--		(y = "1000" and x = "0111") or
--		(y = "1000" and x = "1000") or
--		(y = "1000" and x = "1001") or
--		(y = "1000" and x = "1100") or
--		(y = "1001" and x = "0001") or
--		(y = "1001" and x = "0010") or
--		(y = "1001" and x = "0011") or
--		(y = "1001" and x = "0101") or
--		(y = "1001" and x = "0110") or
--		(y = "1001" and x = "0111") or
--		(y = "1001" and x = "1000") or
--		(y = "1001" and x = "1001") or
--		(y = "1001" and x = "1010") or
--		(y = "1001" and x = "1011") or
--		(y = "1001" and x = "1100") or
--		(y = "1010" and x = "0001") or
--		(y = "1010" and x = "0010") or
--		(y = "1010" and x = "0101") or
--		(y = "1010" and x = "0110") or
--		(y = "1010" and x = "0111") or
--		(y = "1010" and x = "1001") or
--		(y = "1010" and x = "1010") or
--		(y = "1010" and x = "1011") or
--		(y = "1011" and x = "0001") or
--		(y = "1011" and x = "0110") or
--		(y = "1011" and x = "1000") or
--		(y = "1011" and x = "1001") or
--		(y = "1011" and x = "1010") or
--		(y = "1011" and x = "1011") or
--		(y = "1100" and x = "0001") or
--		(y = "1100" and x = "1000") or
--		(y = "1100" and x = "1001") or
--		(y = "1100" and x = "1010") or
--		(y = "1101" and x = "0111") or
--		(y = "1101" and x = "1000") or
--		(y = "1101" and x = "1001") or
--		(y = "1110" and x = "0110") or
--		(y = "1110" and x = "0111")) then
--			rgb <= "011";
--		else
--			rgb <= "111";
--		end if;
--	end process;


	process(cnt_frame, x, y) -- tanks
	begin
		if(to_integer(unsigned(cnt_frame)) < 64) then
			if(y = "0000" and x = "0000") then
			rgb <= "100";
		elsif(y = "0000" and x = "0001") then
			rgb <= "100";
		elsif(y = "0001" and x = "0001") then
			rgb <= "100";
		elsif(y = "0001" and x = "0010") then
			rgb <= "100";
		elsif(y = "0001" and x = "0110") then
			rgb <= "101";
		elsif(y = "0010" and x = "0000") then
			rgb <= "100";
		elsif(y = "0010" and x = "0001") then
			rgb <= "100";
		elsif(y = "0011" and x = "0011") then
			rgb <= "000";
		elsif(y = "0011" and x = "0100") then
			rgb <= "000";
		elsif(y = "0011" and x = "0101") then
			rgb <= "000";
		elsif(y = "0011" and x = "1010") then
			rgb <= "000";
		elsif(y = "0011" and x = "1011") then
			rgb <= "000";
		elsif(y = "0011" and x = "1100") then
			rgb <= "000";
		elsif(y = "0100" and x = "0011") then
			rgb <= "000";
		elsif(y = "0100" and x = "1100") then
			rgb <= "000";
		elsif(y = "0101" and x = "0011") then
			rgb <= "000";
		elsif(y = "0101" and x = "1100") then
			rgb <= "000";
		elsif(y = "0111" and x = "0111") then
			rgb <= "000";
		elsif(y = "0111" and x = "1000") then
			rgb <= "000";
		elsif(y = "1000" and x = "0111") then
			rgb <= "000";
		elsif(y = "1000" and x = "1000") then
			rgb <= "000";
		elsif(y = "1010" and x = "0011") then
			rgb <= "000";
		elsif(y = "1010" and x = "1100") then
			rgb <= "000";
		elsif(y = "1011" and x = "0011") then
			rgb <= "000";
		elsif(y = "1011" and x = "1100") then
			rgb <= "000";
		elsif(y = "1100" and x = "0011") then
			rgb <= "000";
		elsif(y = "1100" and x = "0100") then
			rgb <= "000";
		elsif(y = "1100" and x = "0101") then
			rgb <= "000";
		elsif(y = "1100" and x = "1010") then
			rgb <= "000";
		elsif(y = "1100" and x = "1011") then
			rgb <= "000";
		elsif(y = "1100" and x = "1100") then
			rgb <= "000";
		elsif(y = "1101" and x = "1110") then
			rgb <= "001";
		elsif(y = "1101" and x = "1111") then
			rgb <= "001";
		elsif(y = "1110" and x = "1010") then
			rgb <= "011";
		elsif(y = "1110" and x = "1101") then
			rgb <= "001";
		elsif(y = "1110" and x = "1110") then
			rgb <= "001";
		elsif(y = "1111" and x = "1110") then
			rgb <= "001";
		elsif(y = "1111" and x = "1111") then
			rgb <= "001";
		else
			rgb <= "111";
		end if;
	else
		if((y = "0001" and x = "1110") or
			(y = "0010" and x = "1101") or
			(y = "0010" and x = "1110") or
			(y = "0011" and x = "1010") or
			(y = "0011" and x = "1011") or
			(y = "0011" and x = "1100") or
			(y = "0011" and x = "1101") or
			(y = "0100" and x = "0111") or
			(y = "0100" and x = "1000") or
			(y = "0100" and x = "1001") or
			(y = "0100" and x = "1010") or
			(y = "0100" and x = "1011") or
			(y = "0100" and x = "1100") or
			(y = "0101" and x = "0101") or
			(y = "0101" and x = "0110") or
			(y = "0101" and x = "0111") or
			(y = "0101" and x = "1000") or
			(y = "0101" and x = "1001") or
			(y = "0101" and x = "1010") or
			(y = "0110" and x = "0011") or
			(y = "0110" and x = "0100") or
			(y = "0110" and x = "0101") or
			(y = "0110" and x = "0110") or
			(y = "0110" and x = "0111") or
			(y = "0110" and x = "1000") or
			(y = "0110" and x = "1001") or
			(y = "0111" and x = "0010") or
			(y = "0111" and x = "0011") or
			(y = "0111" and x = "0100") or
			(y = "0111" and x = "0101") or
			(y = "0111" and x = "0111") or
			(y = "0111" and x = "1000") or
			(y = "0111" and x = "1001") or
			(y = "1000" and x = "0010") or
			(y = "1000" and x = "0011") or
			(y = "1000" and x = "0100") or
			(y = "1000" and x = "0110") or
			(y = "1000" and x = "0111") or
			(y = "1000" and x = "1000") or
			(y = "1000" and x = "1001") or
			(y = "1000" and x = "1100") or
			(y = "1001" and x = "0001") or
			(y = "1001" and x = "0010") or
			(y = "1001" and x = "0011") or
			(y = "1001" and x = "0101") or
			(y = "1001" and x = "0110") or
			(y = "1001" and x = "0111") or
			(y = "1001" and x = "1000") or
			(y = "1001" and x = "1001") or
			(y = "1001" and x = "1010") or
			(y = "1001" and x = "1011") or
			(y = "1001" and x = "1100") or
			(y = "1010" and x = "0001") or
			(y = "1010" and x = "0010") or
			(y = "1010" and x = "0101") or
			(y = "1010" and x = "0110") or
			(y = "1010" and x = "0111") or
			(y = "1010" and x = "1001") or
			(y = "1010" and x = "1010") or
			(y = "1010" and x = "1011") or
			(y = "1011" and x = "0001") or
			(y = "1011" and x = "0110") or
			(y = "1011" and x = "1000") or
			(y = "1011" and x = "1001") or
			(y = "1011" and x = "1010") or
			(y = "1011" and x = "1011") or
			(y = "1100" and x = "0001") or
			(y = "1100" and x = "1000") or
			(y = "1100" and x = "1001") or
			(y = "1100" and x = "1010") or
			(y = "1101" and x = "0111") or
			(y = "1101" and x = "1000") or
			(y = "1101" and x = "1001") or
			(y = "1110" and x = "0110") or
			(y = "1110" and x = "0111")) then
				rgb <= "011";
			else
				rgb <= "111";
			end if;
		end if;
	end process;
end arch;