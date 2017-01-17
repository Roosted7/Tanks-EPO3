library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of mux6_2to1 is
begin

process(test_enable, input, input_test)
begin
case test_enable is
	when '1' =>
		output <= input_test;
	when others =>
		output <= input;
end case;
end process;

end behaviour;


