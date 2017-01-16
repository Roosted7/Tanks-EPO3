library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of s_inv is
begin
outp(0)<=inp;
outp(1)<=not(inp);
outp(2)<=inp;
end behaviour;


