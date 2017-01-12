
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of calculated_new_pos is

   component new_pos_vec
      port( new_pos : in std_logic_vector (3 downto 0);  old_pos : in 
            std_logic_vector (7 downto 0);  input_direction0 : in std_logic;  
            new_pos_vector : out std_logic_vector (7 downto 0));
   end component;
   
   component adder_5bits
      port( old_pos : in std_logic_vector (7 downto 0);  input_direction10 : in
            std_logic_vector (1 downto 0);  new_pos : out std_logic_vector (3 
            downto 0));
   end component;
   
   signal new_pos_vector_3_port, new_pos_vector_2_port, new_pos_vector_1_port, 
      new_pos_vector_0_port : std_logic;

begin
   
   adder : adder_5bits port map( old_pos(7) => old_pos(7), old_pos(6) => 
                           old_pos(6), old_pos(5) => old_pos(5), old_pos(4) => 
                           old_pos(4), old_pos(3) => old_pos(3), old_pos(2) => 
                           old_pos(2), old_pos(1) => old_pos(1), old_pos(0) => 
                           old_pos(0), input_direction10(1) => 
                           input_direction10(1), input_direction10(0) => 
                           input_direction10(0), new_pos(3) => 
                           new_pos_vector_3_port, new_pos(2) => 
                           new_pos_vector_2_port, new_pos(1) => 
                           new_pos_vector_1_port, new_pos(0) => 
                           new_pos_vector_0_port);
   new_posistion : new_pos_vec port map( new_pos(3) => new_pos_vector_3_port, 
                           new_pos(2) => new_pos_vector_2_port, new_pos(1) => 
                           new_pos_vector_1_port, new_pos(0) => 
                           new_pos_vector_0_port, old_pos(7) => old_pos(7), 
                           old_pos(6) => old_pos(6), old_pos(5) => old_pos(5), 
                           old_pos(4) => old_pos(4), old_pos(3) => old_pos(3), 
                           old_pos(2) => old_pos(2), old_pos(1) => old_pos(1), 
                           old_pos(0) => old_pos(0), input_direction0 => 
                           input_direction10(0), new_pos_vector(7) => 
                           new_pos(7), new_pos_vector(6) => new_pos(6), 
                           new_pos_vector(5) => new_pos(5), new_pos_vector(4) 
                           => new_pos(4), new_pos_vector(3) => new_pos(3), 
                           new_pos_vector(2) => new_pos(2), new_pos_vector(1) 
                           => new_pos(1), new_pos_vector(0) => new_pos(0));

end synthesised;



