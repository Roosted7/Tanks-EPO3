
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of pg_fsm is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal state, n23, n24, n25, n26 : std_logic;

begin
   
   state_reg : dfr11 port map( D => n23, R => reset, CK => clk, Q => state);
   U35 : iv110 port map( A => state, Y => n24);
   U36 : iv110 port map( A => n24, Y => n25);
   U37 : mu111 port map( A => tank_y_reg(3), B => tank_y_in(3), S => state, Y 
                           => tank_y_out(3));
   U38 : mu111 port map( A => tank_y_reg(2), B => tank_y_in(2), S => state, Y 
                           => tank_y_out(2));
   U39 : mu111 port map( A => tank_y_reg(1), B => tank_y_in(1), S => state, Y 
                           => tank_y_out(1));
   U40 : mu111 port map( A => tank_y_reg(0), B => tank_y_in(0), S => state, Y 
                           => tank_y_out(0));
   U41 : mu111 port map( A => tank_x_reg(3), B => tank_x_in(3), S => state, Y 
                           => tank_x_out(3));
   U42 : mu111 port map( A => tank_x_reg(2), B => tank_x_in(2), S => state, Y 
                           => tank_x_out(2));
   U43 : mu111 port map( A => tank_x_reg(1), B => tank_x_in(1), S => state, Y 
                           => tank_x_out(1));
   U44 : mu111 port map( A => tank_x_reg(0), B => tank_x_in(0), S => n25, Y => 
                           tank_x_out(0));
   U45 : mu111 port map( A => tank_or_reg(1), B => tank_or_in(1), S => n25, Y 
                           => tank_or_out(1));
   U46 : mu111 port map( A => tank_or_reg(0), B => tank_or_in(0), S => n25, Y 
                           => tank_or_out(0));
   U47 : no310 port map( A => n26, B => update_pos(1), C => n25, Y => n23);
   U48 : na210 port map( A => update_pos(2), B => update_pos(0), Y => n26);

end synthesised;



