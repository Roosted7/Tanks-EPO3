library IEEE;
use IEEE.std_logic_1164.all;

entity bullet_mod_tb is
end bullet_mod_tb;

architecture bullet_mod_tb_arch of bullet_mod_tb is
  
  component 
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
          reset       :   std_logic;
    
          fire_b1     :   std_logic_vector(2 downto 0);
          l_t1        :   std_logic;
          x_t1        :   std_logic_vector(3 downto 0);
          y_t1        :   std_logic_vector(3 downto 0);
          dir_t1      :   std_logic_vector(1 downto 0);
          
          fire_b2     :   std_logic_vector(2 downto 0);
          l_t2        :   std_logic;
          x_t2        :   std_logic_vector(3 downto 0);
          y_t2        :   std_logic_vector(3 downto 0);
          dir_t2      :   std_logic_vector(1 downto 0);
          
          x_vga       :   std_logic_vector(3 downto 0);
          y_vga       :   std_logic_vector(3 downto 0);
        
          feedback_b1 :   std_logic;
          feedback_b2 :   std_logic;
        
          draw_b1     :   std_logic;
          draw_b2     :   std_logic;
  
begin

  bullet_module port map (	bullet_clk,
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

  bullet_clk <= not bullet_clk after 5 ns;
    
end bullet_mod_arch;