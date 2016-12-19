
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of pg_pxc is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   signal n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28 
      : std_logic;

begin
   
   U16 : no210 port map( A => n15, B => n16, Y => intersect);
   U17 : na210 port map( A => n17, B => n18, Y => n16);
   U18 : no210 port map( A => n19, B => n20, Y => n18);
   U19 : ex210 port map( A => y_video(1), B => y_tank(1), Y => n20);
   U20 : ex210 port map( A => y_video(0), B => y_tank(0), Y => n19);
   U21 : no210 port map( A => n21, B => n22, Y => n17);
   U22 : ex210 port map( A => y_video(3), B => y_tank(3), Y => n22);
   U23 : ex210 port map( A => y_video(2), B => y_tank(2), Y => n21);
   U24 : na210 port map( A => n23, B => n24, Y => n15);
   U25 : no210 port map( A => n25, B => n26, Y => n24);
   U26 : ex210 port map( A => x_video(1), B => x_tank(1), Y => n26);
   U27 : ex210 port map( A => x_video(0), B => x_tank(0), Y => n25);
   U28 : no210 port map( A => n27, B => n28, Y => n23);
   U29 : ex210 port map( A => x_video(3), B => x_tank(3), Y => n28);
   U30 : ex210 port map( A => x_video(2), B => x_tank(2), Y => n27);

end synthesised;



