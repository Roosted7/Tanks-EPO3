library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


architecture behaviour of counter2bit is
signal cin : std_logic_vector(1 downto 0);
begin
process (clk, cin)
begin
if (clk'event and clk='1') then
	if (reset = '1') then
		cin <= "00";
	else
		if (cin = "11") then
			cin <= "00";
		else
			cin <= cin + 1;
		end if;
	end if;
end if;

	count <= cin;
	end process;
end behaviour;


