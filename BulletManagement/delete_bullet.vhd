library IEEE;
use IEEE.std_logic_1164.all;

entity delete_bullet is
  port( l_postmux, feedback, coll   : in std_logic;
        l_postdelete                : out std_logic);
end delete_bullet;

architecture delete_bullet_arch of delete_bullet is  
begin
  
 l_postdelete <= l_postmux and feedback and (not coll);
  
end delete_bullet_arch;
