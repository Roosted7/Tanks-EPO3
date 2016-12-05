
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of register_logic is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   signal n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23 : std_logic;

begin
   
   U17 : iv110 port map( A => n13, Y => output(2));
   U18 : mu111 port map( A => n14, B => n15, S => enable(1), Y => n13);
   U19 : no210 port map( A => enable(0), B => reg_in(2), Y => n15);
   U20 : no210 port map( A => enc_in(2), B => n16, Y => n14);
   U21 : iv110 port map( A => enable(0), Y => n16);
   U22 : iv110 port map( A => n17, Y => output(1));
   U23 : mu111 port map( A => n18, B => n19, S => enable(0), Y => n17);
   U24 : na210 port map( A => enc_in(1), B => n20, Y => n19);
   U25 : na210 port map( A => reg_in(1), B => enable(1), Y => n18);
   U26 : iv110 port map( A => n21, Y => output(0));
   U27 : mu111 port map( A => n22, B => n23, S => enable(0), Y => n21);
   U28 : na210 port map( A => enc_in(0), B => n20, Y => n23);
   U29 : iv110 port map( A => enable(1), Y => n20);
   U30 : na210 port map( A => reg_in(0), B => enable(1), Y => n22);

end synthesised;



