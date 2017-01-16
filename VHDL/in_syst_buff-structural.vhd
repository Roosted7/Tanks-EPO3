library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of in_syst_buff is

component input_system is
port(
	p_l		:in    std_logic;
	p_r	   	:in    std_logic;
	p_u		:in    std_logic;
	p_d		:in    std_logic;
	p_f		:in    std_logic;
        frame			:in    std_logic;
        clk  			:in    std_logic;
	reset		:in    std_logic;
	counter		:in    std_logic_vector(2 downto 0);
	counter_enable	 :out	  std_logic;
        t_e 			:out   std_logic_vector(2 downto 0));
end component;

component input_buffer is
port(input :in    std_logic_vector(4 downto 0);
        clk   :in    std_logic;
        reset :in    std_logic;
        output:out   std_logic_vector(4 downto 0));
end component;

signal input_1, input_2 : std_logic_vector(4 downto 0);
begin

buffer_1 : input_buffer port map(
				input(0) => p_l,
				input(1) => p_r,
				input(2) => p_u,
				input(3) => p_d,
				input(4) => p_f,
				clk => clk,
				reset => reset,
				output => input_1);
buffer_2 : input_buffer port map(
				input => input_1,
				clk => clk,
				reset => reset,
				output => input_2);
input_system_1 : input_system port map(
				p_l => input_2(0),
				p_r => input_2(1),
				p_u => input_2(2),
				p_d => input_2(3),
				p_f => input_2(4),
				frame => frame,
				clk => clk,
				reset => reset,
				counter => counter,
				counter_enable => counter_enable,
				t_e => t_e);
end structural;


