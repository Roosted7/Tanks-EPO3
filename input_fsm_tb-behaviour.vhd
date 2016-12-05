library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_fsm_tb is

component input_fsm is
	port(tf_rise:in    std_logic;
        clk    :in    std_logic;
        reset  :in    std_logic;
        dec_in :in    std_logic_vector(2 downto 0);
        enable :out   std_logic_vector(1 downto 0));
end component;

signal tf_rise, clk, reset : std_logic;
signal dec_in : std_logic_vector(2 downto 0);
signal enable : std_logic_vector(1 downto 0);
begin
lbl1: input_fsm port map(tf_rise => tf_rise, 
			clk => clk,
			reset => reset,
			dec_in => dec_in,
			enable => enable);
clk <= '1' after 0 ns, '0' after 60 ns when clk /= '0' else '1' after 60 ns;
reset <= '1', '0' after 110 ns;
tf_rise <= '0' after 0 ns, '1' after 600 ns when tf_rise /= '1' else '0' after 600 ns;
dec_in <= "111" after 0 ns, "100" after 300 ns, "110" after 400 ns;
end behaviour;








