library ieee;
use ieee.std_logic_1164.all;

architecture beh_reg of tb_pg_reg is
component pg_hrg is 
	port(
		hit_in : in std_logic;
		hit_out : out std_logic;
		clk : in std_logic;
		reset : in std_logic
	);
end component pg_hrg;
component pg_prg is
	port(
		tank_x_in : in std_logic_vector(3 downto 0);
		tank_x_out  : out std_logic_vector(3 downto 0);
		tank_y_in : in std_logic_vector(3 downto 0);
		tank_y_out : out std_logic_vector(3 downto 0);
		tank_or_in : in std_logic_vector(1 downto 0);
		tank_or_out: out std_logic_vector(1 downto 0);
		clk : in std_logic;
		reset : in std_logic
	);
end component pg_prg;

signal clk, reset, hit_in, hit_out : std_logic;
signal tank_x_in, tank_x_out, tank_y_in, tank_y_out : std_logic_vector(3 downto 0);
signal tank_or_in, tank_or_out : std_logic_vector(1 downto 0);

begin
C00:	pg_hrg
	port map(
	hit_in => hit_in, 
	hit_out => hit_out,
	clk => clk,
	reset => reset
	);
C01:	pg_prg
	port map(
	tank_x_in => tank_x_in,
	tank_x_out => tank_x_out,
	tank_y_in => tank_y_in, 
	tank_y_out => tank_y_out,
	tank_or_in => tank_or_in,
	tank_or_out => tank_or_out,
	clk => clk,
	reset => reset
	);

S00 : clk <= 
	'1' AFTER 0 ns, 
	'0' AFTER 81.5 ns WHEN clk /= '0' ELSE '1' AFTER 81.5 ns;
S01 : tank_x_in <= "1111";
S02 : tank_y_in <= "1010";
S03 : tank_or_in <= "11";
S04 : hit_in <= '1';
S05 : reset <= 
	'1' AFTER 0 ns, 
	'0' AFTER 326 ns;
end beh_reg;





