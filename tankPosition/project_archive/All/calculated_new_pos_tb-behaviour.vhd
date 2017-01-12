library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of calculated_new_pos_tb is

component calculated_new_pos is
   port(input_direction10	:in    std_logic_vector(1 downto 0);
        old_pos 			:in    std_logic_vector(7 downto 0);
        new_pos 			:out   std_logic_vector(7 downto 0));
end component;

signal input_direction10 : std_logic_vector (1 downto 0);
signal old_pos, new_pos  : std_logic_vector (7 downto 0);

begin

calc_component: calculated_new_pos port map(
			input_direction10 => input_direction10,
			old_pos => old_pos,
			new_pos => new_pos
			);

old_pos <= "10100101" after 0 ns;
input_direction10 <= "00" after 0 ns, "01" after 100 ns, "10" after 200 ns, "11" after 300 ns;
end behaviour;


