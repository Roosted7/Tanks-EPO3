library IEEE;
use IEEE.std_logic_1164.all;

entity bullet_coll is
  port( b1, b2, postmux_b1, postmux_b2  : in std_logic_vector(10 downto 0);
        coll                            : out std_logic);
end bullet_coll;

architecture bullet_coll_arch of bullet_coll is
  
  signal a, b  : std_logic;
  
begin

--Compare existence, x coordinates and y coordinates.

  a <=  (b1(10) xnor postmux_b2(10)) and
        (b1(9) xnor postmux_b2(9)) and
        (b1(8) xnor postmux_b2(8)) and
        (b1(7) xnor postmux_b2(7)) and
        (b1(6) xnor postmux_b2(6)) and
        (b1(5) xnor postmux_b2(5)) and
        (b1(4) xnor postmux_b2(4)) and
        (b1(3) xnor postmux_b2(3)) and
        (b1(2) xnor postmux_b2(2));

  b <=  (b2(10) xnor postmux_b1(10)) and
        (b2(9) xnor postmux_b1(9)) and
        (b2(8) xnor postmux_b1(8)) and
        (b2(7) xnor postmux_b1(7)) and
        (b2(6) xnor postmux_b1(6)) and
        (b2(5) xnor postmux_b1(5)) and
        (b2(4) xnor postmux_b1(4)) and
        (b2(3) xnor postmux_b1(3)) and
        (b2(2) xnor postmux_b1(2));
  
  coll <= a and b;
  
end bullet_coll_arch;
