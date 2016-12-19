
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of pg_top is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component pg_fsm
      port( clk, reset : in std_logic;  update_pos : in std_logic_vector (2 
            downto 0);  tank_x_reg, tank_x_in, tank_y_reg, tank_y_in : in 
            std_logic_vector (3 downto 0);  tank_or_reg, tank_or_in : in 
            std_logic_vector (1 downto 0);  tank_y_out, tank_x_out : out 
            std_logic_vector (3 downto 0);  tank_or_out : out std_logic_vector 
            (1 downto 0));
   end component;
   
   component pg_tkc
      port( x_tank0, y_tank0, x_tank1, y_tank1, x_tank2, y_tank2, x_tank3, 
            y_tank3, x_tank4, y_tank4, x_tank5, y_tank5, x_video, y_video : in 
            std_logic_vector (3 downto 0);  intersect : out std_logic);
   end component;
   
   component pg_pxg
      port( x_in, y_in : in std_logic_vector (3 downto 0);  theta : in 
            std_logic_vector (1 downto 0);  x_head, y_head, x_left_leg, 
            y_left_leg, x_right_leg, y_right_leg, x_left_foot, y_left_foot, 
            x_right_foot, y_right_foot : out std_logic_vector (3 downto 0));
   end component;
   
   component pg_hrg
      port( hit_in : in std_logic;  hit_out : out std_logic;  clk, reset : in 
            std_logic);
   end component;
   
   component pg_prg
      port( tank_x_in : in std_logic_vector (3 downto 0);  tank_x_out : out 
            std_logic_vector (3 downto 0);  tank_y_in : in std_logic_vector (3 
            downto 0);  tank_y_out : out std_logic_vector (3 downto 0);  
            tank_or_in : in std_logic_vector (1 downto 0);  tank_or_out : out 
            std_logic_vector (1 downto 0);  clk, reset : in std_logic);
   end component;
   
   signal tank_x_out_3_port, tank_x_out_2_port, tank_x_out_1_port, 
      tank_x_out_0_port, tank_y_out_3_port, tank_y_out_2_port, 
      tank_y_out_1_port, tank_y_out_0_port, tank_or_out_1_port, 
      tank_or_out_0_port, hit_out_port, hit_intermediate, tank_x_d_3_port, 
      tank_x_d_2_port, tank_x_d_1_port, tank_x_d_0_port, tank_y_d_3_port, 
      tank_y_d_2_port, tank_y_d_1_port, tank_y_d_0_port, tank_or_d_1_port, 
      tank_or_d_0_port, x_head_3_port, x_head_2_port, x_head_1_port, 
      x_head_0_port, y_head_3_port, y_head_2_port, y_head_1_port, y_head_0_port
      , x_left_leg_3_port, x_left_leg_2_port, x_left_leg_1_port, 
      x_left_leg_0_port, y_left_leg_3_port, y_left_leg_2_port, 
      y_left_leg_1_port, y_left_leg_0_port, x_right_leg_3_port, 
      x_right_leg_2_port, x_right_leg_1_port, x_right_leg_0_port, 
      y_right_leg_3_port, y_right_leg_2_port, y_right_leg_1_port, 
      y_right_leg_0_port, x_left_foot_3_port, x_left_foot_2_port, 
      x_left_foot_1_port, x_left_foot_0_port, y_left_foot_3_port, 
      y_left_foot_2_port, y_left_foot_1_port, y_left_foot_0_port, 
      x_right_foot_3_port, x_right_foot_2_port, x_right_foot_1_port, 
      x_right_foot_0_port, y_right_foot_3_port, y_right_foot_2_port, 
      y_right_foot_1_port, y_right_foot_0_port, draw_out, n3, n4 : std_logic;

