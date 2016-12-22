library IEEE;
use IEEE.std_logic_1164.ALL;

entity reset_freq is
   port(tone      :in    std_logic_vector(2 downto 0);
	idle	: in 	std_logic; 
        count_freq:in    std_logic_vector(6 downto 0);
        res_freq  :out   std_logic);
end reset_freq;





