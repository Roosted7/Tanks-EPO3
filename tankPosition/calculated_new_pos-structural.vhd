library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of calculated_new_pos is


component new_pos_vec is
   port(new_pos 			 :in    std_logic_vector(3 downto 0);
        old_pos 			 :in    std_logic_vector(7 downto 0);
        input_direction0	:in    std_logic;
        new_pos_vector   :out   std_logic_vector(7 downto 0));
end component;

component adder_5bits is
   port(old_pos:in    std_logic_vector(7 downto 0);
        input_direction10  :in    std_logic_vector(1 downto 0);
        new_pos:out   std_logic_vector(3 downto 0));
end component;

signal new_pos_vector : std_logic_vector(3 downto 0);

begin

adder: adder_5bits port map(
			old_pos => old_pos,
			input_direction10 => input_direction10,
			new_pos => new_pos_vector
			);
new_posistion: new_pos_vec port map(
			new_pos => new_pos_vector,
			old_pos => old_pos,
			input_direction0 => input_direction10(0),
			new_pos_vector => new_pos
			);

end structural;









