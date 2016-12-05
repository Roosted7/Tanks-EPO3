
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of input_system is

   component input_fsm
      port( tf_rise, clk, reset : in std_logic;  dec_in : in std_logic_vector 
            (2 downto 0);  enable : out std_logic_vector (1 downto 0));
   end component;
   
   component register_logic
      port( enable : in std_logic_vector (1 downto 0);  reg_in, enc_in : in 
            std_logic_vector (2 downto 0);  output : out std_logic_vector (2 
            downto 0));
   end component;
   
   component input_register
      port( input : in std_logic_vector (2 downto 0);  clk, reset : in 
            std_logic;  output : out std_logic_vector (2 downto 0));
   end component;
   
   component tf_rise
      port( tf_in, reset, clk : in std_logic;  tf_rise : out std_logic);
   end component;
   
   component encoder
      port( p_l, p_r, p_u, p_d, p_f : in std_logic;  t_e : out std_logic_vector
            (2 downto 0));
   end component;
   
   signal t_e_2_port, t_e_1_port, t_e_0_port, t_e_enc_2_port, t_e_enc_1_port, 
      t_e_enc_0_port, tf, t_e_logic_2_port, t_e_logic_1_port, t_e_logic_0_port,
      enable_1_port, enable_0_port : std_logic;

begin
   t_e <= ( t_e_2_port, t_e_1_port, t_e_0_port );
   
   lbl1 : encoder port map( p_l => p_l, p_r => p_r, p_u => p_u, p_d => p_d, p_f
                           => p_f, t_e(2) => t_e_enc_2_port, t_e(1) => 
                           t_e_enc_1_port, t_e(0) => t_e_enc_0_port);
   lbl2 : tf_rise port map( tf_in => frame, reset => reset, clk => clk, tf_rise
                           => tf);
   lbl3 : input_register port map( input(2) => t_e_logic_2_port, input(1) => 
                           t_e_logic_1_port, input(0) => t_e_logic_0_port, clk 
                           => clk, reset => reset, output(2) => t_e_2_port, 
                           output(1) => t_e_1_port, output(0) => t_e_0_port);
   lbl4 : register_logic port map( enable(1) => enable_1_port, enable(0) => 
                           enable_0_port, reg_in(2) => t_e_2_port, reg_in(1) =>
                           t_e_1_port, reg_in(0) => t_e_0_port, enc_in(2) => 
                           t_e_enc_2_port, enc_in(1) => t_e_enc_1_port, 
                           enc_in(0) => t_e_enc_0_port, output(2) => 
                           t_e_logic_2_port, output(1) => t_e_logic_1_port, 
                           output(0) => t_e_logic_0_port);
   lbl5 : input_fsm port map( tf_rise => tf, clk => clk, reset => reset, 
                           dec_in(2) => t_e_enc_2_port, dec_in(1) => 
                           t_e_enc_1_port, dec_in(0) => t_e_enc_0_port, 
                           enable(1) => enable_1_port, enable(0) => 
                           enable_0_port);

end synthesised;



