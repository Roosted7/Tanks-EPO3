library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_count_tb is

component input_counter is
	port(
		clk   :in	   std_logic;
		reset :in	   std_logic;
		enable:in    std_logic_vector(1 downto 0);
        		count :out   std_logic_vector(2 downto 0));
end component;

signal clk, reset : std_logic;
signal enable : std_logic_vector(1 downto 0);
signal count_1 : std_logic_vector(2 downto 0);
begin
lbl1 : input_counter port map(
			clk => clk,
			reset => reset,
			enable => enable,
			count => count_1);

clk <= '1' after 0 ns, '0' after 60 ns when clk /= '0' else '1' after 60 ns;
reset <= '1', '0' after 110 ns;
enable <= "00" after 0 ns, 
		"10" after 400 ns, 
		"01" after 650 ns, 
		"11" after 800 ns,
		"01" after 950 ns,
		"11" after 1300 ns;

end behaviour;


