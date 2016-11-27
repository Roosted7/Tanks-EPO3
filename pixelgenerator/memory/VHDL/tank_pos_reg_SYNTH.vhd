
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tank_pos_reg is

   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;

begin
   
   or_in_reg_reg_1_inst : dfr11 port map( D => tank_or_in(1), R => reset, CK =>
                           update_pos, Q => tank_or_out(1));
   or_in_reg_reg_0_inst : dfr11 port map( D => tank_or_in(0), R => reset, CK =>
                           update_pos, Q => tank_or_out(0));
   x_in_reg_reg_3_inst : dfr11 port map( D => tank_x_in(3), R => reset, CK => 
                           update_pos, Q => tank_x_out(3));
   x_in_reg_reg_2_inst : dfr11 port map( D => tank_x_in(2), R => reset, CK => 
                           update_pos, Q => tank_x_out(2));
   x_in_reg_reg_1_inst : dfr11 port map( D => tank_x_in(1), R => reset, CK => 
                           update_pos, Q => tank_x_out(1));
   x_in_reg_reg_0_inst : dfr11 port map( D => tank_x_in(0), R => reset, CK => 
                           update_pos, Q => tank_x_out(0));
   y_in_reg_reg_3_inst : dfr11 port map( D => tank_y_in(3), R => reset, CK => 
                           update_pos, Q => tank_y_out(3));
   y_in_reg_reg_2_inst : dfr11 port map( D => tank_y_in(2), R => reset, CK => 
                           update_pos, Q => tank_y_out(2));
   y_in_reg_reg_1_inst : dfr11 port map( D => tank_y_in(1), R => reset, CK => 
                           update_pos, Q => tank_y_out(1));
   y_in_reg_reg_0_inst : dfr11 port map( D => tank_y_in(0), R => reset, CK => 
                           update_pos, Q => tank_y_out(0));

end synthesised;



