library IEEE;
use IEEE.std_logic_1164.ALL;

entity new_top is
   port(input_direction_1	:in    std_logic_vector(2 downto 0);
        input_direction_2	:in    std_logic_vector(2 downto 0);
        old_pos_1			  :in    std_logic_vector(9 downto 0);
        new_pos_1			  :out   std_logic_vector(9 downto 0);
        old_pos_2			  :in    std_logic_vector(10 downto 0);
        new_pos_2			  :out   std_logic_vector(9 downto 0);
        clk      			 :in    std_logic;
	reset 		: in std_logic);
end new_top;





