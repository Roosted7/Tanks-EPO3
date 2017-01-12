
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of fa_5_bit is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1, n2, sub_14_n23, sub_14_n22, sub_14_n21, sub_14_n20, sub_14_n19, 
      sub_14_n18, sub_14_n17, sub_14_n16, sub_14_n15, sub_14_n14, sub_14_n13, 
      sub_14_n12, sub_14_n11, sub_14_n10, sub_14_n9, sub_14_n8, sub_14_n7, 
      sub_14_n6, sub_14_n5, sub_14_n4, sub_14_n3, sub_14_n2, sub_14_n1 : 
      std_logic;

begin
   
   n1 <= '0';
   n2 <= '0';
   sub_14_U28 : no210 port map( A => sub_14_n7, B => a(0), Y => sub_14_n21);
   sub_14_U27 : na210 port map( A => a(0), B => sub_14_n7, Y => sub_14_n23);
   sub_14_U26 : na210 port map( A => sub_14_n6, B => sub_14_n23, Y => c(0));
   sub_14_U25 : ex210 port map( A => b(1), B => a(1), Y => sub_14_n22);
   sub_14_U24 : ex210 port map( A => sub_14_n21, B => sub_14_n22, Y => c(1));
   sub_14_U23 : na210 port map( A => a(1), B => sub_14_n6, Y => sub_14_n18);
   sub_14_U22 : no210 port map( A => sub_14_n6, B => a(1), Y => sub_14_n20);
   sub_14_U21 : no210 port map( A => sub_14_n20, B => b(1), Y => sub_14_n19);
   sub_14_U20 : na210 port map( A => sub_14_n18, B => sub_14_n5, Y => 
                           sub_14_n15);
   sub_14_U19 : ex210 port map( A => a(2), B => b(2), Y => sub_14_n17);
   sub_14_U18 : ex210 port map( A => sub_14_n4, B => sub_14_n17, Y => c(2));
   sub_14_U17 : na210 port map( A => a(2), B => sub_14_n15, Y => sub_14_n16);
   sub_14_U16 : no210 port map( A => sub_14_n15, B => a(2), Y => sub_14_n14);
   sub_14_U15 : no210 port map( A => sub_14_n14, B => b(2), Y => sub_14_n13);
   sub_14_U14 : no210 port map( A => sub_14_n3, B => sub_14_n13, Y => 
                           sub_14_n11);
   sub_14_U13 : ex210 port map( A => a(3), B => b(3), Y => sub_14_n12);
   sub_14_U12 : ex210 port map( A => sub_14_n11, B => sub_14_n12, Y => c(3));
   sub_14_U11 : na210 port map( A => sub_14_n11, B => sub_14_n1, Y => sub_14_n8
                           );
   sub_14_U10 : na210 port map( A => a(3), B => sub_14_n2, Y => sub_14_n10);
   sub_14_U9 : na210 port map( A => b(3), B => sub_14_n10, Y => sub_14_n9);
   sub_14_U8 : na210 port map( A => sub_14_n8, B => sub_14_n9, Y => c(4));
   sub_14_U7 : iv110 port map( A => b(0), Y => sub_14_n7);
   sub_14_U6 : iv110 port map( A => sub_14_n21, Y => sub_14_n6);
   sub_14_U5 : iv110 port map( A => sub_14_n19, Y => sub_14_n5);
   sub_14_U4 : iv110 port map( A => sub_14_n15, Y => sub_14_n4);
   sub_14_U3 : iv110 port map( A => sub_14_n16, Y => sub_14_n3);
   sub_14_U2 : iv110 port map( A => sub_14_n11, Y => sub_14_n2);
   sub_14_U1 : iv110 port map( A => a(3), Y => sub_14_n1);

end synthesised;



