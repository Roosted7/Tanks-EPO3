library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of reg_tb is
component reg_11 
  port( clk     : in std_logic;
        reset   : in std_logic;
        d       : in std_logic_vector(10 downto 0);
        q       : out std_logic_vector(10 downto 0));
end component;

signal clk, reset : std_logic; 
signal d, q : std_logic_vector(10 downto 0); 

begin

-- The signal q must be updated on the rising edge of the clk signal. After updated, q must be stable between two rising edges. When the reset signal is high, q muste be "00000000000" after a rising edge of the clk (because the reset signal is synchronized). 

lbl1: reg_11 port map(clk, reset, d, q); 

clk <= 		'0' after 0 ns, 
		'1' after 10 ns when clk /= '1' else '0' after 10 ns; 


reset <=		'1' after 0 ns, 
		'0' after 20 ns, 
		'1' after 100 ns; 

d <= 		"10000101010" after 0 ns, 	
		"01010111000" after 30 ns, 
		"01110101011" after 50 ns, 
		"10011111010" after 70 ns, 
		"10110110100" after 90 ns, 	
		"01000110001" after 110 ns; 


end behaviour;





