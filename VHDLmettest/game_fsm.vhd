library IEEE;
use IEEE.std_logic_1164.ALL;

entity game_fsm is
   port(x       :in    std_logic_vector(3 downto 0);
        y       :in    std_logic_vector(3 downto 0);
        fire_t1 :in    std_logic;
        fire_t2 :in    std_logic;
	rgb	:in	std_logic_vector(2 downto 0); 
        exist_t1:in    std_logic;
        exist_t2:in    std_logic;
	clk	:in	std_logic; 
	draw_endscreen, draw_startscreen : in std_logic; 
	reset :in    std_logic;
        rgb_out    :out   std_logic_vector(2 downto 0);
		  idle		:out std_logic);
end game_fsm;



















