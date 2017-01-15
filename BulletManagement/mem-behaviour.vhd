library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of mem is
signal pre_q : std_logic_vector(2 downto 0);
signal r_bclk: std_logic;

begin
process (clk) is
begin
	if(rising_edge(clk)) then
		if(reset = '1' or r_bclk='1') then
			pre_q<="000";
		elsif(pre_q/="101") then
			pre_q(0)<=d;
			pre_q(1)<=not(d);
			pre_q(2)<=d;
		end if;
	end if;

	q<=pre_q;
end process;

process (bclk, clk) is
begin
	r_bclk <= bclk;
end process;
end behaviour;



