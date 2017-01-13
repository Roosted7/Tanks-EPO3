library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of mem is
begin
process (clk, bclk) is
begin
	if(rising_edge(bclk)) then
		q<="000";
	elsif(rising_edge(clk)) then
		if(reset = '1') then
			q<="000";
		elsif(q/="101") then
			q(0)<=d;
			q(1)<=not(d);
			q(2)<=d;
		end if;
	end if;
end process;
end behaviour;





