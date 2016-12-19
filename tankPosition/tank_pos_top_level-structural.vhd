library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of tank_pos_top_level is

component new_coord is
   port(old_tank_coord	:in    std_logic_vector(10 downto 0);
        new_direction			:out   std_logic_vector(1 downto 0);
        input_direction	:in    std_logic_vector(2 downto 0);
        new_tank_coord		:out   std_logic_vector(7 downto 0)
      );
end component;

component wallcheck is
   port(oldcoor_1				   :in    std_logic_vector(7 downto 0);
        oldcoor_2      :in    std_logic_vector(7 downto 0);
        newcoor_1      :in    std_logic_vector(7 downto 0);
        newcoor_2     :in    std_logic_vector(7 downto 0);
        wc_newcoor_1   :out   std_logic_vector(7 downto 0);
        wc_newcoor_2  :out   std_logic_vector(7 downto 0);
--        tankwall_c  :out   std_logic_vector(1 downto 0);
--        tankwall_res:in    std_logic;
        count_in    :in    std_logic_vector(2 downto 0));
end component;

component tank_collision is
   port(oldcoor_1				   :in    std_logic_vector(7 downto 0);
        oldcoor_2      :in    std_logic_vector(7 downto 0);
        wc_newcoor_1   :in   std_logic_vector(7 downto 0);
        wc_newcoor_2  :in  std_logic_vector(7 downto 0);
        tc_newcoor_1   :out   std_logic_vector(7 downto 0);
        tc_newcoor_2  :out  std_logic_vector(7 downto 0)
);
end component;


signal newcoor_1, newcoor_2 : std_logic_vector(7 downto 0);
signal wc_newcoor_1, wc_newcoor_2 : std_logic_vector(7 downto 0);


begin

new_coordinates_tank1: new_coord port map (
			old_tank_coord => old_pos_1,
			new_direction => new_pos_1(1 downto 0),
			input_direction => input_direction_1,
			new_tank_coord => newcoor_1
			);

new_coordinates_tank2: new_coord port map (
			old_tank_coord => old_pos_2,
			new_direction => new_pos_2(1 downto 0),
			input_direction => input_direction_2,
			new_tank_coord => newcoor_2
			);


check_walls: wallcheck port map (
			oldcoor_1 => old_pos_1(9 downto 2),
			oldcoor_2 => old_pos_2(9 downto 2),
			newcoor_1 => newcoor_1,
			newcoor_2 => newcoor_2,
			wc_newcoor_1 => wc_newcoor_1,
			wc_newcoor_2 => wc_newcoor_2,
--			tankwall_c => tankwall_c,
--			tankwall_res => tankwall_res,
			count_in => count_in
			);
			

collisions: tank_collision port map (
			oldcoor_1 => old_pos_1(9 downto 2),
			oldcoor_2 => old_pos_2(9 downto 2),
			wc_newcoor_1 => wc_newcoor_1,
			wc_newcoor_2 => wc_newcoor_2,
			tc_newcoor_1 => new_pos_1(9 downto 2),
			tc_newcoor_2 => new_pos_2(9 downto 2)
			);

end structural;


