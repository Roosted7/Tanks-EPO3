library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of input_fsm_tb is

component input_fsm is
	port(tf_rise:in    std_logic;
        		clk    :in    std_logic;
        		reset  :in    std_logic;
        		dec_in :in    std_logic_vector(2 downto 0);
		counter:in	   std_logic_vector(2 downto 0);
        		enable :out   std_logic_vector(1 downto 0);
		counter_enable: out std_logic);
end component;

signal tf_rise, clk, reset, counter_enable : std_logic;
signal dec_in, counter : std_logic_vector(2 downto 0);
signal enable : std_logic_vector(1 downto 0);
begin
lbl1: input_fsm port map(tf_rise => tf_rise, 
			clk => clk,
			reset => reset,
			dec_in => dec_in,
			counter => counter,
			enable => enable,
			counter_enable => counter_enable);
clk <= '1' after 0 ns, '0' after 60 ns when clk /= '0' else '1' after 60 ns;
reset <= '1', '0' after 110 ns;
tf_rise <= '0' after 0 ns, '1' after 1210 ns, '0' after 2410 ns, '1' after 3610 ns; 
dec_in <= "111" after 0 ns, 
		"100" after 250 ns, 
		"110" after 500 ns, 
		"100" after 650 ns,
		"110" after 1150 ns,
		"100" after 3490 ns,
		"110" after 3620 ns;

process(counter_enable,clk,reset)
begin
	if(reset = '1') then
		counter <= "000";
	else
		if(rising_edge(clk)) then
			if(counter_enable = '1') then
				counter <= std_logic_vector(unsigned(counter)+1);
			else
				counter <= "000";
			end if;
		end if;
	end if;
end process;
end behaviour;























