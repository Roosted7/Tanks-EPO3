library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of register1bit is

begin

process(clk)
begin
if (clk='1' and clk'event) then
	if(reset = '1') then
	q <= '1'; --because this will result in selecting oldcoor at the wallcheck at the start
	else
	q <= d;
	end if;
end if;
end process;

end behaviour;




















