
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of mux_8bits is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;

begin
   
   U26 : mu111 port map( A => old_1(7), B => old_2(7), S => control, Y => 
                           new_1(7));
   U27 : mu111 port map( A => old_1(6), B => old_2(6), S => control, Y => 
                           new_1(6));
   U28 : mu111 port map( A => old_1(5), B => old_2(5), S => control, Y => 
                           new_1(5));
   U29 : mu111 port map( A => old_1(4), B => old_2(4), S => control, Y => 
                           new_1(4));
   U30 : mu111 port map( A => old_1(3), B => old_2(3), S => control, Y => 
                           new_1(3));
   U31 : mu111 port map( A => old_1(2), B => old_2(2), S => control, Y => 
                           new_1(2));
   U32 : mu111 port map( A => old_1(1), B => old_2(1), S => control, Y => 
                           new_1(1));
   U33 : mu111 port map( A => old_1(0), B => old_2(0), S => control, Y => 
                           new_1(0));

end synthesised;



