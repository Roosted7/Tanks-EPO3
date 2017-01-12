
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of new_pos_vec is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;

begin
   
   U26 : mu111 port map( A => new_pos(3), B => old_pos(7), S => 
                           input_direction0, Y => new_pos_vector(7));
   U27 : mu111 port map( A => new_pos(2), B => old_pos(6), S => 
                           input_direction0, Y => new_pos_vector(6));
   U28 : mu111 port map( A => new_pos(1), B => old_pos(5), S => 
                           input_direction0, Y => new_pos_vector(5));
   U29 : mu111 port map( A => new_pos(0), B => old_pos(4), S => 
                           input_direction0, Y => new_pos_vector(4));
   U30 : mu111 port map( A => old_pos(3), B => new_pos(3), S => 
                           input_direction0, Y => new_pos_vector(3));
   U31 : mu111 port map( A => old_pos(2), B => new_pos(2), S => 
                           input_direction0, Y => new_pos_vector(2));
   U32 : mu111 port map( A => old_pos(1), B => new_pos(1), S => 
                           input_direction0, Y => new_pos_vector(1));
   U33 : mu111 port map( A => old_pos(0), B => new_pos(0), S => 
                           input_direction0, Y => new_pos_vector(0));

end synthesised;



