library IEEE;
use IEEE.std_logic_1164.ALL;

entity top_vgascreen is
   port(reset   :in    std_logic;
	exist_t1:in    std_logic;
        exist_t2:in    std_logic;
        fire_t1 :in    std_logic;
        fire_t2 :in    std_logic;
        clk     :in    std_logic;
        rgb     :in    std_logic_vector(2 downto 0);
	r,g,b	:out	std_logic; 
	frame, bullet 	:out	std_logic; 
	hsync, vsync	:out	std_logic; 
	collision	:out	std_logic); 
 	
end top_vgascreen;


