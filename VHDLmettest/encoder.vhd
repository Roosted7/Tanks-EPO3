library IEEE;
use IEEE.std_logic_1164.ALL;

entity encoder is
   port(p_l 	  :in    std_logic;
        p_r	   :in    std_logic;
        p_u   	:in    std_logic;
        p_d	   :in    std_logic;
        p_f	   :in    std_logic;
        t_e    :out   std_logic_vector(2 downto 0));
end encoder;





