library IEEE;
use IEEE.std_logic_1164.ALL;

entity toplvl_screen is
   port(reset   :in    std_logic;
        x       :in    std_logic_vector(3 downto 0);
        y       :in    std_logic_vector(3 downto 0);
        exist_t1:in    std_logic;
        exist_t2:in    std_logic;
        fire_t1 :in    std_logic;
        fire_t2 :in    std_logic;
        clk     :in    std_logic;
        rgb     :in    std_logic_vector(2 downto 0);
        rgb_out :out   std_logic_vector(2 downto 0)); 
end toplvl_screen;





