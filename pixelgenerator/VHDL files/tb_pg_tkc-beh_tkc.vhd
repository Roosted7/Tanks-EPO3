library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture beh_tkc of tb_pg_tkc is

	component pg_tkc is
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
	signal vector : std_logic_vector (23 downto 0);
	signal i : unsigned (23 downto 0);

begin

l0:	pg_tkc port map (x_tank0, y_tank0, x_tank1, y_tank1, 
	 x_tank2, y_tank2, x_tank3, y_tank3, x_tank4, y_tank4,
	 x_tank5, y_tank5, x_video, y_video, intersect);

	y_video <= vector (23 downto 20);
	x_video <= vector (19 downto 16);
	y_tank5 <= "0000";
	x_tank5 <= "0000";
	y_tank4 <= "0000";
	x_tank4 <= "0000";
	y_tank3 <= "0000";
	x_tank3 <= "0000";
	y_tank2 <= "0000";
	x_tank2 <= "0000";
	y_tank1 <= vector (15 downto 12);
	x_tank1 <= vector (11 downto 8);
	y_tank0 <= vector (7 downto 4);
	x_tank0 <= vector (3 downto 0);

l1:	process
	begin
	
	vector <= "000000000000000000000000";

	for i in 0 to 16777215 loop
		wait for 100 ns;
		vector <= std_logic_vector (unsigned(vector) + '1');
		
		wait for 100 ns;
	end loop;
	
	wait for 100 ns;
   end process;
end architecture;


