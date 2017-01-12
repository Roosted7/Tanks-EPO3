library IEEE;
use IEEE.std_logic_1164.ALL;
--use ieee.numeric_std.all;

architecture behaviour of tank_collision is
component fa_5_bit is
   port(a    :in    std_logic_vector(3 downto 0);
		b	: in std_logic_vector(3 downto 0);
		c 	: out std_logic_vector(4 downto 0)
	);
end component fa_5_bit;

component mux_8bits is
   port(new_1  :out   std_logic_vector(7 downto 0);
        old_1  :in    std_logic_vector(7 downto 0);
        old_2  :in    std_logic_vector(7 downto 0);
        control:in    std_logic);
end component mux_8bits;

signal collision_result, collision_result_x, collision_result_y : std_logic;
signal subtract_vectorx, subtract_vectory : std_logic_vector(4 downto 0);

begin
subtractx:fa_5_bit port map(
a => wc_newcoor_1(3 downto 0),
b => wc_newcoor_2(3 downto 0),
c => subtract_vectorx
);

subtracty:fa_5_bit port map(
a => wc_newcoor_1(7 downto 4),
b => wc_newcoor_2(7 downto 4),
c => subtract_vectory
);

collision_result_x <= (subtract_vectorx(4) and subtract_vectorx(3) and subtract_vectorx(2) and subtract_vectorx(1)) or (not subtract_vectorx(4) and not subtract_vectorx(3) and not subtract_vectorx(2) and not subtract_vectorx(1)) or (not subtract_vectorx(4) and not subtract_vectorx(3) and not subtract_vectorx(2)and not subtract_vectorx(0));

collision_result_y <= (subtract_vectory(4) and subtract_vectory(3) and subtract_vectory(2) and subtract_vectory(1)) or (not subtract_vectory(4) and not subtract_vectory(3) and not subtract_vectory(2) and not subtract_vectory(1)) or (not subtract_vectory(4) and not subtract_vectory(3) and not subtract_vectory(2)and not subtract_vectory(0));

collision_result <= collision_result_x and collision_result_y;

mux_tank1: mux_8bits port map(
new_1 => tc_newcoor_1,
old_1 => wc_newcoor_1,
old_2 => oldcoor_1,
control => collision_result
);

mux_tank2: mux_8bits port map(
new_1 => tc_newcoor_2,
old_1 => wc_newcoor_2,
old_2 => oldcoor_2,
control => collision_result
);

end behaviour;



















































