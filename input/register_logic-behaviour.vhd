library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of register_logic is
begin

process(enable, reg_in, enc_in)
begin
case enable is
	when "10" =>
		output <= reg_in;
	when "01" =>
		output <= enc_in;
	when others =>
		output <= "100";
end case;
end process;
		
end behaviour;





