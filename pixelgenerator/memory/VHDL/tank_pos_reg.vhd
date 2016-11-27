library IEEE;
use IEEE.std_logic_1164.ALL;

entity tank_pos_reg is
	port(
		tank_x_in : in std_logic_vector(3 downto 0);
		tank_x_out  : out std_logic_vector(3 downto 0);
		tank_y_in : in std_logic_vector(3 downto 0);
		tank_y_out : out std_logic_vector(3 downto 0);
		tank_or_in : in std_logic_vector(1 downto 0);
		tank_or_out: out std_logic_vector(1 downto 0);
		update_pos : in std_logic;
		reset : in std_logic
	);
end tank_pos_reg;








