library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour_tb of del_bullet_tb is
component delete_bullet is
  port( l_postmux, feedback, coll   : in std_logic;
        l_postdelete                : out std_logic);
end component;

signal l_postmux, feedback, coll, l_postdelete : std_logic; 

begin

lbl1: delete_bullet port map(l_postmux, feedback, coll, l_postdelete); 
	
l_postmux <=		'0' after 0 ns, 
		'1' after 40 ns; 

feedback <= 		'0' after 0 ns,
		'1' after 20 ns, 	
		'0' after 40 ns, 	
		'1' after 60 ns; 
		
coll <= 		'0' after 0 ns, 
		'1' after 10 ns, 
		'0' after 20 ns, 
		'1' after 30 ns,
		'0' after 40 ns, 
		'1' after 50 ns, 
		'0' after 60 ns, 
		'1' after 70 ns; 
	

end behaviour_tb;


