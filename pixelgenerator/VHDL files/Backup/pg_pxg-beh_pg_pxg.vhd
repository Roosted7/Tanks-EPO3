library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture beh_pg_pxg of pg_pxg is
-- A type to make the code slightly more readable
-- The exact mapping is shown below.
type orientation is 
(
north,
east,
south,
west
);

-- container for the current orientation of the tank
signal compass : orientation;

begin
-- Map the orientation input from the registers to the correct 
-- orientation type
with theta select compass <=
north when "01",
east  when "10",
south when "11",
west  when "00",
north when others;

-- Main procces for calculation
process(x_in, y_in, compass)
begin

-- Logic per orientation.
case compass is
when north =>
x_head <= x_in;
y_head <= std_logic_vector(unsigned(y_in) -1);

x_left_leg <= std_logic_vector(unsigned(x_in) -1);
y_left_leg <= y_in;

x_right_leg <= std_logic_vector(unsigned(x_in) +1);
y_right_leg <= y_in;

x_left_foot <= std_logic_vector(unsigned(x_in) -1);
y_left_foot <= std_logic_vector(unsigned(y_in) +1);

x_right_foot <= std_logic_vector(unsigned(x_in) +1);
y_right_foot <= std_logic_vector(unsigned(y_in) +1);

when east =>
x_head <= std_logic_vector(unsigned(x_in) +1);
y_head <= y_in;

x_left_leg <= x_in;
y_left_leg <= std_logic_vector(unsigned(y_in) -1);

x_right_leg <= x_in;
y_right_leg <= std_logic_vector(unsigned(y_in) +1);

x_left_foot <= std_logic_vector(unsigned(x_in) -1);
y_left_foot <= std_logic_vector(unsigned(y_in) -1);

x_right_foot <= std_logic_vector(unsigned(x_in) -1);
y_right_foot <= std_logic_vector(unsigned(y_in) +1);

when south =>
x_head <= x_in;
y_head <= std_logic_vector(unsigned(y_in) +1);

x_left_leg <= std_logic_vector(unsigned(x_in) +1);
y_left_leg <= y_in;

x_right_leg <= std_logic_vector(unsigned(x_in) -1);
y_right_leg <= y_in;

x_left_foot <= std_logic_vector(unsigned(x_in) +1);
y_left_foot <= std_logic_vector(unsigned(y_in) -1);

x_right_foot <= std_logic_vector(unsigned(x_in) -1);
y_right_foot <= std_logic_vector(unsigned(y_in) -1);

when west =>
x_head <= std_logic_vector(unsigned(x_in) -1);
y_head <= y_in;

x_left_leg <= x_in;
y_left_leg <= std_logic_vector(unsigned(y_in) +1);

x_right_leg <= x_in;
y_right_leg <= std_logic_vector(unsigned(y_in) -1);

x_left_foot <= std_logic_vector(unsigned(x_in) +1);
y_left_foot <= std_logic_vector(unsigned(y_in) +1);

x_right_foot <= std_logic_vector(unsigned(x_in) +1);
y_right_foot <= std_logic_vector(unsigned(y_in) -1);

when others => -- To remove a warning
x_head <= std_logic_vector(unsigned(x_in) -1);
y_head <= y_in;

x_left_leg <= x_in;
y_left_leg <= std_logic_vector(unsigned(y_in) +1);

x_right_leg <= x_in;
y_right_leg <= std_logic_vector(unsigned(y_in) -1);

x_left_foot <= std_logic_vector(unsigned(x_in) +1);
y_left_foot <= std_logic_vector(unsigned(y_in) +1);

x_right_foot <= std_logic_vector(unsigned(x_in) +1);
y_right_foot <= std_logic_vector(unsigned(y_in) -1);

end case;
end process;

end beh_pg_pxg;





