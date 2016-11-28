library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture beh_tank_pix of tank_pix is

type orientation is (
north,
east,
south,
west
);

signal x_in_int, y_in_int, x_head_int, y_head_int, x_left_leg_int, y_left_leg_int, x_body_int, y_body_int, x_right_leg_int, y_right_leg_int, x_left_foot_int, y_left_foot_int, x_right_foot_int, y_right_foot_int : unsigned(3 downto 0);

signal compass : orientation;

begin

x_in_int <= unsigned(x_in);
y_in_int <= unsigned(y_in);

with theta select compass <=
north when "00",
east  when "01",
south when "10",
west  when "11",
north when others;

process(x_in_int, y_in_int, compass)
begin

x_body_int <= x_in_int;
y_body_int <= y_in_int;

case compass is
when north =>
x_head_int <= x_in_int;
y_head_int <= y_in_int -1;

x_left_leg_int <= x_in_int -1;
y_left_leg_int <= y_in_int;

x_right_leg_int <= x_in_int +1;
y_right_leg_int <= y_in_int;

x_left_foot_int <= x_in_int -1;
y_left_foot_int <= y_in_int +1;

x_right_foot_int <= x_in_int +1;
y_right_foot_int <= y_in_int +1;

when east =>
x_head_int <= x_in_int +1;
y_head_int <= y_in_int;

x_left_leg_int <= x_in_int;
y_left_leg_int <= y_in_int -1;

x_right_leg_int <= x_in_int;
y_right_leg_int <= y_in_int +1;

x_left_foot_int <= x_in_int -1;
y_left_foot_int <= y_in_int -1;

x_right_foot_int <= x_in_int -1;
y_right_foot_int <= y_in_int +1;

when south =>
x_head_int <= x_in_int;
y_head_int <= y_in_int +1;

x_left_leg_int <= x_in_int +1;
y_left_leg_int <= y_in_int;

x_right_leg_int <= x_in_int -1;
y_right_leg_int <= y_in_int;

x_left_foot_int <= x_in_int +1;
y_left_foot_int <= y_in_int -1;

x_right_foot_int <= x_in_int -1;
y_right_foot_int <= y_in_int -1;

when west =>
x_head_int <= x_in_int -1;
y_head_int <= y_in_int;

x_left_leg_int <= x_in_int;
y_left_leg_int <= y_in_int +1;

x_right_leg_int <= x_in_int;
y_right_leg_int <= y_in_int -1;

x_left_foot_int <= x_in_int +1;
y_left_foot_int <= y_in_int +1;

x_right_foot_int <= x_in_int +1;
y_right_foot_int <= y_in_int -1;

end case;

end process;

x_head <= std_logic_vector (x_head_int);
y_head <= std_logic_vector (y_head_int);
x_body <= std_logic_vector (x_body_int);
y_body <= std_logic_vector (y_body_int);
x_left_leg <= std_logic_vector (x_left_leg_int);
y_left_leg <= std_logic_vector (y_left_leg_int);
x_right_leg <= std_logic_vector (x_right_leg_int);
y_right_leg <= std_logic_vector (y_right_leg_int);
x_left_foot <= std_logic_vector (x_left_foot_int);
y_left_foot <= std_logic_vector (y_left_foot_int);
x_right_foot <= std_logic_vector (x_right_foot_int);
y_right_foot <= std_logic_vector (y_right_foot_int);

end beh_tank_pix;


