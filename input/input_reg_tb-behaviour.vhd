library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_reg_tb is
component input_register is
	port(input :in    std_logic_vector(2 downto 0);
        clk   :in    std_logic;
        reset :in    std_logic;
        output:out   std_logic_vector(2 downto 0));
end component;

signal input, output : std_logic_vector(2 downto 0);
signal clk, reset : std_logic;
begin
lbl1 : input_register port map(input => input, clk => clk, reset => reset, output => output);
clk <= '1' after 0 ns, '0' after 60 ns when clk /= '0' else '1' after 60 ns;
reset <= '1', '0' after 330 ns;
input <= "111";
end behaviour;


