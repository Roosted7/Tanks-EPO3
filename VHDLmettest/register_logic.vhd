library IEEE;
use IEEE.std_logic_1164.ALL;

entity register_logic is
   port(enable:in		  std_logic_vector(1 downto 0);
	reg_in:in    std_logic_vector(2 downto 0);
        enc_in:in    std_logic_vector(2 downto 0);
        output:out   std_logic_vector(2 downto 0));
end register_logic;





