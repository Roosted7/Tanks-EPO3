library IEEE;
use IEEE.std_logic_1164.ALL;

entity input_fsm is
   port(tf_rise:in    std_logic;
        clk    :in    std_logic;
        reset  :in    std_logic;
        dec_in :in    std_logic_vector(2 downto 0);
        enable :out   std_logic_vector(1 downto 0));
end input_fsm;


