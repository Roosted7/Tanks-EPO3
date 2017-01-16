library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of top_vgascreen is

component vga_out is
	port(
		clk, reset:			in  std_logic;
		rgb: 				in  std_logic_vector(2 downto 0);
		r, g, b:			out std_logic;
		frame, bullet:		out std_logic;
		hsync, vsync: 		out std_logic;
		x, y:				out std_logic_vector(3 downto 0);
		collision:			out std_logic);
end component;

component toplvl_screen is
   port(reset   :in    std_logic;
        exist_t1:in    std_logic;
        exist_t2:in    std_logic;
        fire_t1 :in    std_logic;
        fire_t2 :in    std_logic;
        clk     :in    std_logic;
        rgb     :in    std_logic_vector(2 downto 0);
	x	:in	std_logic_vector(3 downto 0);
	y	:in	std_logic_vector(3 downto 0); 
	rgb_out	:out	std_logic_vector(2 downto 0));
end component;

signal x, y : std_logic_vector(3 downto 0); 
signal rgb_out : std_logic_vector(2 downto 0); 

begin

vga : vga_out port map( clk => clk, reset => reset, rgb => rgb_out, r => r, g => g, b => b, frame => frame, bullet => bullet, hsync => hsync, vsync => vsync, x => x, y => y, collision => collision); 
toplvl_game : toplvl_screen port map(reset => reset, exist_t1 => exist_t1, exist_t2 => exist_t2, fire_t1 => fire_t1, fire_t2 => fire_t2, clk => clk, rgb => rgb, x => x, y => y, rgb_out => rgb_out); 


end behaviour;


