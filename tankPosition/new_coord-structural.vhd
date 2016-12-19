library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of new_coord is

component calculated_new_pos is
   port(input_direction10	:in    std_logic_vector(1 downto 0);
        old_pos 			:in    std_logic_vector(7 downto 0);
        new_pos 			:out   std_logic_vector(7 downto 0));
end component;

component combiblok_coord is
   port(input_direction :in    std_logic_vector(2 downto 0);
        old_direction			:in    std_logic_vector(1 downto 0);
        control      			:out   std_logic);
end component;


component mux_2bits is
   port(new_1  :out   std_logic_vector(1 downto 0);
        old_1  :in    std_logic_vector(1 downto 0);
        old_2  :in    std_logic_vector(1 downto 0);
        control:in    std_logic);
end component;

component mux_8bits is
   port(new_1  :out   std_logic_vector(7 downto 0);
        old_1  :in    std_logic_vector(7 downto 0);
        old_2  :in    std_logic_vector(7 downto 0);
        control:in    std_logic);
end component;

signal control: std_logic;
signal new_pos: std_logic_vector(7 downto 0);

begin

calc_new_pos: calculated_new_pos port map(
			input_direction10 => input_direction(1 downto 0),
			old_pos => old_tank_coord(9 downto 2),
			new_pos => new_pos
			);

combiblok: combiblok_coord port map(
			input_direction => input_direction,
			old_direction => old_tank_coord(1 downto 0),
			control => control
			);

mux2: mux_2bits port map(
			new_1 => new_direction,
			old_1 => input_direction(1 downto 0),
			old_2 => old_tank_coord(1 downto 0),
			control => input_direction(2)
			);

mux8: mux_8bits port map(
			new_1 => new_tank_coord,
			old_1 => new_pos,
			old_2 => old_tank_coord(9 downto 2),
			control => control
			);







end structural;





