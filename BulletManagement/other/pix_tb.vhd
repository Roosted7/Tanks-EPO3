library IEEE;
use IEEE.std_logic_1164.all;

entity pix_tb is
end pix_tb;

library ieee; 
use ieee.std_logic_1164.all; 

architecture behaviour of pix_tb is 
component pix 
    port( x, y        : in std_logic_vector(3 downto 0);
          b           : in std_logic_vector(10 downto 0);
          draw        : out std_logic); 
end component; 

signal x, y : std_logic_vector(3 downto 0); 
signal b : std_logic_vector(10 downto 0); 
signal draw : std_logic; 

begin 

-- The test is divided into parts of 10 ns. 
-- The 5 tests is to check if the draw signal is low when it should be low
-- The last 5 tests is to check if the draw signal is high when it should be high
-- 

x <= 	"0000" after 0 ns, 
	"1010" after 10 ns,
	"0101" after 20 ns, 
	"1111" after 30 ns, 
	"1001" after 40 ns, 
	"0001" after 50 ns,
	"0011" after 60 ns, 
	"1001" after 70 ns, 
	"0111" after 80 ns, 
	"1010" after 90 ns; 


y <= 	"0000" after 0 ns, 
	"0011" after 10 ns, 
	"0100" after 20 ns, 
	"1110" after 30 ns, 
	"0111" after 40 ns, 
	"1111" after 50 ns, 
	"1000" after 60 ns, 
	"1010" after 70 ns, 
	"1100" after 80 ns, 
	"0011" after 90 ns; 

b <= 	"00000000010" after 0 ns, 
	"11011001100" after 10 ns, 
	"10101010111" after 20 ns, 
	"01111111000" after 30 ns, 
	"11000111101" after 40 ns, 
	"10001111110" after 50 ns,
	"10011100011" after 60 ns, 
	"11001101010" after 70 ns, 
	"10111110001" after 80 ns, 
	"11010001111" after 90 ns; 



end behaviour; 