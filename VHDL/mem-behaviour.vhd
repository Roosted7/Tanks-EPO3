library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of mem is
signal p : std_logic_vector(2 downto 0);
begin
process (clk, bclk) is
begin
	if(rising_edge(bclk)) then
		p<="000";
	--elsif(rising_edge(clk)) then
		if(reset = '1') then
			p<="000";
		elsif(p/="101") then
			p(0)<=d;
			p(1)<=not(d);
			p(2)<=d;
		end if;
	end if;
	q <= p;
end process;
end behaviour;





