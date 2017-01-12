
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tank_pos_top_level is

   component tank_collision
      port( oldcoor_1, oldcoor_2, wc_newcoor_1, wc_newcoor_2 : in 
            std_logic_vector (7 downto 0);  tc_newcoor_1, tc_newcoor_2 : out 
            std_logic_vector (7 downto 0));
   end component;
   
   component wallcheck
      port( oldcoor_1, oldcoor_2, newcoor_1, newcoor_2 : in std_logic_vector (7
            downto 0);  wc_newcoor_1, wc_newcoor_2 : out std_logic_vector (7 
            downto 0);  count_in : in std_logic_vector (2 downto 0);  reset, 
            clk : in std_logic);
   end component;
   
   component new_coord
      port( old_tank_coord : in std_logic_vector (10 downto 0);  new_direction 
            : out std_logic_vector (1 downto 0);  input_direction : in 
            std_logic_vector (2 downto 0);  new_tank_coord : out 
            std_logic_vector (7 downto 0));
   end component;
   
   signal newcoor_1_7_port, newcoor_1_6_port, newcoor_1_5_port, 
      newcoor_1_4_port, newcoor_1_3_port, newcoor_1_2_port, newcoor_1_1_port, 
      newcoor_1_0_port, newcoor_2_7_port, newcoor_2_6_port, newcoor_2_5_port, 
      newcoor_2_4_port, newcoor_2_3_port, newcoor_2_2_port, newcoor_2_1_port, 
      newcoor_2_0_port, wc_newcoor_1_7_port, wc_newcoor_1_6_port, 
      wc_newcoor_1_5_port, wc_newcoor_1_4_port, wc_newcoor_1_3_port, 
      wc_newcoor_1_2_port, wc_newcoor_1_1_port, wc_newcoor_1_0_port, 
      wc_newcoor_2_7_port, wc_newcoor_2_6_port, wc_newcoor_2_5_port, 
      wc_newcoor_2_4_port, wc_newcoor_2_3_port, wc_newcoor_2_2_port, 
      wc_newcoor_2_1_port, wc_newcoor_2_0_port : std_logic;

