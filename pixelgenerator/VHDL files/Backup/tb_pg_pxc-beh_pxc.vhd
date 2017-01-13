library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture beh_pxc of tb_pg_pxc is

	component pg_pxc is
		port ( 	x_tank 		: in std_logic_vector (3 downto 0);
		       	y_tank		: in std_logic_vector (3 downto 0);
			x_video		: in std_logic_vector (3 downto 0);
			y_video		: in std_logic_vector (3 downto 0);
			intersect	: out std_logic
			);
	end component;

	signal x_tank, y_tank, x_video, y_video : std_logic_vector (3 downto 0);
	signal intersect : std_logic;
	signal vector : std_logic_vector (15 downto 0);
	signal i : unsigned (15 downto 0);

begin
	y_video <= vector (15 downto 12);
	x_video <= vector (11 downto 8);
	y_tank <= vector (7 downto 4);
	x_tank <= vector (3 downto 0);

l0:	pg_pxc port map (x_tank, y_tank, x_video, y_video, intersect);

l1:	process
	begin
	
	vector <= "0000000000000000";

	for i in 0 to 65536 loop
		wait for 100 ns;
		vector <= std_logic_vector (unsigned(vector) + '1');
		
		wait for 100 ns;
	end loop;
	
	wait for 100 ns;
   end process;
end beh_pxc;

