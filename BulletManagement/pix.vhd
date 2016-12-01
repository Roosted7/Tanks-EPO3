library IEEE;
use IEEE.std_logic_1164.all;

entity pix is
    port( x, y        : in std_logic_vector(3 downto 0);
          b           : in std_logic_vector(10 downto 0);
          draw        : out std_logic);  
end pix;

architecture pix_arch of pix is
begin
  
  draw <= (b(9) xnor x(3)) and 
          (b(8) xnor x(2)) and 
          (b(7) xnor x(1)) and 
          (b(6) xnor x(0)) and
          (b(5) xnor y(3)) and
          (b(4) xnor y(2)) and
          (b(3) xnor y(1)) and
          (b(2) xnor y(0));
  
end pix_arch;
