library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behavioural of fa_5_bit is
	signal la, lb : std_logic_vector(4 downto 0);
begin
	
	la(4) <= '0';
	la(3 downto 0) <= a;
	lb(4) <= '0';
	lb(3 downto 0) <= b;

	c <= std_logic_vector(signed(la) - signed(lb));

end behavioural;





