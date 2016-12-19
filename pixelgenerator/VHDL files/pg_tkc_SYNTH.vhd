
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of pg_tkc is

   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component pg_pxc
      port( x_tank, y_tank, x_video, y_video : in std_logic_vector (3 downto 0)
            ;  intersect : out std_logic);
   end component;
   
   signal intersections_5_port, intersections_4_port, intersections_3_port, 
      intersections_2_port, intersections_1_port, intersections_0_port, n3, n4 
      : std_logic;

begin
   
   l0 : pg_pxc port map( x_tank(3) => x_tank0(3), x_tank(2) => x_tank0(2), 
                           x_tank(1) => x_tank0(1), x_tank(0) => x_tank0(0), 
                           y_tank(3) => y_tank0(3), y_tank(2) => y_tank0(2), 
                           y_tank(1) => y_tank0(1), y_tank(0) => y_tank0(0), 
                           x_video(3) => x_video(3), x_video(2) => x_video(2), 
                           x_video(1) => x_video(1), x_video(0) => x_video(0), 
                           y_video(3) => y_video(3), y_video(2) => y_video(2), 
                           y_video(1) => y_video(1), y_video(0) => y_video(0), 
                           intersect => intersections_0_port);
   l1 : pg_pxc port map( x_tank(3) => x_tank1(3), x_tank(2) => x_tank1(2), 
                           x_tank(1) => x_tank1(1), x_tank(0) => x_tank1(0), 
                           y_tank(3) => y_tank1(3), y_tank(2) => y_tank1(2), 
                           y_tank(1) => y_tank1(1), y_tank(0) => y_tank1(0), 
                           x_video(3) => x_video(3), x_video(2) => x_video(2), 
                           x_video(1) => x_video(1), x_video(0) => x_video(0), 
                           y_video(3) => y_video(3), y_video(2) => y_video(2), 
                           y_video(1) => y_video(1), y_video(0) => y_video(0), 
                           intersect => intersections_1_port);
   l2 : pg_pxc port map( x_tank(3) => x_tank2(3), x_tank(2) => x_tank2(2), 
                           x_tank(1) => x_tank2(1), x_tank(0) => x_tank2(0), 
                           y_tank(3) => y_tank2(3), y_tank(2) => y_tank2(2), 
                           y_tank(1) => y_tank2(1), y_tank(0) => y_tank2(0), 
                           x_video(3) => x_video(3), x_video(2) => x_video(2), 
                           x_video(1) => x_video(1), x_video(0) => x_video(0), 
                           y_video(3) => y_video(3), y_video(2) => y_video(2), 
                           y_video(1) => y_video(1), y_video(0) => y_video(0), 
                           intersect => intersections_2_port);
   l3 : pg_pxc port map( x_tank(3) => x_tank3(3), x_tank(2) => x_tank3(2), 
                           x_tank(1) => x_tank3(1), x_tank(0) => x_tank3(0), 
                           y_tank(3) => y_tank3(3), y_tank(2) => y_tank3(2), 
                           y_tank(1) => y_tank3(1), y_tank(0) => y_tank3(0), 
                           x_video(3) => x_video(3), x_video(2) => x_video(2), 
                           x_video(1) => x_video(1), x_video(0) => x_video(0), 
                           y_video(3) => y_video(3), y_video(2) => y_video(2), 
                           y_video(1) => y_video(1), y_video(0) => y_video(0), 
                           intersect => intersections_3_port);
   l4 : pg_pxc port map( x_tank(3) => x_tank4(3), x_tank(2) => x_tank4(2), 
                           x_tank(1) => x_tank4(1), x_tank(0) => x_tank4(0), 
                           y_tank(3) => y_tank4(3), y_tank(2) => y_tank4(2), 
                           y_tank(1) => y_tank4(1), y_tank(0) => y_tank4(0), 
                           x_video(3) => x_video(3), x_video(2) => x_video(2), 
                           x_video(1) => x_video(1), x_video(0) => x_video(0), 
                           y_video(3) => y_video(3), y_video(2) => y_video(2), 
                           y_video(1) => y_video(1), y_video(0) => y_video(0), 
                           intersect => intersections_4_port);
   l5 : pg_pxc port map( x_tank(3) => x_tank5(3), x_tank(2) => x_tank5(2), 
                           x_tank(1) => x_tank5(1), x_tank(0) => x_tank5(0), 
                           y_tank(3) => y_tank5(3), y_tank(2) => y_tank5(2), 
                           y_tank(1) => y_tank5(1), y_tank(0) => y_tank5(0), 
                           x_video(3) => x_video(3), x_video(2) => x_video(2), 
                           x_video(1) => x_video(1), x_video(0) => x_video(0), 
                           y_video(3) => y_video(3), y_video(2) => y_video(2), 
                           y_video(1) => y_video(1), y_video(0) => y_video(0), 
                           intersect => intersections_5_port);
   U4 : na210 port map( A => n3, B => n4, Y => intersect);
   U5 : no310 port map( A => intersections_3_port, B => intersections_5_port, C
                           => intersections_4_port, Y => n4);
   U6 : no310 port map( A => intersections_0_port, B => intersections_2_port, C
                           => intersections_1_port, Y => n3);

end synthesised;



