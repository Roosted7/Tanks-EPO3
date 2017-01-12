library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter3bit is
    Port ( clk : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (2 downto 0);
	reset : in std_logic);
end counter3bit;







