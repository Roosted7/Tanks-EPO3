library IEEE;
use IEEE.std_logic_1164.ALL;

architecture beh_top of tb_pg_top is
component pg_top is
port (
	tank_x_in 	: in std_logic_vector(3 downto 0);
	tank_y_in 	: in std_logic_vector(3 downto 0);
	tank_or_in 	: in std_logic_vector(1 downto 0);
	hit_in		: in std_logic;
	tank_x_out  	: out std_logic_vector(3 downto 0);
	tank_y_out 	: out std_logic_vector(3 downto 0);
	tank_or_out	: out std_logic_vector(1 downto 0);
	hit_out 	: out std_logic;
	screen_x_in 	: in std_logic_vector(3 downto 0);
	screen_y_in 	: in std_logic_vector(3 downto 0);
	update_pos 	: in std_logic_vector(2 downto 0);
	clk		: in std_logic;
	draw 		: out std_logic;
	reset		: in std_logic
);
end component pg_top;

-- Internal signals for the testbench
signal tank_x_in, tank_y_in, tank_x_out, tank_y_out, screen_x_in, screen_y_in : std_logic_vector(3 downto 0);
signal tank_or_in, tank_or_out : std_logic_vector(1 downto 0);
signal hit_in, hit_out, clk, draw, reset : std_logic;
signal update_pos : std_logic_vector(2 downto 0);

begin
	
S00 : clk <= 	
	'1' after 0 ns, 
	'0' after 81.5 ns when clk /= '0' else '1' after 81.5 ns;
S01 : update_pos <= 
	"000" after 0 ns,
	"101" after 150 ms when update_pos /= "101" else "000" after 1.8 ms;
S02 : tank_x_in <= 
	"1000"  after 0 ns;
	--"1010"  after 100000 ns;
S03 : tank_y_in <= 
	"1000"  after 0 ns;
	--"1010"  after 10000 ns;
S04 : tank_or_in <=
	"00" 	after 0 ns,
	"00"	after 1 ns;
S05 : hit_in <=
	'0'  after 0 ns,
	'1'  after 120 ms,
	'0'  after 121 ms;
S06 : screen_x_in <=
	"0000"	after 0 ns,
	"0001"	after 16.66667 ms,
	"0010"	after 16.66667*2 ms,
	"0011"	after 16.66667*3 ms,
	"0000"	after 16.66667*4 ms,
	"0001"	after 16.66667*5 ms,
	"0010"	after 16.66667*6 ms,
	"0011"	after 16.66667*7 ms,
	"0000"	after 16.66667*8 ms,
	"0001"	after 16.66667*9 ms,
	"0010"	after 16.66667*10 ms,
	"0011"	after 16.66667*11 ms;
S07 : screen_y_in <=
	"0000"	after 0 ns,
	"0001"	after 16.66667*4 ms,
	"0010"	after 16.66667*8 ms;
S08 : reset <=
	'1' after 0 ns,
	'0' after 200 ns;
C00 : pg_top port map (
	tank_x_in => tank_x_in,
	tank_y_in => tank_y_in,
	tank_or_in => tank_or_in,
	hit_in => hit_in,
	tank_x_out => tank_x_out,
	tank_y_out => tank_y_out,
	tank_or_out => tank_or_out,
	hit_out => hit_out,
	screen_x_in => screen_x_in,
	screen_y_in => screen_y_in,
	update_pos => update_pos,
	clk => clk,
	draw => draw,
	reset => reset
	);
	
end beh_top;





































