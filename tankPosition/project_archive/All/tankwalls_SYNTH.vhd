
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tankwalls is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
      n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92
      , n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, 
      n106, n107, n108, n109, n110, n111, n112 : std_logic;

begin
   
   U65 : na210 port map( A => n64, B => n65, Y => result);
   U66 : mu111 port map( A => n66, B => n67, S => coord(3), Y => n65);
   U67 : na210 port map( A => coord(0), B => n68, Y => n67);
   U68 : na210 port map( A => n69, B => n70, Y => n68);
   U69 : na210 port map( A => n71, B => n72, Y => n70);
   U70 : na210 port map( A => n73, B => n74, Y => n66);
   U71 : na210 port map( A => n75, B => n76, Y => n73);
   U72 : na210 port map( A => coord(7), B => coord(4), Y => n76);
   U73 : mu111 port map( A => n77, B => n78, S => coord(5), Y => n64);
   U74 : no310 port map( A => n79, B => n80, C => n81, Y => n78);
   U75 : no210 port map( A => coord(7), B => n82, Y => n81);
   U76 : no210 port map( A => n83, B => n84, Y => n82);
   U77 : mu111 port map( A => n85, B => n86, S => coord(6), Y => n84);
   U78 : na210 port map( A => n87, B => n88, Y => n86);
   U79 : na210 port map( A => n89, B => n71, Y => n88);
   U80 : mu111 port map( A => n74, B => n90, S => coord(1), Y => n89);
   U81 : no210 port map( A => n91, B => n71, Y => n80);
   U82 : iv110 port map( A => coord(4), Y => n71);
   U83 : no210 port map( A => n92, B => n93, Y => n91);
   U84 : mu111 port map( A => n85, B => coord(7), S => coord(6), Y => n93);
   U85 : no210 port map( A => coord(6), B => n94, Y => n79);
   U86 : no310 port map( A => n95, B => n96, C => n97, Y => n77);
   U87 : no210 port map( A => n98, B => n72, Y => n97);
   U88 : no210 port map( A => n92, B => n99, Y => n98);
   U89 : mu111 port map( A => n100, B => n85, S => coord(6), Y => n99);
   U90 : na210 port map( A => n87, B => n101, Y => n100);
   U91 : na210 port map( A => n102, B => coord(4), Y => n101);
   U92 : mu111 port map( A => coord(3), B => coord(0), S => coord(1), Y => n102
                           );
   U93 : mu111 port map( A => n69, B => n75, S => coord(3), Y => n87);
   U94 : no310 port map( A => n90, B => n74, C => n75, Y => n92);
   U95 : no210 port map( A => coord(4), B => n103, Y => n96);
   U96 : no210 port map( A => n83, B => n104, Y => n103);
   U97 : mu111 port map( A => n72, B => n85, S => coord(6), Y => n104);
   U98 : iv110 port map( A => n105, Y => n85);
   U99 : na210 port map( A => n69, B => n75, Y => n105);
   U100 : na210 port map( A => n106, B => n107, Y => n75);
   U101 : iv110 port map( A => coord(7), Y => n72);
   U102 : no310 port map( A => coord(0), B => coord(3), C => n69, Y => n83);
   U103 : na210 port map( A => coord(2), B => coord(1), Y => n69);
   U104 : no210 port map( A => n94, B => n108, Y => n95);
   U105 : iv110 port map( A => coord(6), Y => n108);
   U106 : mu111 port map( A => n109, B => n110, S => n107, Y => n94);
   U107 : iv110 port map( A => coord(2), Y => n107);
   U108 : na210 port map( A => coord(1), B => n111, Y => n110);
   U109 : na210 port map( A => coord(3), B => n74, Y => n111);
   U110 : iv110 port map( A => coord(0), Y => n74);
   U111 : na210 port map( A => n112, B => n106, Y => n109);
   U112 : iv110 port map( A => coord(1), Y => n106);
   U113 : na210 port map( A => coord(0), B => n90, Y => n112);
   U114 : iv110 port map( A => coord(3), Y => n90);

end synthesised;



