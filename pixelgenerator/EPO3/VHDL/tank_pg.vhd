library IEEE;
use IEEE.std_logic_1164.ALL;

entity tank_pg is
port (
		tank_x_in 		: in std_logic_vector(3 downto 0);
		tank_x_out  		: out std_logic_vector(3 downto 0);
		tank_y_in 		: in std_logic_vector(3 downto 0);
		tank_y_out 		: out std_logic_vector(3 downto 0);
		tank_or_in 		: in std_logic_vector(1 downto 0);
		tank_or_out		: out std_logic_vector(1 downto 0);
		screen_x_in 		: in std_logic_vector(3 downto 0);
		screen_y_in 		: in std_logic_vector(3 downto 0);
		update_pos 		: in std_logic;
		hit_in 		: in std_logic;
		hit_out 		: out std_logic;
		draw 		: out std_logic;
		clk		: in std_logic
	);
end tank_pg;








