
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of register1bit is

   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2 : std_logic;

begin
   
   Q_reg : dfn10 port map( D => n2, CK => clk, Q => Q);
   U3 : iv110 port map( A => n1, Y => n2);
   U4 : no210 port map( A => reset, B => D, Y => n1);

end synthesised;



