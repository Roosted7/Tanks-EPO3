
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of input_register is

   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;

begin
   
   value_reg_2_inst : dfa11 port map( D => input(2), CK => clk, R => reset, Q 
                           => output(2));
   value_reg_1_inst : dfa11 port map( D => input(1), CK => clk, R => reset, Q 
                           => output(1));
   value_reg_0_inst : dfa11 port map( D => input(0), CK => clk, R => reset, Q 
                           => output(0));

end synthesised;