begin
   
   new_coordinates_tank1 : new_coord port map( old_tank_coord(10) => 
                           old_pos_1(10), old_tank_coord(9) => old_pos_1(9), 
                           old_tank_coord(8) => old_pos_1(8), old_tank_coord(7)
                           => old_pos_1(7), old_tank_coord(6) => old_pos_1(6), 
                           old_tank_coord(5) => old_pos_1(5), old_tank_coord(4)
                           => old_pos_1(4), old_tank_coord(3) => old_pos_1(3), 
                           old_tank_coord(2) => old_pos_1(2), old_tank_coord(1)
                           => old_pos_1(1), old_tank_coord(0) => old_pos_1(0), 
                           new_direction(1) => new_pos_1(1), new_direction(0) 
                           => new_pos_1(0), input_direction(2) => 
                           input_direction_1(2), input_direction(1) => 
                           input_direction_1(1), input_direction(0) => 
                           input_direction_1(0), new_tank_coord(7) => 
                           newcoor_1_7_port, new_tank_coord(6) => 
                           newcoor_1_6_port, new_tank_coord(5) => 
                           newcoor_1_5_port, new_tank_coord(4) => 
                           newcoor_1_4_port, new_tank_coord(3) => 
                           newcoor_1_3_port, new_tank_coord(2) => 
                           newcoor_1_2_port, new_tank_coord(1) => 
                           newcoor_1_1_port, new_tank_coord(0) => 
                           newcoor_1_0_port);
   new_coordinates_tank2 : new_coord port map( old_tank_coord(10) => 
                           old_pos_2(10), old_tank_coord(9) => old_pos_2(9), 
                           old_tank_coord(8) => old_pos_2(8), old_tank_coord(7)
                           => old_pos_2(7), old_tank_coord(6) => old_pos_2(6), 
                           old_tank_coord(5) => old_pos_2(5), old_tank_coord(4)
                           => old_pos_2(4), old_tank_coord(3) => old_pos_2(3), 
                           old_tank_coord(2) => old_pos_2(2), old_tank_coord(1)
                           => old_pos_2(1), old_tank_coord(0) => old_pos_2(0), 
                           new_direction(1) => new_pos_2(1), new_direction(0) 
                           => new_pos_2(0), input_direction(2) => 
                           input_direction_2(2), input_direction(1) => 
                           input_direction_2(1), input_direction(0) => 
                           input_direction_2(0), new_tank_coord(7) => 
                           newcoor_2_7_port, new_tank_coord(6) => 
                           newcoor_2_6_port, new_tank_coord(5) => 
                           newcoor_2_5_port, new_tank_coord(4) => 
                           newcoor_2_4_port, new_tank_coord(3) => 
                           newcoor_2_3_port, new_tank_coord(2) => 
                           newcoor_2_2_port, new_tank_coord(1) => 
                           newcoor_2_1_port, new_tank_coord(0) => 
                           newcoor_2_0_port);
   check_walls : wallcheck port map( oldcoor_1(7) => old_pos_1(9), oldcoor_1(6)
                           => old_pos_1(8), oldcoor_1(5) => old_pos_1(7), 
                           oldcoor_1(4) => old_pos_1(6), oldcoor_1(3) => 
                           old_pos_1(5), oldcoor_1(2) => old_pos_1(4), 
                           oldcoor_1(1) => old_pos_1(3), oldcoor_1(0) => 
                           old_pos_1(2), oldcoor_2(7) => old_pos_2(9), 
                           oldcoor_2(6) => old_pos_2(8), oldcoor_2(5) => 
                           old_pos_2(7), oldcoor_2(4) => old_pos_2(6), 
                           oldcoor_2(3) => old_pos_2(5), oldcoor_2(2) => 
                           old_pos_2(4), oldcoor_2(1) => old_pos_2(3), 
                           oldcoor_2(0) => old_pos_2(2), newcoor_1(7) => 
                           newcoor_1_7_port, newcoor_1(6) => newcoor_1_6_port, 
                           newcoor_1(5) => newcoor_1_5_port, newcoor_1(4) => 
                           newcoor_1_4_port, newcoor_1(3) => newcoor_1_3_port, 
                           newcoor_1(2) => newcoor_1_2_port, newcoor_1(1) => 
                           newcoor_1_1_port, newcoor_1(0) => newcoor_1_0_port, 
                           newcoor_2(7) => newcoor_2_7_port, newcoor_2(6) => 
                           newcoor_2_6_port, newcoor_2(5) => newcoor_2_5_port, 
                           newcoor_2(4) => newcoor_2_4_port, newcoor_2(3) => 
                           newcoor_2_3_port, newcoor_2(2) => newcoor_2_2_port, 
                           newcoor_2(1) => newcoor_2_1_port, newcoor_2(0) => 
                           newcoor_2_0_port, wc_newcoor_1(7) => 
                           wc_newcoor_1_7_port, wc_newcoor_1(6) => 
                           wc_newcoor_1_6_port, wc_newcoor_1(5) => 
                           wc_newcoor_1_5_port, wc_newcoor_1(4) => 
                           wc_newcoor_1_4_port, wc_newcoor_1(3) => 
                           wc_newcoor_1_3_port, wc_newcoor_1(2) => 
                           wc_newcoor_1_2_port, wc_newcoor_1(1) => 
                           wc_newcoor_1_1_port, wc_newcoor_1(0) => 
                           wc_newcoor_1_0_port, wc_newcoor_2(7) => 
                           wc_newcoor_2_7_port, wc_newcoor_2(6) => 
                           wc_newcoor_2_6_port, wc_newcoor_2(5) => 
                           wc_newcoor_2_5_port, wc_newcoor_2(4) => 
                           wc_newcoor_2_4_port, wc_newcoor_2(3) => 
                           wc_newcoor_2_3_port, wc_newcoor_2(2) => 
                           wc_newcoor_2_2_port, wc_newcoor_2(1) => 
                           wc_newcoor_2_1_port, wc_newcoor_2(0) => 
                           wc_newcoor_2_0_port, count_in(2) => count_in(2), 
                           count_in(1) => count_in(1), count_in(0) => 
                           count_in(0), reset => reset, clk => clk);
   collisions : tank_collision port map( oldcoor_1(7) => old_pos_1(9), 
                           oldcoor_1(6) => old_pos_1(8), oldcoor_1(5) => 
                           old_pos_1(7), oldcoor_1(4) => old_pos_1(6), 
                           oldcoor_1(3) => old_pos_1(5), oldcoor_1(2) => 
                           old_pos_1(4), oldcoor_1(1) => old_pos_1(3), 
                           oldcoor_1(0) => old_pos_1(2), oldcoor_2(7) => 
                           old_pos_2(9), oldcoor_2(6) => old_pos_2(8), 
                           oldcoor_2(5) => old_pos_2(7), oldcoor_2(4) => 
                           old_pos_2(6), oldcoor_2(3) => old_pos_2(5), 
                           oldcoor_2(2) => old_pos_2(4), oldcoor_2(1) => 
                           old_pos_2(3), oldcoor_2(0) => old_pos_2(2), 
                           wc_newcoor_1(7) => wc_newcoor_1_7_port, 
                           wc_newcoor_1(6) => wc_newcoor_1_6_port, 
                           wc_newcoor_1(5) => wc_newcoor_1_5_port, 
                           wc_newcoor_1(4) => wc_newcoor_1_4_port, 
                           wc_newcoor_1(3) => wc_newcoor_1_3_port, 
                           wc_newcoor_1(2) => wc_newcoor_1_2_port, 
                           wc_newcoor_1(1) => wc_newcoor_1_1_port, 
                           wc_newcoor_1(0) => wc_newcoor_1_0_port, 
                           wc_newcoor_2(7) => wc_newcoor_2_7_port, 
                           wc_newcoor_2(6) => wc_newcoor_2_6_port, 
                           wc_newcoor_2(5) => wc_newcoor_2_5_port, 
                           wc_newcoor_2(4) => wc_newcoor_2_4_port, 
                           wc_newcoor_2(3) => wc_newcoor_2_3_port, 
                           wc_newcoor_2(2) => wc_newcoor_2_2_port, 
                           wc_newcoor_2(1) => wc_newcoor_2_1_port, 
                           wc_newcoor_2(0) => wc_newcoor_2_0_port, 
                           tc_newcoor_1(7) => new_pos_1(9), tc_newcoor_1(6) => 
                           new_pos_1(8), tc_newcoor_1(5) => new_pos_1(7), 
                           tc_newcoor_1(4) => new_pos_1(6), tc_newcoor_1(3) => 
                           new_pos_1(5), tc_newcoor_1(2) => new_pos_1(4), 
                           tc_newcoor_1(1) => new_pos_1(3), tc_newcoor_1(0) => 
                           new_pos_1(2), tc_newcoor_2(7) => new_pos_2(9), 
                           tc_newcoor_2(6) => new_pos_2(8), tc_newcoor_2(5) => 
                           new_pos_2(7), tc_newcoor_2(4) => new_pos_2(6), 
                           tc_newcoor_2(3) => new_pos_2(5), tc_newcoor_2(2) => 
                           new_pos_2(4), tc_newcoor_2(1) => new_pos_2(3), 
                           tc_newcoor_2(0) => new_pos_2(2));

end synthesised;



