
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of counter3bit is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal count_2_port, count_1_port, count_0_port, N10, N11, n2, n4, n5 : 
      std_logic;

begin
   count <= ( count_2_port, count_1_port, count_0_port );
   
   cin_reg_0_inst : dfr11 port map( D => n2, R => reset, CK => clk, Q => 
                           count_0_port);
   cin_reg_1_inst : dfr11 port map( D => N10, R => reset, CK => clk, Q => 
                           count_1_port);
   cin_reg_2_inst : dfr11 port map( D => N11, R => reset, CK => clk, Q => 
                           count_2_port);
   U8 : iv110 port map( A => count_0_port, Y => n2);
   U9 : ex210 port map( A => n4, B => n5, Y => N11);
   U10 : na210 port map( A => count_0_port, B => count_1_port, Y => n5);
   U11 : iv110 port map( A => count_2_port, Y => n4);
   U12 : ex210 port map( A => count_1_port, B => count_0_port, Y => N10);

end synthesised;



