
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tf_rise is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal tf, n2 : std_logic;

begin
   
   tf_reg : dfa11 port map( D => tf_in, CK => clk, R => reset, Q => tf);
   U5 : no210 port map( A => tf, B => n2, Y => tf_rise);
   U6 : iv110 port map( A => tf_in, Y => n2);

end synthesised;