begin
   tank_x_out <= ( tank_x_out_3_port, tank_x_out_2_port, tank_x_out_1_port, 
      tank_x_out_0_port );
   tank_y_out <= ( tank_y_out_3_port, tank_y_out_2_port, tank_y_out_1_port, 
      tank_y_out_0_port );
   tank_or_out <= ( tank_or_out_1_port, tank_or_out_0_port );
   hit_out <= hit_out_port;
   
   c00 : pg_prg port map( tank_x_in(3) => tank_x_d_3_port, tank_x_in(2) => 
                           tank_x_d_2_port, tank_x_in(1) => tank_x_d_1_port, 
                           tank_x_in(0) => tank_x_d_0_port, tank_x_out(3) => 
                           tank_x_out_3_port, tank_x_out(2) => 
                           tank_x_out_2_port, tank_x_out(1) => 
                           tank_x_out_1_port, tank_x_out(0) => 
                           tank_x_out_0_port, tank_y_in(3) => tank_y_d_3_port, 
                           tank_y_in(2) => tank_y_d_2_port, tank_y_in(1) => 
                           tank_y_d_1_port, tank_y_in(0) => tank_y_d_0_port, 
                           tank_y_out(3) => tank_y_out_3_port, tank_y_out(2) =>
                           tank_y_out_2_port, tank_y_out(1) => 
                           tank_y_out_1_port, tank_y_out(0) => 
                           tank_y_out_0_port, tank_or_in(1) => tank_or_d_1_port
                           , tank_or_in(0) => tank_or_d_0_port, tank_or_out(1) 
                           => tank_or_out_1_port, tank_or_out(0) => 
                           tank_or_out_0_port, clk => clk, reset => reset);
   c01 : pg_hrg port map( hit_in => hit_intermediate, hit_out => hit_out_port, 
                           clk => clk, reset => reset);
   c02 : pg_pxg port map( x_in(3) => tank_x_out_3_port, x_in(2) => 
                           tank_x_out_2_port, x_in(1) => tank_x_out_1_port, 
                           x_in(0) => tank_x_out_0_port, y_in(3) => 
                           tank_y_out_3_port, y_in(2) => tank_y_out_2_port, 
                           y_in(1) => tank_y_out_1_port, y_in(0) => 
                           tank_y_out_0_port, theta(1) => tank_or_out_1_port, 
                           theta(0) => tank_or_out_0_port, x_head(3) => 
                           x_head_3_port, x_head(2) => x_head_2_port, x_head(1)
                           => x_head_1_port, x_head(0) => x_head_0_port, 
                           y_head(3) => y_head_3_port, y_head(2) => 
                           y_head_2_port, y_head(1) => y_head_1_port, y_head(0)
                           => y_head_0_port, x_left_leg(3) => x_left_leg_3_port
                           , x_left_leg(2) => x_left_leg_2_port, x_left_leg(1) 
                           => x_left_leg_1_port, x_left_leg(0) => 
                           x_left_leg_0_port, y_left_leg(3) => 
                           y_left_leg_3_port, y_left_leg(2) => 
                           y_left_leg_2_port, y_left_leg(1) => 
                           y_left_leg_1_port, y_left_leg(0) => 
                           y_left_leg_0_port, x_right_leg(3) => 
                           x_right_leg_3_port, x_right_leg(2) => 
                           x_right_leg_2_port, x_right_leg(1) => 
                           x_right_leg_1_port, x_right_leg(0) => 
                           x_right_leg_0_port, y_right_leg(3) => 
                           y_right_leg_3_port, y_right_leg(2) => 
                           y_right_leg_2_port, y_right_leg(1) => 
                           y_right_leg_1_port, y_right_leg(0) => 
                           y_right_leg_0_port, x_left_foot(3) => 
                           x_left_foot_3_port, x_left_foot(2) => 
                           x_left_foot_2_port, x_left_foot(1) => 
                           x_left_foot_1_port, x_left_foot(0) => 
                           x_left_foot_0_port, y_left_foot(3) => 
                           y_left_foot_3_port, y_left_foot(2) => 
                           y_left_foot_2_port, y_left_foot(1) => 
                           y_left_foot_1_port, y_left_foot(0) => 
                           y_left_foot_0_port, x_right_foot(3) => 
                           x_right_foot_3_port, x_right_foot(2) => 
                           x_right_foot_2_port, x_right_foot(1) => 
                           x_right_foot_1_port, x_right_foot(0) => 
                           x_right_foot_0_port, y_right_foot(3) => 
                           y_right_foot_3_port, y_right_foot(2) => 
                           y_right_foot_2_port, y_right_foot(1) => 
                           y_right_foot_1_port, y_right_foot(0) => 
                           y_right_foot_0_port);
   c03 : pg_tkc port map( x_tank0(3) => x_head_3_port, x_tank0(2) => 
                           x_head_2_port, x_tank0(1) => x_head_1_port, 
                           x_tank0(0) => x_head_0_port, y_tank0(3) => 
                           y_head_3_port, y_tank0(2) => y_head_2_port, 
                           y_tank0(1) => y_head_1_port, y_tank0(0) => 
                           y_head_0_port, x_tank1(3) => tank_x_d_3_port, 
                           x_tank1(2) => tank_x_d_2_port, x_tank1(1) => 
                           tank_x_d_1_port, x_tank1(0) => tank_x_d_0_port, 
                           y_tank1(3) => tank_y_d_3_port, y_tank1(2) => 
                           tank_y_d_2_port, y_tank1(1) => tank_y_d_1_port, 
                           y_tank1(0) => tank_y_d_0_port, x_tank2(3) => 
                           x_left_leg_3_port, x_tank2(2) => x_left_leg_2_port, 
                           x_tank2(1) => x_left_leg_1_port, x_tank2(0) => 
                           x_left_leg_0_port, y_tank2(3) => y_left_leg_3_port, 
                           y_tank2(2) => y_left_leg_2_port, y_tank2(1) => 
                           y_left_leg_1_port, y_tank2(0) => y_left_leg_0_port, 
                           x_tank3(3) => x_right_leg_3_port, x_tank3(2) => 
                           x_right_leg_2_port, x_tank3(1) => x_right_leg_1_port
                           , x_tank3(0) => x_right_leg_0_port, y_tank3(3) => 
                           y_right_leg_3_port, y_tank3(2) => y_right_leg_2_port
                           , y_tank3(1) => y_right_leg_1_port, y_tank3(0) => 
                           y_right_leg_0_port, x_tank4(3) => x_left_foot_3_port
                           , x_tank4(2) => x_left_foot_2_port, x_tank4(1) => 
                           x_left_foot_1_port, x_tank4(0) => x_left_foot_0_port
                           , y_tank4(3) => y_left_foot_3_port, y_tank4(2) => 
                           y_left_foot_2_port, y_tank4(1) => y_left_foot_1_port
                           , y_tank4(0) => y_left_foot_0_port, x_tank5(3) => 
                           x_right_foot_3_port, x_tank5(2) => 
                           x_right_foot_2_port, x_tank5(1) => 
                           x_right_foot_1_port, x_tank5(0) => 
                           x_right_foot_0_port, y_tank5(3) => 
                           y_right_foot_3_port, y_tank5(2) => 
                           y_right_foot_2_port, y_tank5(1) => 
                           y_right_foot_1_port, y_tank5(0) => 
                           y_right_foot_0_port, x_video(3) => screen_x_in(3), 
                           x_video(2) => screen_x_in(2), x_video(1) => 
                           screen_x_in(1), x_video(0) => screen_x_in(0), 
                           y_video(3) => screen_y_in(3), y_video(2) => 
                           screen_y_in(2), y_video(1) => screen_y_in(1), 
                           y_video(0) => screen_y_in(0), intersect => draw_out)
                           ;
   c04 : pg_fsm port map( clk => clk, reset => reset, update_pos(2) => 
                           update_pos(2), update_pos(1) => update_pos(1), 
                           update_pos(0) => update_pos(0), tank_x_reg(3) => 
                           tank_x_out_3_port, tank_x_reg(2) => 
                           tank_x_out_2_port, tank_x_reg(1) => 
                           tank_x_out_1_port, tank_x_reg(0) => 
                           tank_x_out_0_port, tank_x_in(3) => tank_x_in(3), 
                           tank_x_in(2) => tank_x_in(2), tank_x_in(1) => 
                           tank_x_in(1), tank_x_in(0) => tank_x_in(0), 
                           tank_y_reg(3) => tank_y_out_3_port, tank_y_reg(2) =>
                           tank_y_out_2_port, tank_y_reg(1) => 
                           tank_y_out_1_port, tank_y_reg(0) => 
                           tank_y_out_0_port, tank_y_in(3) => tank_y_in(3), 
                           tank_y_in(2) => tank_y_in(2), tank_y_in(1) => 
                           tank_y_in(1), tank_y_in(0) => tank_y_in(0), 
                           tank_or_reg(1) => tank_or_out_1_port, tank_or_reg(0)
                           => tank_or_out_0_port, tank_or_in(1) => 
                           tank_or_in(1), tank_or_in(0) => tank_or_in(0), 
                           tank_y_out(3) => tank_y_d_3_port, tank_y_out(2) => 
                           tank_y_d_2_port, tank_y_out(1) => tank_y_d_1_port, 
                           tank_y_out(0) => tank_y_d_0_port, tank_x_out(3) => 
                           tank_x_d_3_port, tank_x_out(2) => tank_x_d_2_port, 
                           tank_x_out(1) => tank_x_d_1_port, tank_x_out(0) => 
                           tank_x_d_0_port, tank_or_out(1) => tank_or_d_1_port,
                           tank_or_out(0) => tank_or_d_0_port);
   U5 : iv110 port map( A => n3, Y => hit_intermediate);
   U6 : no210 port map( A => hit_out_port, B => hit_in, Y => n3);
   U7 : no210 port map( A => hit_out_port, B => n4, Y => draw);
   U8 : iv110 port map( A => draw_out, Y => n4);

end synthesised;



