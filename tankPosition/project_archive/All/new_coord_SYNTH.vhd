
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of new_coord is

   component mux_8bits
      port( new_1 : out std_logic_vector (7 downto 0);  old_1, old_2 : in 
            std_logic_vector (7 downto 0);  control : in std_logic);
   end component;
   
   component mux_2bits
      port( new_1 : out std_logic_vector (1 downto 0);  old_1, old_2 : in 
            std_logic_vector (1 downto 0);  control : in std_logic);
   end component;
   
   component combiblok_coord
      port( input_direction : in std_logic_vector (2 downto 0);  old_direction 
            : in std_logic_vector (1 downto 0);  control : out std_logic);
   end component;
   
   component calculated_new_pos
      port( input_direction10 : in std_logic_vector (1 downto 0);  old_pos : in
            std_logic_vector (7 downto 0);  new_pos : out std_logic_vector (7 
            downto 0));
   end component;
   
   signal new_pos_7_port, new_pos_6_port, new_pos_5_port, new_pos_4_port, 
      new_pos_3_port, new_pos_2_port, new_pos_1_port, new_pos_0_port, control :
      std_logic;

begin
   
   calc_new_pos : calculated_new_pos port map( input_direction10(1) => 
                           input_direction(1), input_direction10(0) => 
                           input_direction(0), old_pos(7) => old_tank_coord(9),
                           old_pos(6) => old_tank_coord(8), old_pos(5) => 
                           old_tank_coord(7), old_pos(4) => old_tank_coord(6), 
                           old_pos(3) => old_tank_coord(5), old_pos(2) => 
                           old_tank_coord(4), old_pos(1) => old_tank_coord(3), 
                           old_pos(0) => old_tank_coord(2), new_pos(7) => 
                           new_pos_7_port, new_pos(6) => new_pos_6_port, 
                           new_pos(5) => new_pos_5_port, new_pos(4) => 
                           new_pos_4_port, new_pos(3) => new_pos_3_port, 
                           new_pos(2) => new_pos_2_port, new_pos(1) => 
                           new_pos_1_port, new_pos(0) => new_pos_0_port);
   combiblok : combiblok_coord port map( input_direction(2) => 
                           input_direction(2), input_direction(1) => 
                           input_direction(1), input_direction(0) => 
                           input_direction(0), old_direction(1) => 
                           old_tank_coord(1), old_direction(0) => 
                           old_tank_coord(0), control => control);
   mux2 : mux_2bits port map( new_1(1) => new_direction(1), new_1(0) => 
                           new_direction(0), old_1(1) => input_direction(1), 
                           old_1(0) => input_direction(0), old_2(1) => 
                           old_tank_coord(1), old_2(0) => old_tank_coord(0), 
                           control => input_direction(2));
   mux8 : mux_8bits port map( new_1(7) => new_tank_coord(7), new_1(6) => 
                           new_tank_coord(6), new_1(5) => new_tank_coord(5), 
                           new_1(4) => new_tank_coord(4), new_1(3) => 
                           new_tank_coord(3), new_1(2) => new_tank_coord(2), 
                           new_1(1) => new_tank_coord(1), new_1(0) => 
                           new_tank_coord(0), old_1(7) => new_pos_7_port, 
                           old_1(6) => new_pos_6_port, old_1(5) => 
                           new_pos_5_port, old_1(4) => new_pos_4_port, old_1(3)
                           => new_pos_3_port, old_1(2) => new_pos_2_port, 
                           old_1(1) => new_pos_1_port, old_1(0) => 
                           new_pos_0_port, old_2(7) => old_tank_coord(9), 
                           old_2(6) => old_tank_coord(8), old_2(5) => 
                           old_tank_coord(7), old_2(4) => old_tank_coord(6), 
                           old_2(3) => old_tank_coord(5), old_2(2) => 
                           old_tank_coord(4), old_2(1) => old_tank_coord(3), 
                           old_2(0) => old_tank_coord(2), control => control);

end synthesised;



