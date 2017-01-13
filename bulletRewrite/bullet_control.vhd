library ieee;
use ieee.std_logic_1164.all;

entity bullet_control is
port(
		vga_x : in std_logic_vector(3 downto 0);
		vga_y : in std_logic_vector(3 downto 0);
		bullet_x : in std_logic_vector(3 downto 0);
		bullet_y : in std_logic_vector(3 downto 0);
		output : out std_logic);
end bullet_control;

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bullet_control is
begin
process(vga_x, vga_y, bullet_x, bullet_y)
begin
	if((vga_x = bullet_x) and(vga_y = bullet_y)) then
		output <= '1';
	else
		output <= '0';
	end if;
end process;
end behaviour;