library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of register1bit is

begin

process(clk)
begin
if (clk='1' and clk'event) then
	q <= d;
end if;
end process;

end behaviour;

















