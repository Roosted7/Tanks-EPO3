library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of mem is
signal pre_q : std_logic;
signal r_bclk: std_logic;

begin
process (clk) is
begin
	if(rising_edge(clk)) then
		if(reset='1' or r_bclk='1') then
			pre_q<='0';
		elsif(d='1') then
			pre_q<='1';
		end if;
	end if;

	q<=pre_q;
end process;

process (bclk, clk) is
begin
	r_bclk <= bclk;
end process;
end behaviour;














