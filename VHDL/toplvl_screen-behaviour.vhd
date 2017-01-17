library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of toplvl_screen is

component end_map is
   port(x  :in    std_logic_vector(3 downto 0);
        y  :in    std_logic_vector(3 downto 0);
        exist_t1 :in    std_logic;
	draw_end:out	 std_logic);
end component;

component game_fsm is
   port(x       :in    std_logic_vector(3 downto 0);
        y       :in    std_logic_vector(3 downto 0);
        fire_t1 :in    std_logic;
        fire_t2 :in    std_logic;
	rgb	:in	std_logic_vector(2 downto 0); 
        exist_t1:in    std_logic;
	draw_endscreen:in  		std_logic; 
	draw_startscreen:in		std_logic; 
        exist_t2:in    std_logic;
	clk	:in	std_logic; 
	reset :in    std_logic;
        rgb_out    :out   std_logic_vector(2 downto 0);
		  idle		 :out	  std_logic);
end component;

component start_map is
   port(x   :in    std_logic_vector(3 downto 0);
        y   :in    std_logic_vector(3 downto 0);
        draw_start	:out   std_logic);
end component;

signal draw_end, draw_start : std_logic;


begin

start_screen : start_map port map(
		x => x, 
		y => y,
		draw_start => draw_start); 

end_screen : end_map port map(
		x => x,
		y => y,
		draw_end => draw_end, 
		exist_t1 => exist_t1);

gamefsm : game_fsm port map( 
		x   => x, 
       		y   => y, 
        		fire_t1 => fire_t1, 
        		fire_t2 => fire_t2, 
		rgb => rgb,  
        		exist_t1 => exist_t1, 
		draw_endscreen => draw_end,
		draw_startscreen => draw_start,
        		exist_t2 => exist_t2, 
		clk => clk, 
		reset => reset, 
       		rgb_out => rgb_out,
				idle => idle);  
end behaviour;








