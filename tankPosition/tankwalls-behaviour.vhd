library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tankwalls is

signal x, y : std_logic_vector(3 downto 0);
begin

x <= coord(7 downto 4);
y <= coord(3 downto 0);


result <= (x(2) and x(1) and x(3) and x(0)) or (not(x(2)) and not(x(1)) and not(x(3)) and not(x(0))) or (y(3) and y(2) and y(0) and y(1)) or (not(y(3)) and not(y(2)) and not(y(0)) and not(y(1))) or (not(y(3)) and not(y(0)) and x(3) and x(0)) or (y(3) and y(0) and not(x(3)) and not(x(0))) or (not(x(2)) and x(1) and not(y(3)) and not(y(2)) and y(1)) or (x(2) and not(x(1)) and not(y(3)) and not(y(2)) and y(1)) or (not(x(2)) and x(1) and not(y(2)) and y(0) and y(1)) or (x(2) and not(x(1)) and not(y(2)) and y(0) and y(1)) or (x(2) and not(x(1)) and not(y(2)) and x(3) and y(1)) or (not(x(2)) and x(1) and not(y(2)) and not(x(3)) and y(1)) or (not(x(2)) and x(1) and not(y(2)) and x(0) and y(1)) or (x(2) and not(x(1)) and not(y(2)) and not(x(0)) and y(1)) or (not(x(2)) and x(1) and y(3) and y(2) and not(y(1))) or (x(2) and not(x(1)) and y(3) and y(2) and not(y(1))) or (not(x(2)) and x(1) and y(2) and not(y(0)) and not(y(1))) or (x(2) and not(x(1)) and y(2) and not(y(0)) and not(y(1))) or (x(2) and not(x(1)) and y(2) and x(3) and not(y(1))) or (not(x(2)) and x(1) and y(2) and not(x(3)) and not(y(1))) or (not(x(2)) and x(1) and y(2) and x(0) and not(y(1))) or (x(2) and not(x(1)) and y(2) and not(x(0)) and not(y(1))) or (not(x(2)) and not(x(1)) and not(y(3)) and y(2) and x(3) and y(1)) or (x(2) and x(1) and not(y(3)) and y(2) and not(x(3)) and y(1)) or (x(1) and not(y(3)) and y(2) and not(y(0)) and not(x(3)) and y(1)) or (not(x(2)) and not(x(1)) and y(0) and x(3) and x(0) and y(1)) or (not(x(1)) and not(y(3)) and y(2) and not(y(0)) and not(x(0)) and y(1)) or (x(2) and x(1) and not(y(3)) and not(x(3)) and not(x(0)) and y(1)) or (not(x(2)) and not(x(1)) and y(3) and not(y(2)) and x(3) and not(y(1))) or (not(x(1)) and y(3) and not(y(2)) and y(0) and x(3) and not(y(1))) or (x(2) and x(1) and y(3) and not(y(2)) and not(x(3)) and not(y(1))) or (x(1) and y(3) and not(y(2)) and y(0) and x(0) and not(y(1))) or (not(x(2)) and not(x(1)) and y(3) and x(3) and x(0) and not(y(1))) or (x(2) and x(1) and not(y(0)) and not(x(3)) and not(x(0)) and not(y(1)));
end behaviour;


