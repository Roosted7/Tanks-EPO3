library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_out is
	port(
		clk, reset:		in  std_logic;
		rgb: 			in  std_logic_vector(2 downto 0);
		x, y: 			out std_logic_vector(3 downto 0);
		hsync, vsync: 	out std_logic;
		r, g, b:		out std_logic;
		frame, vbullet:	out std_logic);
end vga_out;

architecture arch of vga_out is
	component timebase is
		port(
			clk, reset:						in  std_logic;
			pixel, frame, vbullet:			out std_logic;
			hsync, vsync, x_c, y_c: 		out std_logic);
	end component timebase;
	
	signal cnt_x:			std_logic_vector(3 downto 0);
	signal cnt_y:			std_logic_vector(3 downto 0);

	signal pixel_i, x_c, y_c: std_logic;

begin
	process(reset, x_c, clk) -- x signal of which pixel is being shown
	begin
		if((reset = '1') and (rising_edge(clk))) then
			cnt_x <= (others => '0');
		elsif(rising_edge(x_c)) then
			if(to_integer(unsigned(cnt_x)) = 15) then
				cnt_x <= (others => '0');
			else
				cnt_x <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_x)) + 1, 4));
			end if;
		end if;
	end process;

	process(reset, y_c, clk) -- y signal of which pixel is being shown
	begin
		if((reset = '1') and (rising_edge(clk))) then
			cnt_y <= (others => '1');
		elsif(rising_edge(y_c)) then
			if(to_integer(unsigned(cnt_y)) = 15) then
				cnt_y <= (others => '0');
			else
				cnt_y <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_y)) + 1, 4));
			end if;
		end if;
	end process;

	process(reset, pixel_i, clk) -- pass the colors to the screen
	begin
		if((reset = '1') and (rising_edge(clk))) then
			r <= '0';
			g <= '0';
			b <= '0';
		elsif(rising_edge(pixel_i)) then
			if(x_c = '0') then
				r <= '0';
				g <= '0';
				b <= '0';
			else
				r <= rgb(2);
				g <= rgb(1);
				b <= rgb(0);
			end if;
		end if;
	end process;

	x <= cnt_x;
	y <= cnt_y;

	l1: timebase port map(clk, reset, pixel_i, frame, vbullet, hsync, vsync, x_c, y_c);
end arch;