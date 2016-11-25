library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_div is
	port(
		clk, reset:	in  std_logic;
		pixel, blck: 	out std_logic);
end clk_div;

architecture arch of clk_div is
signal cnt_pixel: std_logic_vector(2 downto 0) := (others => '0');
signal cnt_blck:  std_logic_vector(6 downto 0) := (others => '0');

signal blck_i: std_logic := '1';

begin
	process(reset, clk)
	begin
		if(reset = '1') then
			cnt_pixel <= (others => '0');
			pixel <= '1';
		elsif(rising_edge(clk)) then
			if(to_integer(unsigned(cnt_pixel)) >= 6) then
				pixel <= '1';
				cnt_pixel <= (others => '0');
			elsif(to_integer(unsigned(cnt_pixel)) >= 3) then
				pixel <= '0';
				cnt_pixel <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_pixel)) + 1, 3));
			else
				cnt_pixel <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_pixel)) + 1, 3));
			end if;
		end if;
	end process;

	process(reset, clk)
	begin
		if(reset = '1') then
			cnt_blck <= (others => '0');
			blck_i <= '1';
		elsif(rising_edge(clk)) then
			if(to_integer(unsigned(cnt_blck)) = 104) then
				blck_i <= not(blck_i);
				cnt_blck <= (others => '0');
			else
				cnt_blck <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_blck)) + 1, 7));
			end if;
		end if;
	end process;

	blck <= blck_i;
end arch;
