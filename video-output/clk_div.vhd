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
			pixel <= '0';
		elsif(rising_edge(clk)) then
			if(to_integer(signed(cnt_pixel)) >= 7) then
				pixel <= '1';
				cnt_pixel <= (others => '0');
			elsif(to_integer(signed(cnt_pixel)) >= 4) then
				pixel <= '0';
				cnt_pixel <= std_logic_vector(to_unsigned(to_integer(signed(cnt_pixel)) + 1, 3));
			else
				cnt_pixel <= std_logic_vector(to_unsigned(to_integer(signed(cnt_pixel)) + 1, 3));
			end if;
		end if;
	end process;

	process(reset, clk)
	begin
		if(reset = '1') then
			cnt_blck <= (others => '0');
			blck_i <= '0';
		elsif(rising_edge(clk)) then
			if(to_integer(signed(cnt_blck)) = 105) then
				blck_i <= not(blck_i);
			else
				cnt_blck <= std_logic_vector(to_unsigned(to_integer(signed(cnt_blck)) + 1, 7));
			end if;
		end if;
	end process;

	blck <= blck_i;
end arch;
