library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of input_syst_tb is

component input_system is
	port(
		p_l		:in    std_logic;
		p_r	   	:in    std_logic;
		p_u		:in    std_logic;
		p_d		:in    std_logic;
		p_f		:in    std_logic;
        		frame		:in    std_logic;
        		clk  		:in    std_logic;
		reset		:in    std_logic;
		counter		:in    std_logic_vector(2 downto 0);
		counter_enable	 :out	  std_logic;
       		t_e 		:out   std_logic_vector(2 downto 0));
end component;

signal p_l			:    std_logic;
signal p_r	 		:    std_logic;
signal p_u			:    std_logic;
signal p_d			:    std_logic;
signal p_f			:    std_logic;
signal frame			:    std_logic;
signal clk  			:    std_logic;
signal reset			:    std_logic;
signal counter_enable_1	:    std_logic;
signal counter  			:    std_logic_vector(2 downto 0);
signal t1_e			:    std_logic_vector(2 downto 0);

begin
lbl1 : input_system port map (
		p_l => p_l,
		p_r => p_r,
		p_u => p_u,
		p_d => p_d,
		p_f => p_f,
		frame => frame,
		clk   => clk,
		reset => reset,
		counter => counter,
		counter_enable => counter_enable_1,
		t_e  => t1_e);

clk <= '1' after 0 ns, '0' after 60 ns when clk /= '0' else '1' after 60 ns;
frame <= '1' after 0 ns, '0' after 1210 ns when frame /= '0' else '1' after 1210 ns; 
reset <= '1', '0' after 110 ns;

p_r <= '0'; 
p_u <= '0';  
p_f <= '0'; 

p_d <= '0', '1' after 330 ns, '0' after 390 ns, '1' after 1210 ns, '0' after 4850 ns;

p_l <= '0', '1' after 390 ns;

process(counter_enable_1,clk,reset)
begin
	if(reset = '1') then
		counter <= "000";
	else
		if(rising_edge(clk)) then
			if(counter_enable_1 = '1') then
				counter <= std_logic_vector(unsigned(counter)+1);
			else
				counter <= "000";
			end if;
		end if;
	end if;
end process;

end behaviour;


















































