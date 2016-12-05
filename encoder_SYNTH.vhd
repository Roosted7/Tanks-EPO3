
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of encoder is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27 : 
      std_logic;

begin
   
   U18 : na310 port map( A => n15, B => n16, C => n17, Y => t_e(2));
   U19 : no210 port map( A => p_f, B => n18, Y => n17);
   U20 : no210 port map( A => n19, B => n20, Y => n18);
   U21 : na210 port map( A => p_r, B => p_l, Y => n16);
   U22 : ex210 port map( A => n21, B => p_u, Y => n15);
   U23 : na210 port map( A => n19, B => n20, Y => n21);
   U24 : no310 port map( A => n22, B => p_f, C => n23, Y => t_e(1));
   U25 : ex210 port map( A => p_r, B => n20, Y => n23);
   U26 : iv110 port map( A => p_d, Y => n20);
   U27 : iv110 port map( A => n24, Y => n22);
   U28 : no210 port map( A => p_l, B => p_u, Y => n24);
   U29 : na210 port map( A => n25, B => n26, Y => t_e(0));
   U30 : na210 port map( A => n19, B => n27, Y => n26);
   U31 : ex210 port map( A => p_u, B => p_d, Y => n27);
   U32 : no210 port map( A => p_r, B => p_l, Y => n19);
   U33 : iv110 port map( A => p_f, Y => n25);

end synthesised;



