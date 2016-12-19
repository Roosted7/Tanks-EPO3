library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour_tb of bullet_col_tb is

component bullet_coll is
  port( b1, b2, postmux_b1, postmux_b2  : in std_logic_vector(10 downto 0);
        coll                            : out std_logic);
end component;

signal b1, b2, postmux_b1, postmux_b2 : std_logic_vector(10 downto 0);
signal coll : std_logic; 

begin

lbl1: bullet_coll port map(b1, b2, postmux_b1, postmux_b2, coll); 

-- The first 4 situations has to give a high coll signal. The last 4 signals has to give a low coll signal. 

-- NOTE: BETWEEN 60 AND 70 NS THE COLL SIGNAL IS HIGH BECAUSE THE TWO NON-EXISTING BULLETS WOULD GIVE A COLLISION, BUT THAT DOESN'T REALLY MATTER SINCE THEY'RE ALREADY DEAD (A COLLISION WILL MAKE THE 'EXISTING BIT' LOW, BUT IT ALREADY IS)

b1 <= 		"10011111100" after 0 ns, 
		"11010000001" after 10 ns, 
		"10011001110" after 20 ns,
		"10101010111" after 30 ns,  
		"00011111100" after 40 ns,
		"11010000001" after 50 ns, 
		"00011001110" after 60 ns, 
		"10101010110" after 70 ns,
		"11000111101" after 80 ns; 

b2 <= 		"10010111110" after 0 ns, 
		"11010000111" after 10 ns, 
		"10100001100" after 20 ns, 
		"10101010001" after 30 ns,
		"10010111110" after 40 ns,
		"01010000111" after 50 ns, 
		"00100001100" after 60 ns, 
		"10111010100" after 70 ns,
		"10011010100" after 80 ns;

postmux_b1 <= 		"10010111110" after 0 ns, 
		"11010000101" after 10 ns, 
		"10100001110" after 20 ns, 
		"10101010011" after 30 ns, 
		"00010111110" after 40 ns, 
		"11010000101" after 50 ns, 
		"00100001110" after 60 ns, 
		"10110010110" after 70 ns, 
		"11000111001" after 80 ns; 

postmux_b2 <= 		"10011111110" after 0 ns, 
		"11010000011" after 10 ns, 
		"10011001100" after 20 ns,
		"10101010101" after 30 ns, 
		"10011111110" after 40 ns,  
		"01010000011" after 50 ns, 
		"00011001100" after 60 ns, 
		"10110010100" after 70 ns, 
		"10010010100" after 80 ns; 

		


end behaviour_tb;





