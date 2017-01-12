library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of adder_5bits_tb is

component adder_5bits is
   port(old_pos:in    std_logic_vector(7 downto 0);
        input_direction10  :in    std_logic_vector(1 downto 0);
        new_pos:out   std_logic_vector(3 downto 0));
end component;

signal input_direction10 : std_logic_vector(1 downto 0);
signal old_pos : std_logic_vector (7 downto 0);
signal new_pos : std_logic_vector (3 downto 0);

begin

adder: adder_5bits port map (
			old_pos => old_pos,
			input_direction10 => input_direction10,
			new_pos => new_pos
			);

old_pos <= "11010110" after 0 ns;
input_direction10 <= "00" after 0 ns, "01" after 100 ns, "10" after 200 ns, "11" after 300 ns;

end behaviour;


