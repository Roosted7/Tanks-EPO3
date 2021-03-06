library IEEE;
use IEEE.std_logic_1164.all;

entity bullet_mod_tb is
end bullet_mod_tb;

architecture bullet_mod_tb_arch of bullet_mod_tb is
  
  component bullet_mod
   port(  bullet_clk  :   in std_logic;
          reset       :   in std_logic;
  
          fire_b1     :   in std_logic_vector(2 downto 0);
          l_t1        :   in std_logic;
          x_t1        :   in std_logic_vector(3 downto 0);
          y_t1        :   in std_logic_vector(3 downto 0);
          dir_t1      :   in std_logic_vector(1 downto 0);
        
          fire_b2     :   in std_logic_vector(2 downto 0);
          l_t2        :   in std_logic;
          x_t2        :   in std_logic_vector(3 downto 0);
          y_t2        :   in std_logic_vector(3 downto 0);
          dir_t2      :   in std_logic_vector(1 downto 0);
        
          x_vga       :   in std_logic_vector(3 downto 0);
          y_vga       :   in std_logic_vector(3 downto 0);
        
          feedback_b1 :   in std_logic;
          feedback_b2 :   in std_logic;
        
          draw_b1     :   out std_logic;
          draw_b2     :   out std_logic
	);
  end component;

  signal  bullet_clk  :   std_logic := '0';
  signal  reset       :   std_logic;
    
  signal  fire_b1     :   std_logic_vector(2 downto 0);
  signal  l_t1        :   std_logic;
  signal  x_t1        :   std_logic_vector(3 downto 0);
  signal  y_t1        :   std_logic_vector(3 downto 0);
  signal  dir_t1      :   std_logic_vector(1 downto 0);
          
  signal  fire_b2     :   std_logic_vector(2 downto 0);
  signal  l_t2        :   std_logic;
  signal  x_t2        :   std_logic_vector(3 downto 0);
  signal  y_t2        :   std_logic_vector(3 downto 0);
  signal  dir_t2      :   std_logic_vector(1 downto 0);
          
  signal  x_vga       :   std_logic_vector(3 downto 0);
  signal  y_vga       :   std_logic_vector(3 downto 0);
        
  signal  feedback_b1 :   std_logic;
  signal  feedback_b2 :   std_logic;
        
  signal  draw_b1     :   std_logic;
  signal  draw_b2     :   std_logic;
  
begin

  lbl1: bullet_mod  port map (	bullet_clk,
				reset,
				fire_b1,
				l_t1,
	          		x_t1,
	          		y_t1,
	          		dir_t1,
	          		fire_b2,
	          		l_t2,
	          		x_t2,
	          		y_t2,
	          		dir_t2,
	          		x_vga,
	          		y_vga,
	          		feedback_b1,
	          		feedback_b2,
	          		draw_b1,
	          		draw_b2);

  bullet_clk 	<= 	not bullet_clk after 5 ns;
  reset		<= 	'1' after 0 ns,
			'0' after 20 ns,
			'1' after 550 ns;

  fire_b1	<=	"000" after 0 ns,
			"101" after 50 ns,
			"000" after 150 ns,
			"101" after 200 ns,
			"000" after 250 ns;
  l_t1		<=	'1' after 0 ns;
  x_t1		<=	"1110" after 0 ns;
  y_t1		<=	"0001" after 0 ns;
  dir_t1	<=	"00" after 0 ns;
  
  fire_b2	<=	"000" after 0 ns,
			"101" after 200 ns,
			"000" after 250 ns,
			"101" after 300 ns,
			"000" after 335 ns;
  l_t2		<=	'1' after 0 ns;
  x_t2		<=	"0001" after 0 ns;
  y_t2		<=	"1110" after 0 ns;
  dir_t2	<=	"01" after 0 ns;

  x_vga		<=	"0000" after 0 ns,
			"0001" after 50 ns;
  y_vga		<=	"0000" after 0 ns,
			"0001" after 50 ns;

  feedback_b1	<=	'1' after 0 ns,
			'0' after 100 ns,
			'1' after 150 ns;
  feedback_b2	<=	'1' after 0 ns;
    
end bullet_mod_tb_arch;









