
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of input_fsm is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal enable_0_port, state_1_port, state_0_port, new_state_1_port, n1, 
      enable_1_port, n12, n13, n14, n15, n16, n17, n18 : std_logic;

begin
   enable <= ( enable_1_port, enable_0_port );
   
   state_reg_0_inst : dfa11 port map( D => n1, CK => clk, R => reset, Q => 
                           state_0_port);
   state_reg_1_inst : dfa11 port map( D => new_state_1_port, CK => clk, R => 
                           reset, Q => state_1_port);
   U16 : na210 port map( A => n12, B => n13, Y => new_state_1_port);
   U17 : na210 port map( A => enable_0_port, B => n14, Y => n13);
   U18 : no310 port map( A => n14, B => state_1_port, C => n15, Y => n1);
   U19 : no210 port map( A => n16, B => n17, Y => n15);
   U20 : na210 port map( A => n18, B => dec_in(2), Y => n14);
   U21 : no210 port map( A => dec_in(1), B => dec_in(0), Y => n18);
   U22 : iv110 port map( A => n12, Y => enable_1_port);
   U23 : na310 port map( A => n16, B => n17, C => state_1_port, Y => n12);
   U24 : iv110 port map( A => tf_rise, Y => n17);
   U25 : no310 port map( A => state_1_port, B => tf_rise, C => n16, Y => 
                           enable_0_port);
   U26 : iv110 port map( A => state_0_port, Y => n16);

end synthesised;



