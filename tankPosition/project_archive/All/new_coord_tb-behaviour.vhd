library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of new_coord_tb is

component new_coord is
   port(old_tank_coord	:in    std_logic_vector(10 downto 0);
        new_direction			:out   std_logic_vector(1 downto 0);
        input_direction	:in    std_logic_vector(2 downto 0);
        new_tank_coord		:out   std_logic_vector(7 downto 0)
      );
end component;

signal old_tank_coord : std_logic_vector(10 downto 0);
signal new_direction : std_logic_vector (1 downto 0);
signal input_direction : std_logic_vector (2 downto 0);
signal new_tank_coord : std_logic_vector (7 downto 0);

begin

coordinates: new_coord port map(
			old_tank_coord => old_tank_coord,
			new_direction => new_direction,
			input_direction => input_direction,
			new_tank_coord => new_tank_coord
			);

input_direction <= "000" after 0 ns, "001" after 100 ns, "010" after 200 ns, "011" after 300 ns, "100" after 400 ns, "101" after 500 ns;

old_tank_coord <= "11010010100" after 0 ns, "11010010101" after 50 ns, "11010010110" after 150 ns, "11010010111" after 250 ns, "11010010100" after 350 ns, "11010010101" after 450 ns, "11010010110" after 550 ns; 

end behaviour;


