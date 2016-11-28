library IEEE;
use IEEE.std_logic_1164.all;

entity tank_pix is
   port(x_in 		     :in    std_logic_vector(3 downto 0);
        y_in 		     :in    std_logic_vector(3 downto 0);
        theta		     :in    std_logic_vector(1 downto 0);
        x_head  		   :out   std_logic_vector(3 downto 0);
        y_head       :out   std_logic_vector(3 downto 0);
        x_body       :out   std_logic_vector(3 downto 0);
        y_body       :out   std_logic_vector(3 downto 0);
        x_left_leg   :out   std_logic_vector(3 downto 0);
        y_left_leg   :out   std_logic_vector(3 downto 0);
        x_right_leg  :out   std_logic_vector(3 downto 0);
        y_right_leg  :out   std_logic_vector(3 downto 0);
        x_left_foot  :out   std_logic_vector(3 downto 0);
        y_left_foot  :out   std_logic_vector(3 downto 0);
        x_right_foot :out   std_logic_vector(3 downto 0);
        y_right_foot :out   std_logic_vector(3 downto 0));
end tank_pix;





