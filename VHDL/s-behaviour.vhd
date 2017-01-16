library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of s is
begin
outp<=inp(0) and not(inp(1)) and inp(2);
end behaviour;


