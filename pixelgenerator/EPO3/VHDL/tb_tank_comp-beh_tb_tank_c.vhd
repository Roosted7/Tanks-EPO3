library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture beh_tb_tank_c of tb_tank_comp is

	component tank_comp is
		port (  x_tank0		: in std_logic_vector (3 downto 0);
			y_tank0		: in std_logic_vector (3 downto 0);
			x_tank1		: in std_logic_vector (3 downto 0);
			y_tank1		: in std_logic_vector (3 downto 0);
			x_tank2		: in std_logic_vector (3 downto 0);
			y_tank2		: in std_logic_vector (3 downto 0);
			x_tank3		: in std_logic_vector (3 downto 0);
			y_tank3		: in std_logic_vector (3 downto 0);
			x_tank4		: in std_logic_vector (3 downto 0);
			y_tank4		: in std_logic_vector (3 downto 0);
			x_tank5		: in std_logic_vector (3 downto 0);
			y_tank5		: in std_logic_vector (3 downto 0);
			x_video		: in std_logic_vector (3 downto 0);
			y_video		: in std_logic_vector (3 downto 0);
			intersect	: out std_logic
		);
	end component;

	signal x_tank0, y_tank0, x_tank1, y_tank1, x_tank2, y_tank2,
	 x_tank3, y_tank3, x_tank4, y_tank4, x_tank5, y_tank5,
	 x_video, y_video : std_logic_vector (3 downto 0);
	signal intersect  : std_logic;

begin

l1:	tank_comp port map (x_tank0, y_tank0, x_tank1, y_tank1, 
	 x_tank2, y_tank2, x_tank3, y_tank3, x_tank4, y_tank4,
	 x_tank5, y_tank5, x_video, y_video, intersect);

	y_video <= "0000" after 0 ns, 
		std_logic_vector(unsigned(y_video) +1) after 1048576 ns 
		when y_video /= "1111" else "0000" after 1048576 ns;
	x_video <= "0000" after 0 ns, 
		std_logic_vector(unsigned(x_video) +1) after 65536 ns 
		when x_video /= "1111" else "0000" after 65536 ns;

	y_tank5	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(y_tank5) +1) after 17000000 ns 
		when y_tank5 /= "1111" else "0000" after 17000000 ns;
	x_tank5	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(x_tank5) +1) after 17000000 ns 
		when x_tank5 /= "1111" else "0000" after 17000000 ns;
	y_tank4	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(y_tank4) +1) after 17000000 ns 
		when y_tank4 /= "1111" else "0000" after 17000000 ns;
	x_tank4	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(x_tank4) +1) after 17000000 ns 
		when x_tank4 /= "1111" else "0000" after 17000000 ns;
	y_tank3	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(y_tank3) +1) after 17000000 ns 
		when y_tank3 /= "1111" else "0000" after 17000000 ns;
	x_tank3	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(x_tank3) +1) after 17000000 ns 
		when x_tank3 /= "1111" else "0000" after 17000000 ns;
	y_tank2	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(y_tank2) +1) after 1048576 ns 
		when y_tank2 /= "1111" else "0000" after 1048576 ns;
	x_tank2	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(x_tank2) +1) after 65536 ns 
		when x_tank2 /= "1111" else "0000" after 65536 ns;
	y_tank1	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(y_tank1) +1) after 4096 ns 
		when y_tank1 /= "1111" else "0000" after 4096 ns;
	x_tank1	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(x_tank1) +1) after 256 ns 
		when x_tank1 /= "1111" else "0000" after 256 ns;
	y_tank0	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(y_tank0) +1) after 16 ns 
		when y_tank0 /= "1111" else "0000" after 16 ns;
	x_tank0	<= "0000" after 0 ns, 
		std_logic_vector(unsigned(x_tank0) +1) after 1 ns 
		when x_tank0 /= "1111" else "0000" after 1 ns;
end architecture;

