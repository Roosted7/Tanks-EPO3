library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tf_rise_tb is
component tf_rise is
	port(tf_in  :in    std_logic;
	reset  :in	   std_logic;
	clk    :in    std_logic;
        tf_rise:out   std_logic);
end component;

signal frame, reset, clk, tf_out : std_logic;
begin
lbl1 : tf_rise port map (tf_in => frame, reset => reset, clk => clk, tf_rise => tf_out);

clk <= '1' after 0 ns, '0' after 60 ns when clk /= '0' else '1' after 60 ns;
reset <= '1' after 0 ns, '0' after 100 ns;
frame <= '1' after 0 ns, '0' after 601 ns when frame /= '0' else '1' after 601 ns; 
end behaviour;











