library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tf_rise is

signal tf, new_tf, s_1 : std_logic;
begin

new_tf <= tf_in;
s_1 <= not new_tf;
tf_rise <= tf nor s_1;


process(clk, reset)
begin
if (reset = '0') then
	if(rising_edge(clk)) then
		tf <= new_tf;
	end if;
else
	tf <= '0';
end if;
end process;

end behaviour;























