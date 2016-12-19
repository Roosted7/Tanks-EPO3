
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of pg_prg is

   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6 : std_logic;

begin
   
   or_in_reg_reg_1_inst : dfn10 port map( D => n6, CK => clk, Q => 
                           tank_or_out(1));
   or_in_reg_reg_0_inst : dfr11 port map( D => tank_or_in(0), R => reset, CK =>
                           clk, Q => tank_or_out(0));
   x_in_reg_reg_3_inst : dfr11 port map( D => tank_x_in(3), R => reset, CK => 
                           clk, Q => tank_x_out(3));
   x_in_reg_reg_2_inst : dfr11 port map( D => tank_x_in(2), R => reset, CK => 
                           clk, Q => tank_x_out(2));
   x_in_reg_reg_1_inst : dfr11 port map( D => tank_x_in(1), R => reset, CK => 
                           clk, Q => tank_x_out(1));
   x_in_reg_reg_0_inst : dfn10 port map( D => n4, CK => clk, Q => tank_x_out(0)
                           );
   y_in_reg_reg_3_inst : dfr11 port map( D => tank_y_in(3), R => reset, CK => 
                           clk, Q => tank_y_out(3));
   y_in_reg_reg_2_inst : dfr11 port map( D => tank_y_in(2), R => reset, CK => 
                           clk, Q => tank_y_out(2));
   y_in_reg_reg_1_inst : dfr11 port map( D => tank_y_in(1), R => reset, CK => 
                           clk, Q => tank_y_out(1));
   y_in_reg_reg_0_inst : dfn10 port map( D => n2, CK => clk, Q => tank_y_out(0)
                           );
   U3 : iv110 port map( A => n1, Y => n2);
   U4 : no210 port map( A => reset, B => tank_y_in(0), Y => n1);
   U5 : iv110 port map( A => n3, Y => n4);
   U6 : no210 port map( A => reset, B => tank_x_in(0), Y => n3);
   U7 : iv110 port map( A => n5, Y => n6);
   U8 : no210 port map( A => reset, B => tank_or_in(1), Y => n5);

end synthesised;



