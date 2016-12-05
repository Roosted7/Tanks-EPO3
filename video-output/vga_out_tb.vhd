library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_out_tb is
end vga_out_tb;

architecture arch of vga_out_tb is
	component vga_out is
		port(
		clk, reset:							in  std_logic;
		rgb: 								in  std_logic_vector(2 downto 0);
		r, g, b:							out std_logic;
		--pixel, row:							out std_logic;
		frame, vbullet:						out std_logic;
		hsync, vsync: 						out std_logic;
		x, y:								out std_logic_vector(3 downto 0));
	end component vga_out;

	signal clk, reset, frame, vbullet, hsync, vsync, r, g, b: std_logic;
	signal x, y: std_logic_vector(3 downto 0);
	signal rgb: std_logic_vector(2 downto 0);

begin
	reset <= 	'1' after 0 	ns,
				'0' after 1148 	ns,
				'1' after 30 	ms,
				'0' after 40 	ms;
	clk   <= 	'0' after 0 	ns,
				'1' after 82 	ns when clk /= '1' else '0' after 82 ns;

	process(x, y)
	begin
		if(y = "0111" or y = "1000") then
			rgb <= "111";
		elsif(x = "0010") then
			rgb <= "100";
		elsif(x = "0011") then
			rgb <= "010";
		elsif(x = "0100") then
			rgb <= "001";
		elsif(x = "1010") then
			rgb <= "110";
		elsif(x = "1011") then
			rgb <= "011";
		elsif(x = "1100") then
			rgb <= "101";
		else
			rgb <= "000";
		end if;
	end process;
		


	l1: vga_out port map(clk, reset, rgb, r, g, b, frame, vbullet, hsync, vsync, x, y);
end arch;