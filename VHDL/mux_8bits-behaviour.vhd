library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of mux_8bits is
begin
new_1 <= old_1 when (control = '0') else old_2;
end behaviour;




