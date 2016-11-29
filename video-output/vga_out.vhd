library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_out is
	port(
		clk, reset:		in  std_logic;
		rgb: 			in  std_logic_vector(2 downto 0);
		x, y: 			out std_logic_vector(3 downto 0);
		x_p, y_p:		out std_logic;
		vsync, hsync: 	out std_logic;
		r, g, b:		out std_logic;
		frame, vbullet:	out std_logic;
		row, pixel: 	out std_logic);
end vga_out;

architecture arch of vga_out is

	signal cnt_pixel: 		std_logic_vector(2 downto 0) := (others => '0');
	signal cnt_row:			std_logic_vector(5 downto 0) := (others => '0');
	signal cnt_frame:		std_logic_vector(9 downto 0) := (others => '0');

	signal cnt_yblck:		std_logic_vector(4 downto 0) := (others => '0');
	
	signal cnt_x:			std_logic_vector(3 downto 0) := (others => '0');
	signal cnt_y:			std_logic_vector(3 downto 0) := (others => '0');

	signal x_i, y_i:		std_logic := '0';
	signal pixel_i:			std_logic := '0';
	signal row_i:			std_logic := '0';
	signal frame_i:			std_logic := '0';
	signal vbullet_i:		std_logic := '0';

begin
	process(reset, clk) -- create pixel_i clock
	begin
		if((reset = '1') and (rising_edge(clk))) then
			cnt_pixel <= (others => '0');
			pixel_i <= '0';
			x_i <= '0';
		elsif(rising_edge(clk)) then
			cnt_pixel <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_pixel)) + 1, 3));

			if(to_integer(unsigned(cnt_pixel)) = 0) then
				pixel_i <= '1';
				
				if((to_integer(unsigned(cnt_row)) > 2) and (to_integer(unsigned(cnt_row)) < 19)) then
					x_i <= y_i; -- create an x signal that shows when to go to the next pixel in a row
				else
					x_i <= '0';
				end if;
			elsif(to_integer(unsigned(cnt_pixel)) = 4) then
				cnt_pixel <= (others => '0');
			elsif(to_integer(unsigned(cnt_pixel)) = 2) then
				pixel_i	<= '0';
				x_i 	<= '0';
			end if;
		end if;
	end process;

	process(reset, pixel_i, clk) -- create row_i clock
	begin
		if((reset = '1') and (rising_edge(clk))) then
			cnt_row <= (others => '0');
			row_i <= '0';
			hsync <= '0';
		elsif(rising_edge(pixel_i)) then
			cnt_row <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_row)) + 1, 6));

			if((to_integer(unsigned(cnt_row)) >= 23) and (to_integer(unsigned(cnt_row)) <= 26)) then
				hsync <= '0'; -- create hsync signal
			else
				hsync <= '1';
			end if;

			if(to_integer(unsigned(cnt_row)) = 0) then
				row_i <= '1';
			elsif(to_integer(unsigned(cnt_row)) = 28) then
				cnt_row <= (others => '0');
			elsif(to_integer(unsigned(cnt_row)) = 17) then
				row_i <= '0';
			end if;
		end if;
	end process;

	process(reset, row_i, clk) -- create frame clock (60 Hz)
	begin
		if((reset = '1') and (rising_edge(clk))) then
			cnt_frame <= (others => '0');
			frame_i <= '0';
			vsync <= '0';
			y_i <= '0';
			cnt_yblck <= (others => '0');
		elsif(rising_edge(row_i)) then
			cnt_frame <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_frame)) + 1, 10));

			if((to_integer(unsigned(cnt_frame)) >= 490) and (to_integer(unsigned(cnt_frame)) <= 491)) then
				vsync <= '0'; -- create vsync signal
			else
				vsync <= '1';
			end if;

			if(to_integer(unsigned(cnt_frame)) = 0) then
				frame_i <= '1';
			elsif(to_integer(unsigned(cnt_frame)) = 524) then
				cnt_frame <= (others => '0');
			elsif(to_integer(unsigned(cnt_frame)) = 262) then
				frame_i <= '0';
			end if;

			if((to_integer(unsigned(cnt_frame)) > 7) and (to_integer(unsigned(cnt_frame)) < 472)) then
				cnt_yblck <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_yblck)) + 1, 5));

				if(to_integer(unsigned(cnt_yblck)) = 0) then  -- create an y signal that shows when to go to the next row in the frame
					y_i <= '1';
				elsif(to_integer(unsigned(cnt_yblck)) = 28) then
					cnt_yblck <= (others => '0');
				elsif(to_integer(unsigned(cnt_yblck)) = 16) then
					y_i <= '0';
				end if;
			else
				cnt_yblck <= (others => '0');
			end if;
		end if;
	end process;

	process(reset, frame_i, clk) -- create vbullet clock (30 Hz)
	begin
		if((reset = '1') and (rising_edge(clk))) then
			vbullet_i <= '0';
		elsif(rising_edge(frame_i)) then
			vbullet_i <= not(vbullet_i);
		end if;
	end process;

	process(reset, x_i, clk) -- x signal of which pixel is being shown
	begin
		if((reset = '1') and (rising_edge(clk))) then
			cnt_x <= (others => '0');
		elsif(rising_edge(x_i)) then
			if(to_integer(unsigned(cnt_x)) = 15) then
				cnt_x <= (others => '0');
			else
				cnt_x <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_x)) + 1, 4));
			end if;
		end if;
	end process;

	process(reset, y_i, clk) -- y signal of which pixel is being shown
	begin
		if((reset = '1') and (rising_edge(clk))) then
			cnt_y <= (others => '1');
		elsif(rising_edge(y_i)) then
			if(to_integer(unsigned(cnt_y)) = 15) then
				cnt_y <= (others => '0');
			else
				cnt_y <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_y)) + 1, 4));
			end if;
		end if;
	end process;

	frame 	<= frame_i;
	vbullet <= vbullet_i;
	row 	<= row_i;
	pixel 	<= pixel_i;
	x 		<= cnt_x;
	y 		<= cnt_y;
	x_p		<= x_i;
	y_p		<= y_i;
end arch;