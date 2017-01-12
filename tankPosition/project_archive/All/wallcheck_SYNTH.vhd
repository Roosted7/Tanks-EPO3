
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of wallcheck is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mux_8bits
      port( new_1 : out std_logic_vector (7 downto 0);  old_1, old_2 : in 
            std_logic_vector (7 downto 0);  control : in std_logic);
   end component;
   
   component register1bit
      port( D : in std_logic;  Q : out std_logic;  clk, reset : in std_logic);
   end component;
   
   component mux_1bits
      port( new_1 : out std_logic;  old_1, old_2, control : in std_logic);
   end component;
   
   component tankwalls
      port( coord : in std_logic_vector (7 downto 0);  result : out std_logic);
   end component;
   
   signal to_wallcheck_7_port, to_wallcheck_6_port, to_wallcheck_5_port, 
      to_wallcheck_4_port, to_wallcheck_3_port, to_wallcheck_2_port, 
      to_wallcheck_1_port, to_wallcheck_0_port, result, res1, result_tank_1, 
      clk_for_reg_t1, res2, result_tank_2, clk_for_reg_t2, inv_clk, n3, n4 : 
      std_logic;

begin
   
   l1 : mux_8bits port map( new_1(7) => to_wallcheck_7_port, new_1(6) => 
                           to_wallcheck_6_port, new_1(5) => to_wallcheck_5_port
                           , new_1(4) => to_wallcheck_4_port, new_1(3) => 
                           to_wallcheck_3_port, new_1(2) => to_wallcheck_2_port
                           , new_1(1) => to_wallcheck_1_port, new_1(0) => 
                           to_wallcheck_0_port, old_1(7) => newcoor_2(7), 
                           old_1(6) => newcoor_2(6), old_1(5) => newcoor_2(5), 
                           old_1(4) => newcoor_2(4), old_1(3) => newcoor_2(3), 
                           old_1(2) => newcoor_2(2), old_1(1) => newcoor_2(1), 
                           old_1(0) => newcoor_2(0), old_2(7) => newcoor_1(7), 
                           old_2(6) => newcoor_1(6), old_2(5) => newcoor_1(5), 
                           old_2(4) => newcoor_1(4), old_2(3) => newcoor_1(3), 
                           old_2(2) => newcoor_1(2), old_2(1) => newcoor_1(1), 
                           old_2(0) => newcoor_1(0), control => count_in(1));
   l2 : tankwalls port map( coord(7) => to_wallcheck_7_port, coord(6) => 
                           to_wallcheck_6_port, coord(5) => to_wallcheck_5_port
                           , coord(4) => to_wallcheck_4_port, coord(3) => 
                           to_wallcheck_3_port, coord(2) => to_wallcheck_2_port
                           , coord(1) => to_wallcheck_1_port, coord(0) => 
                           to_wallcheck_0_port, result => result);
   mux_t1 : mux_1bits port map( new_1 => res1, old_1 => result_tank_1, old_2 =>
                           result, control => clk_for_reg_t1);
   mux_t2 : mux_1bits port map( new_1 => res2, old_1 => result_tank_2, old_2 =>
                           result, control => clk_for_reg_t2);
   register_tank_1 : register1bit port map( D => res1, Q => result_tank_1, clk 
                           => inv_clk, reset => reset);
   register_tank_2 : register1bit port map( D => res2, Q => result_tank_2, clk 
                           => inv_clk, reset => reset);
   l6 : mux_8bits port map( new_1(7) => wc_newcoor_1(7), new_1(6) => 
                           wc_newcoor_1(6), new_1(5) => wc_newcoor_1(5), 
                           new_1(4) => wc_newcoor_1(4), new_1(3) => 
                           wc_newcoor_1(3), new_1(2) => wc_newcoor_1(2), 
                           new_1(1) => wc_newcoor_1(1), new_1(0) => 
                           wc_newcoor_1(0), old_1(7) => newcoor_1(7), old_1(6) 
                           => newcoor_1(6), old_1(5) => newcoor_1(5), old_1(4) 
                           => newcoor_1(4), old_1(3) => newcoor_1(3), old_1(2) 
                           => newcoor_1(2), old_1(1) => newcoor_1(1), old_1(0) 
                           => newcoor_1(0), old_2(7) => oldcoor_1(7), old_2(6) 
                           => oldcoor_1(6), old_2(5) => oldcoor_1(5), old_2(4) 
                           => oldcoor_1(4), old_2(3) => oldcoor_1(3), old_2(2) 
                           => oldcoor_1(2), old_2(1) => oldcoor_1(1), old_2(0) 
                           => oldcoor_1(0), control => result_tank_1);
   l7 : mux_8bits port map( new_1(7) => wc_newcoor_2(7), new_1(6) => 
                           wc_newcoor_2(6), new_1(5) => wc_newcoor_2(5), 
                           new_1(4) => wc_newcoor_2(4), new_1(3) => 
                           wc_newcoor_2(3), new_1(2) => wc_newcoor_2(2), 
                           new_1(1) => wc_newcoor_2(1), new_1(0) => 
                           wc_newcoor_2(0), old_1(7) => newcoor_2(7), old_1(6) 
                           => newcoor_2(6), old_1(5) => newcoor_2(5), old_1(4) 
                           => newcoor_2(4), old_1(3) => newcoor_2(3), old_1(2) 
                           => newcoor_2(2), old_1(1) => newcoor_2(1), old_1(0) 
                           => newcoor_2(0), old_2(7) => oldcoor_2(7), old_2(6) 
                           => oldcoor_2(6), old_2(5) => oldcoor_2(5), old_2(4) 
                           => oldcoor_2(4), old_2(3) => oldcoor_2(3), old_2(2) 
                           => oldcoor_2(2), old_2(1) => oldcoor_2(1), old_2(0) 
                           => oldcoor_2(0), control => result_tank_2);
   U6 : iv110 port map( A => clk, Y => inv_clk);
   U7 : no210 port map( A => count_in(1), B => n3, Y => clk_for_reg_t2);
   U8 : no210 port map( A => n3, B => n4, Y => clk_for_reg_t1);
   U9 : iv110 port map( A => count_in(1), Y => n4);
   U10 : iv110 port map( A => count_in(0), Y => n3);

end synthesised;



