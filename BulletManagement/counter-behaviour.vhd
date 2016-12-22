library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;

architecture behaviour of counter is
	signal icount, new_count : std_logic_vector(6 downto 0);
begin

process(icount, countreset)
begin
	if (countreset = '1' or icount = "1111111") then
		new_count <= "0000000";
	else
		new_count <= icount + 1;
	end if;
end process;

process(f30khz)
begin
	if (reset = '1') then
		icount <= "0000000";
	elsif (rising_edge(f30khz)) then
		icount <= new_count;
	end if;
end process;

count <= icount;

end behaviour;




