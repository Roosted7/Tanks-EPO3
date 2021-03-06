library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of newposition_tb is
	component newposition
		port (	bullet_in :in    std_logic_vector(10 downto 0);
        			bullet_out:out   std_logic_vector(10 downto 0)
		);
	end component;
	signal bullet_in : std_logic_vector(10 downto 0);
	signal bullet_out: std_logic_vector(10 downto 0);
begin
	lbl1: newposition port map (bullet_in, bullet_out);
	bullet_in	<=	"10000000111" after 0 ns,
			"11111000111" after 5 ns,
			"10001000011" after 10 ns,
			"10001111111" after 15 ns,
			"00010100011" after 20 ns,
			"10010001000" after 25 ns,
			"10010001001" after 30 ns,
			"10010001010" after 35 ns,
			"10010001011" after 40 ns;	
end behaviour;





