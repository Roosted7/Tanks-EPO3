
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of mux_1bits is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;

begin
   
   U5 : mu111 port map( A => old_1, B => old_2, S => control, Y => new_1);

end synthesised;



