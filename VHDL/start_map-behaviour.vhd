library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of start_map is
begin

draw_start <= (not(y(0)) and not(x(3)) and not(x(2)) and ((not(y(1)) and not(x(1))) or (y(1) and x(1)))) or (not(y(2)) and (y(1) or not(y(3)))) or (y(2) and ((not(x(0)) and ((x(3) and not(x(1)) and ((y(0) and x(2)) or not(y(1)))) or (not(y(1)) and not(x(3)) and x(1)))) or (not(y(1)) and not(y(0))) or y(3))) or (x(0) and ((not(y(0)) and (not(x(2)) or x(3))) or (x(1) and ((y(1) and not(x(3))) or (not(y(2)) and y(0)))) or ((not(x(1)) and ((x(3) and not(x(2))) or (not(y(2)) and x(2)))) or (y(1) and x(2)))));

end behaviour;


