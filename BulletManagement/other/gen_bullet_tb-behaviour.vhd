library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of gen_bullet_tb is
component gen_bullet 
   port(fire_b1	: in    std_logic_vector(2 downto 0);
        tank_b1	:	in	std_logic_vector(10 downto 0);
	gen_b1	: out	std_logic_vector(10 downto 0)); 
end component;

signal fire_b1 : std_logic_vector(2 downto 0); 
signal tank_b1, gen_b1 : std_logic_vector(10 downto 0);

begin

lbl1: gen_bullet port map(fire_b1, tank_b1, gen_b1); 

fire_b1 <= "101" after 0 ns, 	
	"000" after 800 ns,
	"001" after 820 ns, 
	"010" after 840 ns, 
	"011" after 860 ns, 
	"100" after 880 ns,
	"111" after 900 ns, 
	"101" after 1000 ns; 


tank_b1 <= "10011001100" after 0 ns,
	"10100010001" after 100 ns, 
	"10101010110" after 200 ns,
	"11000100011" after 300 ns, 
	"10000111100" after 400 ns, 
	"10101000001" after 500 ns, 
	"11111010110" after 600 ns, 
	"10101111111" after 700 ns, 
	"00101010100" after 1000 ns; 
	
	

end behaviour;


