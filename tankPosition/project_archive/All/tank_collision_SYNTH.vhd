
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tank_collision is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mux_8bits
      port( new_1 : out std_logic_vector (7 downto 0);  old_1, old_2 : in 
            std_logic_vector (7 downto 0);  control : in std_logic);
   end component;
   
   component fa_5_bit
      port( a, b : in std_logic_vector (3 downto 0);  c : out std_logic_vector 
            (4 downto 0));
   end component;
   
   signal subtract_vectorx_4_port, subtract_vectorx_3_port, 
      subtract_vectorx_2_port, subtract_vectorx_1_port, subtract_vectorx_0_port
      , subtract_vectory_4_port, subtract_vectory_3_port, 
      subtract_vectory_2_port, subtract_vectory_1_port, subtract_vectory_0_port
      , collision_result, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29
      , n30 : std_logic;

begin
   
   subtractx : fa_5_bit port map( a(3) => wc_newcoor_1(3), a(2) => 
                           wc_newcoor_1(2), a(1) => wc_newcoor_1(1), a(0) => 
                           wc_newcoor_1(0), b(3) => wc_newcoor_2(3), b(2) => 
                           wc_newcoor_2(2), b(1) => wc_newcoor_2(1), b(0) => 
                           wc_newcoor_2(0), c(4) => subtract_vectorx_4_port, 
                           c(3) => subtract_vectorx_3_port, c(2) => 
                           subtract_vectorx_2_port, c(1) => 
                           subtract_vectorx_1_port, c(0) => 
                           subtract_vectorx_0_port);
   subtracty : fa_5_bit port map( a(3) => wc_newcoor_1(7), a(2) => 
                           wc_newcoor_1(6), a(1) => wc_newcoor_1(5), a(0) => 
                           wc_newcoor_1(4), b(3) => wc_newcoor_2(7), b(2) => 
                           wc_newcoor_2(6), b(1) => wc_newcoor_2(5), b(0) => 
                           wc_newcoor_2(4), c(4) => subtract_vectory_4_port, 
                           c(3) => subtract_vectory_3_port, c(2) => 
                           subtract_vectory_2_port, c(1) => 
                           subtract_vectory_1_port, c(0) => 
                           subtract_vectory_0_port);
   mux_tank1 : mux_8bits port map( new_1(7) => tc_newcoor_1(7), new_1(6) => 
                           tc_newcoor_1(6), new_1(5) => tc_newcoor_1(5), 
                           new_1(4) => tc_newcoor_1(4), new_1(3) => 
                           tc_newcoor_1(3), new_1(2) => tc_newcoor_1(2), 
                           new_1(1) => tc_newcoor_1(1), new_1(0) => 
                           tc_newcoor_1(0), old_1(7) => wc_newcoor_1(7), 
                           old_1(6) => wc_newcoor_1(6), old_1(5) => 
                           wc_newcoor_1(5), old_1(4) => wc_newcoor_1(4), 
                           old_1(3) => wc_newcoor_1(3), old_1(2) => 
                           wc_newcoor_1(2), old_1(1) => wc_newcoor_1(1), 
                           old_1(0) => wc_newcoor_1(0), old_2(7) => 
                           oldcoor_1(7), old_2(6) => oldcoor_1(6), old_2(5) => 
                           oldcoor_1(5), old_2(4) => oldcoor_1(4), old_2(3) => 
                           oldcoor_1(3), old_2(2) => oldcoor_1(2), old_2(1) => 
                           oldcoor_1(1), old_2(0) => oldcoor_1(0), control => 
                           collision_result);
   mux_tank2 : mux_8bits port map( new_1(7) => tc_newcoor_2(7), new_1(6) => 
                           tc_newcoor_2(6), new_1(5) => tc_newcoor_2(5), 
                           new_1(4) => tc_newcoor_2(4), new_1(3) => 
                           tc_newcoor_2(3), new_1(2) => tc_newcoor_2(2), 
                           new_1(1) => tc_newcoor_2(1), new_1(0) => 
                           tc_newcoor_2(0), old_1(7) => wc_newcoor_2(7), 
                           old_1(6) => wc_newcoor_2(6), old_1(5) => 
                           wc_newcoor_2(5), old_1(4) => wc_newcoor_2(4), 
                           old_1(3) => wc_newcoor_2(3), old_1(2) => 
                           wc_newcoor_2(2), old_1(1) => wc_newcoor_2(1), 
                           old_1(0) => wc_newcoor_2(0), old_2(7) => 
                           oldcoor_2(7), old_2(6) => oldcoor_2(6), old_2(5) => 
                           oldcoor_2(5), old_2(4) => oldcoor_2(4), old_2(3) => 
                           oldcoor_2(3), old_2(2) => oldcoor_2(2), old_2(1) => 
                           oldcoor_2(1), old_2(0) => oldcoor_2(0), control => 
                           collision_result);
   U20 : no210 port map( A => n19, B => n20, Y => collision_result);
   U21 : mu111 port map( A => n21, B => n22, S => subtract_vectory_2_port, Y =>
                           n20);
   U22 : na310 port map( A => subtract_vectory_3_port, B => 
                           subtract_vectory_1_port, C => 
                           subtract_vectory_4_port, Y => n22);
   U23 : na310 port map( A => n23, B => n24, C => n25, Y => n21);
   U24 : na210 port map( A => subtract_vectory_0_port, B => 
                           subtract_vectory_1_port, Y => n25);
   U25 : iv110 port map( A => subtract_vectory_4_port, Y => n24);
   U26 : iv110 port map( A => subtract_vectory_3_port, Y => n23);
   U27 : mu111 port map( A => n26, B => n27, S => subtract_vectorx_2_port, Y =>
                           n19);
   U28 : na310 port map( A => subtract_vectorx_3_port, B => 
                           subtract_vectorx_1_port, C => 
                           subtract_vectorx_4_port, Y => n27);
   U29 : na310 port map( A => n28, B => n29, C => n30, Y => n26);
   U30 : na210 port map( A => subtract_vectorx_1_port, B => 
                           subtract_vectorx_0_port, Y => n30);
   U31 : iv110 port map( A => subtract_vectorx_4_port, Y => n29);
   U32 : iv110 port map( A => subtract_vectorx_3_port, Y => n28);

end synthesised;



