
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of combiblok_coord is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   signal n5, n6, n7 : std_logic;

begin
   
   U5 : iv110 port map( A => n5, Y => control);
   U6 : no310 port map( A => n6, B => input_direction(2), C => n7, Y => n5);
   U7 : ex210 port map( A => old_direction(1), B => input_direction(1), Y => n7
                           );
   U8 : ex210 port map( A => old_direction(0), B => input_direction(0), Y => n6
                           );

end synthesised;



