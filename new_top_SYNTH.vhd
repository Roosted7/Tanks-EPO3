
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of new_top is

   component tank_pos_top_level
      port( input_direction_1, input_direction_2 : in std_logic_vector (2 
            downto 0);  old_pos_1 : in std_logic_vector (10 downto 0);  
            new_pos_1 : out std_logic_vector (9 downto 0);  old_pos_2 : in 
            std_logic_vector (10 downto 0);  new_pos_2 : out std_logic_vector 
            (9 downto 0);  count_in : in std_logic_vector (2 downto 0);  reset,
            clk : in std_logic);
   end component;
   
   component counter3bit
      port( clk : in std_logic;  count : out std_logic_vector (2 downto 0);  
            reset : in std_logic);
   end component;
   
   signal X_Logic0_port, count_2_port, count_1_port, count_0_port : std_logic;

begin
   
   lbl0 : counter3bit port map( clk => clk, count(2) => count_2_port, count(1) 
                           => count_1_port, count(0) => count_0_port, reset => 
                           reset);
   lbl1 : tank_pos_top_level port map( input_direction_1(2) => 
                           input_direction_1(2), input_direction_1(1) => 
                           input_direction_1(1), input_direction_1(0) => 
                           input_direction_1(0), input_direction_2(2) => 
                           input_direction_2(2), input_direction_2(1) => 
                           input_direction_2(1), input_direction_2(0) => 
                           input_direction_2(0), old_pos_1(10) => X_Logic0_port
                           , old_pos_1(9) => old_pos_1(9), old_pos_1(8) => 
                           old_pos_1(8), old_pos_1(7) => old_pos_1(7), 
                           old_pos_1(6) => old_pos_1(6), old_pos_1(5) => 
                           old_pos_1(5), old_pos_1(4) => old_pos_1(4), 
                           old_pos_1(3) => old_pos_1(3), old_pos_1(2) => 
                           old_pos_1(2), old_pos_1(1) => old_pos_1(1), 
                           old_pos_1(0) => old_pos_1(0), new_pos_1(9) => 
                           new_pos_1(9), new_pos_1(8) => new_pos_1(8), 
                           new_pos_1(7) => new_pos_1(7), new_pos_1(6) => 
                           new_pos_1(6), new_pos_1(5) => new_pos_1(5), 
                           new_pos_1(4) => new_pos_1(4), new_pos_1(3) => 
                           new_pos_1(3), new_pos_1(2) => new_pos_1(2), 
                           new_pos_1(1) => new_pos_1(1), new_pos_1(0) => 
                           new_pos_1(0), old_pos_2(10) => old_pos_2(10), 
                           old_pos_2(9) => old_pos_2(9), old_pos_2(8) => 
                           old_pos_2(8), old_pos_2(7) => old_pos_2(7), 
                           old_pos_2(6) => old_pos_2(6), old_pos_2(5) => 
                           old_pos_2(5), old_pos_2(4) => old_pos_2(4), 
                           old_pos_2(3) => old_pos_2(3), old_pos_2(2) => 
                           old_pos_2(2), old_pos_2(1) => old_pos_2(1), 
                           old_pos_2(0) => old_pos_2(0), new_pos_2(9) => 
                           new_pos_2(9), new_pos_2(8) => new_pos_2(8), 
                           new_pos_2(7) => new_pos_2(7), new_pos_2(6) => 
                           new_pos_2(6), new_pos_2(5) => new_pos_2(5), 
                           new_pos_2(4) => new_pos_2(4), new_pos_2(3) => 
                           new_pos_2(3), new_pos_2(2) => new_pos_2(2), 
                           new_pos_2(1) => new_pos_2(1), new_pos_2(0) => 
                           new_pos_2(0), count_in(2) => count_2_port, 
                           count_in(1) => count_1_port, count_in(0) => 
                           count_0_port, reset => reset, clk => clk);
   X_Logic0_port <= '0';

end synthesised;



