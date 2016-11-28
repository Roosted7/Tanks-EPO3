library IEEE;
use IEEE.std_logic_1164.ALL;

entity tank_hit_reg is
port(
		hit_in : in std_logic;
		hit_out : out std_logic;
		clk : in std_logic
	);
end tank_hit_reg;


