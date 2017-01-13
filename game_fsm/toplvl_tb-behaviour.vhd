library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of toplvl_tb is

component toplvl_screen is
   port(reset   :in    std_logic;
        x       :in    std_logic_vector(3 downto 0);
        y       :in    std_logic_vector(3 downto 0);
        exist_t1:in    std_logic;
        exist_t2:in    std_logic;
        fire_t1 :in    std_logic;
        fire_t2 :in    std_logic;
        clk     :in    std_logic;
        rgb     :in    std_logic_vector(2 downto 0);
        rgb_out :out   std_logic_vector(2 downto 0);
	idle	:out	std_logic);
end component;

signal reset, exist_t1, exist_t2, fire_t1, fire_t2, clk, idle: std_logic; 
signal x, y : std_logic_vector(3 downto 0); 
signal rgb, rgb_out : std_logic_vector(2 downto 0); 

begin

lbl1: toplvl_screen port map(reset, x, y, exist_t1, exist_t2, fire_t1, fire_t2, clk, rgb, rgb_out, idle); 

clk <= '0' after 0 ns, 
	'1' after 10 ns when clk /= '1' else '0' after 10 ns; 

x <= "0011" after 0 ns;
y <= "1100" after 0 ns; 

exist_t1 <= '1' after 0 ns, 
		'0' after 120 ns; 
exist_t2 <= '1' after 0 ns; 

fire_t1 <= '0' after 0 ns, 
		'1' after 40 ns,
		'0' after 70 ns;
fire_t2 <= '0' after 0 ns, 
		'1' after 50 ns,
		'0' after 70 ns; 

rgb <= "011" after 0 ns; 

reset <= '0' after 0 ns, 
		'1' after 180 ns; 


end behaviour;





