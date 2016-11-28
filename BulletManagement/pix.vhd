library IEEE;
use IEEE.std_logic_1164.all;

entity pix is
    port( x, y        : in std_logic_vector(3 downto 0);
          b           : in std_logic_vector(10 downto 0);
          draw        : out std_logic);  
end pix;

architecture pix_structural of pix is
begin
  
  draw <= (b(9) and x(3)) and 
          (b(8) and x(2)) and 
          (b(7) and x(1)) and 
          (b(6) and x(0)) and
          (b(5) and y(3)) and
          (b(4) and y(2)) and
          (b(3) and y(1)) and
          (b(2) and y(0));
  
end pix_structural;
