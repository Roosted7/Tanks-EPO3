
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tank_hit_reg is

   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;

begin
   
   hit_reg_reg : dfr11 port map( D => hit_in, R => reset, CK => clk, Q => 
                           hit_out);

end synthesised;



