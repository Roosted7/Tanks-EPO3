library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_div is
	port(
		clk, reset:			   	in  std_logic,
		pixel, frame, vbullet: 	out std_logic);
end clk_div;

architecture arch of clk_div is
signal cnt_pixel: std_logic_vector(2 downto 0);

begin
	process(reset, clk)
	begin
		if(reset = '1') then
			cnt_pixel <= (others => '0');
		elsif(rising_edge(clk)) then
			if(cnt_pixel = 7) then
				pixel <= '1';
				cnt_pixel <= (others => '0');
			elsif(cnt_pixel = 4) then
				pixel <= '0';
				cnt_pixel <= cnt_pixel + 1;
			else
				cnt_pixel <= cnt_pixel + 1;
			end if;
		end if;
	end process;
end arch;
