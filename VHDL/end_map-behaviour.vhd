library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of end_map is
begin

draw_end <= (y(3) and y(2) and y(1)) or (not(y(3)) and not(y(2)) and not(y(1))) or (y(2) and y(1) and y(0)) or (not(y(2)) and not(y(1)) and not(y(0))) or (not(y(3)) and x(3) and x(2)) or (not(y(3)) and not(x(3)) and not(x(2))) or (not(y(3)) and x(1) and x(0)) or (x(3) and x(2) and not(x(1)) and not(x(0))) or (not(y(3)) and not(y(1)) and y(0) and x(1)) or (y(2) and y(1) and x(2) and x(1)) or (not(y(2)) and y(0) and not(x(3)) and x(0)) or (y(3) and not(y(0)) and not(x(3)) and x(0)) or (y(2) and y(1) and x(2) and x(0)) or (y(0) and not(x(3)) and x(2) and x(0)) or (y(1) and not(y(0)) and x(3) and x(2) and x(1)) or (y(3) and not(y(1)) and not(y(0)) and not(x(1)) and x(0)) or (y(3) and not(y(0)) and x(3) and x(1) and not(x(0))) or (not(y(2)) and not(y(0)) and x(3) and x(1) and not(x(0))) or (not(y(1)) and y(0) and not(x(2)) and x(1) and not(x(0))) or (not(y(3)) and not(y(1)) and not(x(2)) and not(x(0)) and exist_t1) or (not(y(3)) and y(0) and not(x(2)) and not(x(0)) and exist_t1) or (y(3) and y(0) and x(3) and not(x(2)) and not(x(1)) and x(0)) or (y(3) and y(2) and y(0) and not(x(3)) and not(x(1)) and not(x(0))) or (not(y(3)) and y(1) and y(0) and not(x(2)) and not(x(1)) and not(exist_t1)) or (y(0) and x(3) and not(x(2)) and not(x(1)) and x(0) and not(exist_t1));

end behaviour;






