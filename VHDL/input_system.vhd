library IEEE;
use IEEE.std_logic_1164.ALL;

entity input_system is
   port(
	p_l		:in    std_logic;
	p_r	   	:in    std_logic;
	p_u		:in    std_logic;
	p_d		:in    std_logic;
	p_f		:in    std_logic;
        frame			:in    std_logic;
        clk  			:in    std_logic;
	reset		:in    std_logic;
	counter		:in    std_logic_vector(2 downto 0);
	counter_enable	 :out	  std_logic;
        t_e 			:out   std_logic_vector(2 downto 0));
end input_system;














