
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of mux_2bits is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;

begin
   
   U8 : mu111 port map( A => old_1(1), B => old_2(1), S => control, Y => 
                           new_1(1));
   U9 : mu111 port map( A => old_1(0), B => old_2(0), S => control, Y => 
                           new_1(0));

end synthesised;



