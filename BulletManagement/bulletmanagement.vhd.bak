library IEEE;
use IEEE.std_logic_1164.all;

entity bullet_mod is
  port( bullet_clk  :   in std_logic;
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
        draw_b2     :   out std_logic);
end bullet_mod;

architecture bullet_mod_arch of bullet_mod is
  
  component reg_11
    port( clk   : in std_logic;
          reset : in std_logic;
          D     : in std_logic_vector(10 downto 0);
          Q     : out std_logic_vector(10 downto 0));
  end component;
  
  component mux_11
   port(  in_1, in_2  : in std_logic_vector(10 downto 0);
          sel         : in std_logic;
          out_vector  : out std_logic_vector(10 downto 0));
  end component;
    
  component pix
    port( x, y        : in std_logic_vector(3 downto 0);
          b           : in std_logic_vector(10 downto 0);
          draw        : out std_logic);
  end component;
   
  component newposition
    port( bullet_in   : in std_logic_vector(10 downto 0);
          bullet_out  : out std_logic_vector(10 downto 0));
  end component;
    
  component gen_bullet
    port( fire_b      : in std_logic_vector(2 downto 0);
          tank_b      : in std_logic_vector(10 downto 0);
          gen_b       : out std_logic_vector(10 downto 0));
  end component;
    
  component bullet_coll
    port( b1, b2, postmux_b1, postmux_b2  : in std_logic_vector(10 downto 0);
          coll                            : out std_logic);
  end component;
    
  component delete_bullet
    port( l_postmux, feedback, coll   : in std_logic;
          l_postdelete                : out std_logic);
  end component;
  
  signal gen_out_b1, gen_out_b2  : std_logic_vector(10 downto 0);
  signal newpos_out_b1, newpos_out_b2   : std_logic_vector (10 downto 0);
  signal postmux_b1, postmux_b2   : std_logic_vector (10 downto 0);
  
  signal new_b1, new_b2   : std_logic_vector (10 downto 0);
  signal b1, b2   : std_logic_vector (10 downto 0);
  
  signal l_b1, l_b2   : std_logic;
  
  signal coll   : std_logic;
  
  signal l_postmux_b1, l_postmux_b2   : std_logic;
  signal l_postdelete_b1, l_postdelete_b2   : std_logic;
  
  signal tank_t1, tank_t2   : std_logic_vector(10 downto 0);
  
begin
    
    b1_gen: gen_bullet port map (fire_b1, tank_t1, gen_out_b1);
    b2_gen: gen_bullet port map (fire_b2, tank_t2, gen_out_b2);
    
    b1_new: newposition port map (b1, newpos_out_b1);
    b2_new: newposition port map (b2, newpos_out_b1);
    
    mux_b1: mux_11 port map (gen_out_b1, newpos_out_b1, l_b1, postmux_b1);
    mux_b2: mux_11 port map (gen_out_b2, newpos_out_b2, l_b2, postmux_b2);
      
    reg_b1: reg_11 port map (bullet_clk, reset, new_b1, b1);
    reg_b2: reg_11 port map (bullet_clk, reset, new_b2, b2);
    
    coll_bullets: bullet_coll port map (b1, b2, postmux_b1, postmux_b2, coll);
      
    del_b1: delete_bullet port map (l_postmux_b1, feedback_b1, coll, l_postdelete_b1);
    del_b2: delete_bullet port map (l_postmux_b2, feedback_b2, coll, l_postdelete_b2);
    
    pix_b1: pix port map (x_vga, y_vga, b1, draw_b1);
    pix_b2: pix port map (x_vga, y_vga, b2, draw_b2);
    
    --Signals  
    l_b1 <= b1(10);
    l_b2 <= b2(10);
    
    l_postmux_b1 <= postmux_b1(10);
    l_postmux_b2 <= postmux_b2(10);
    
    new_b1(10) <= l_postdelete_b1;
    new_b2(10) <= l_postdelete_b2;
    
    new_b1(9 downto 0) <= postmux_b1(9 downto 0);
    new_b2(9 downto 0) <= postmux_b2(9 downto 0);
    
    --Single tank vector from multiple input vectors
    tank_t1(10)<=l_t1;
    tank_t2(10)<=l_t2;
    
    tank_t1(9 downto 6)<=x_t1;
    tank_t2(9 downto 6)<=x_t2;
    
    tank_t1(5 downto 2)<=y_t1;
    tank_t2(5 downto 2)<=y_t2;
    
    tank_t1(1 downto 0)<=dir_t1;
    tank_t2(1 downto 0)<=dir_t2;
    
end bullet_mod_arch;
