library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_div is
	port(
		clk, reset:					in  std_logic;
		pixel, row, frame, vbullet, hsync, vsync: 	out std_logic);
end clk_div;

architecture arch of clk_div is
signal cnt_pixel: 	std_logic_vector(2 downto 0) := (others => '0');
signal cnt_row:		std_logic_vector(5 downto 0) := (others => '0');
signal cnt_frame:	std_logic_vector(9 downto 0) := (others => '0');

signal pixel_i: 	std_logic := '1';
signal row_i:		std_logic := '1';
signal frame_i:		std_logic := '1';
signal vbullet_i:	std_logic := '1';

begin
	process(reset, clk) -- create pixel clock
	begin
		if(reset = '1') then
			cnt_pixel <= (others => '0');
			pixel_i <= '1';
		elsif(rising_edge(clk)) then
			cnt_pixel <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_pixel)) + 1, 3));
			
			if(to_integer(unsigned(cnt_pixel)) = 4) then -- 4 = 5 - 1; 5 is from clock frequency to the pixel frequency
				pixel_i <= '1';
				cnt_pixel <= (others => '0');
			elsif(to_integer(unsigned(cnt_pixel)) = 2) then -- 2 = 4 / 2
				pixel_i <= '0';
			end if;
		end if;
	end process;

	process(reset, pixel_i) -- create row clock
	begin
		if(reset = '1') then
			cnt_row <= (others => '0');
			row_i <= '1';
		elsif(rising_edge(pixel_i)) then
			cnt_row <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_row)) + 1, 6));

			if(to_integer(unsigned(cnt_row)) = 35) then -- 35 = 36 - 1; 36 = 29 + hsync
				row_i <= '1';
				cnt_row <= (others => '0');
			elsif(to_integer(unsigned(cnt_row)) = 17) then -- 17 = 36 / 2 - 1
				row_i <= '0';
			end if;
		end if;
	end process;

	process(reset, row_i) -- create frame clock (60 Hz)
	begin
		if(reset = '1') then
			cnt_frame <= (others => '0');
			frame_i <= '1';
		elsif(rising_edge(row_i)) then
			cnt_frame <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_frame)) + 1, 10));
			
			if(to_integer(unsigned(cnt_frame)) = 524) then -- 524 = 525 - 1; 525 = 480 + vsync
				frame_i <= '1';
				cnt_frame <= (others => '0');
			elsif(to_integer(unsigned(cnt_frame)) = 262) then -- 262 = 524 / 2
				frame_i <= '0';
			end if;
		end if;
	end process;

	process(reset, frame_i) -- create vbullet clock (30 Hz)
	begin
		if(reset = '1') then
			vbullet_i <= '1';
		elsif(rising_edge(frame_i)) then
			vbullet_i <= not(vbullet_i);
		end if;
	end process;

	process(reset, row_i) -- create hsync signal
	begin
		if(reset = '1') then
			hsync <= '0';
		elsif(rising_edge(row_i)) then
			if((to_integer(unsigned(cnt_pixel)) > 30) and (to_integer(unsigned(cnt_pixel)) < 35)) then
				hsync <= '0';
			else
				hsync <= '1';
			end if;
		end if;
	end process;

	pixel <= pixel_i;
	row <= row_i;
	frame <= frame_i;
	vbullet <= vbullet_i;
end arch;
