library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity newposition is
   port(bullet_in :in    std_logic_vector(10 downto 0);
        bullet_out:out   std_logic_vector(10 downto 0));
end newposition;

architecture behaviour of newposition is
	signal l: std_logic;
	signal x: std_logic_vector(3 downto 0);
	signal y: std_logic_vector(3 downto 0);
	signal dir: std_logic_vector(1 downto 0);

	signal life: std_logic;
	signal x_out: std_logic_vector(3 downto 0);
	signal y_out: std_logic_vector(3 downto 0);
begin
	l <= bullet_in(10);
	x <= bullet_in(9 downto 6);
	y <= bullet_in(5 downto 2);
	dir <= bullet_in(1 downto 0);

	process(x, y, dir)
	begin
		if (x="0000" or y="0000" or x="1111" or y="1111" or l='0') then
			x_out <= x;
			y_out <= y;
			life <= '0';
		else
			case dir is
				when "00" =>
					x_out <= std_logic_vector(unsigned(x) - 1);
					y_out <= y;
					life <= l;
				when "01" =>
					x_out <= x;
					y_out <= std_logic_vector(unsigned(y) - 1);
					life <= l;
				when "10" =>
					x_out <= std_logic_vector(unsigned(x) + 1);
					y_out <= y;
					life <= l;
				when "11" =>
					x_out <= x;
					y_out <= std_logic_vector(unsigned(y) + 1);
					life <= l;
				when others =>
					x_out <= x;
					y_out <= y;
					life <= '0';
			end case;
		end if;
	end process;

	bullet_out(10) <= life;
	bullet_out(9 downto 6) <= x_out;
	bullet_out(5 downto 2) <= y_out;
	bullet_out(1 downto 0) <= dir;
end behaviour;
