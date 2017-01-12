library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of combiblok_coord_tb is

component combiblok_coord is
   port(input_direction :in    std_logic_vector(2 downto 0);
        old_direction			:in    std_logic_vector(1 downto 0);
        control      			:out   std_logic);
end component;

signal input_direction : std_logic_vector (2 downto 0);
signal old_direction : std_logic_vector (1 downto 0);
signal control : std_logic;

begin

combi: combiblok_coord port map(
			input_direction => input_direction,
			old_direction => old_direction,
			control => control
			);

input_direction <= "000" after 0 ns, "001" after 100 ns, "010" after 200 ns, "011" after 300 ns, "100" after 400 ns, "101" after 500 ns;

old_direction <=  "00" after ns, "01" after 50 ns, "10" after 150 ns, "11" after 250 ns, "00" after 350 ns, "01" after 450 ns;

end behaviour;


