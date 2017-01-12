
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of adder_5bits is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   signal new_pos_3_port, new_pos_2_port, new_pos_1_port, new_pos_0_port, n31, 
      n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46
      , n47, n48, n49, n50 : std_logic;

begin
   new_pos <= ( new_pos_3_port, new_pos_2_port, new_pos_1_port, new_pos_0_port 
      );
   
   U33 : mu111 port map( A => n31, B => n32, S => input_direction10(0), Y => 
                           new_pos_3_port);
   U34 : ex210 port map( A => n33, B => old_pos(3), Y => n32);
   U35 : ex210 port map( A => n33, B => old_pos(7), Y => n31);
   U36 : ex210 port map( A => n34, B => n35, Y => n33);
   U37 : no210 port map( A => n36, B => n37, Y => n35);
   U38 : no210 port map( A => n38, B => n39, Y => n37);
   U39 : no210 port map( A => n40, B => n34, Y => n36);
   U40 : iv110 port map( A => n41, Y => n40);
   U41 : na210 port map( A => n39, B => n38, Y => n41);
   U42 : iv110 port map( A => n42, Y => n39);
   U43 : ex210 port map( A => n38, B => n43, Y => new_pos_2_port);
   U44 : ex210 port map( A => input_direction10(1), B => n42, Y => n43);
   U45 : no210 port map( A => n44, B => n45, Y => n42);
   U46 : no210 port map( A => n46, B => input_direction10(1), Y => n45);
   U47 : no210 port map( A => n47, B => n48, Y => n46);
   U48 : no210 port map( A => new_pos_0_port, B => n49, Y => n44);
   U49 : iv110 port map( A => n47, Y => n49);
   U50 : mu111 port map( A => old_pos(6), B => old_pos(2), S => 
                           input_direction10(0), Y => n38);
   U51 : ex210 port map( A => n50, B => n47, Y => new_pos_1_port);
   U52 : mu111 port map( A => old_pos(5), B => old_pos(1), S => 
                           input_direction10(0), Y => n47);
   U53 : ex210 port map( A => n34, B => n48, Y => n50);
   U54 : iv110 port map( A => input_direction10(1), Y => n34);
   U55 : iv110 port map( A => n48, Y => new_pos_0_port);
   U56 : mu111 port map( A => old_pos(4), B => old_pos(0), S => 
                           input_direction10(0), Y => n48);

end synthesised;



