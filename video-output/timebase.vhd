library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timebase is
	port(
		clk, reset:						in  std_logic;
		pixel, frame, vbullet:			out std_logic;
		hsync, vsync, x_c, y_c: 		out std_logic);
end timebase;

architecture arch of timebase is
	signal cnt_pixel: 		std_logic_vector(2 downto 0);
	signal cnt_row:			std_logic_vector(5 downto 0);
	signal cnt_frame:		std_logic_vector(9 downto 0);
	signal cnt_yblck:		std_logic_vector(4 downto 0);

	signal x_i, y_i:		std_logic;
	signal pixel_i:			std_logic;
	signal row:				std_logic;
	signal frame_i:			std_logic;
	signal vbullet_i:		std_logic;

	type pixel_type is (p0, p1);
	signal pixel_curr, pixel_next: pixel_type;

begin
	process(reset, clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				pixel_curr <= p0;
			else
				pixel_curr <= pixel_next;
			end if;
		end if;
	end process;

	process(pixel_curr)
	begin
		if(pixel_curr = p0) then
			

--	process(reset, clk) -- create pixel_i clock
--	begin
--		if(rising_edge(clk)) then
--			if(reset = '1') then
--				cnt_pixel 	<= (others => '0');
--				pixel_i 	<= '0';
--				x_i 		<= '0';
--			else
--				cnt_pixel <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_pixel)) + 1, 3));
--
--				if(to_integer(unsigned(cnt_pixel)) = 0) then
--					pixel_i <= '1';
					--
--					if((to_integer(unsigned(cnt_row)) > 2) and (to_integer(unsigned(cnt_row)) < 19)) then
--						if(to_integer(unsigned(cnt_frame)) > 7) and (to_integer(unsigned(cnt_frame)) < 472) then
--							x_i <= '1'; -- create an x signal that shows when to go to the next pixel in a row
--						else
--							x_i <= '0';
--						end if;
--					else
--						x_i <= '0';
--					end if;
--				elsif(to_integer(unsigned(cnt_pixel)) = 6) then
--					cnt_pixel <= (others => '0');
--				elsif(to_integer(unsigned(cnt_pixel)) = 4) then
--					pixel_i	<= '0';
--					x_i 	<= '0';
--				end if;
--			end if;
--		end if;
--	end process;
--
--	process(reset, pixel_i, clk) -- create row clock
--	begin
--		if(rising_edge(clk)) then
--			if(reset = '1') then
--				cnt_row <= (others => '0');
--				row 	<= '0';
--				hsync 	<= '0';
--			elsif(rising_edge(pixel_i)) then
--				cnt_row <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_row)) + 1, 6));
--
--				if((to_integer(unsigned(cnt_row)) >= 23) and (to_integer(unsigned(cnt_row)) <= 25)) then
--					hsync <= '0'; -- create hsync signal
--				else
--					hsync <= '1';
--				end if;
--
--				if(to_integer(unsigned(cnt_row)) = 0) then
--					row <= '1';
--				elsif(to_integer(unsigned(cnt_row)) = 27) then
--					cnt_row <= (others => '0');
--				elsif(to_integer(unsigned(cnt_row)) = 14) then
--					row <= '0';
--				end if;
--			end if;
--		end if;
--	end process;
--
--	process(reset, row, clk) -- create frame clock (60 Hz)
--	begin
--		if(rising_edge(clk)) then
--			if(reset = '1') then
--				cnt_frame 	<= (others => '0');
--				frame_i 	<= '0';
--				vsync 		<= '0';
--				y_i 		<= '0';
--				cnt_yblck 	<= (others => '0');
--			elsif(rising_edge(row)) then
--				cnt_frame <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_frame)) + 1, 10));
--
--				if((to_integer(unsigned(cnt_frame)) >= 490) and (to_integer(unsigned(cnt_frame)) <= 491)) then
--					vsync <= '0'; -- create vsync signal
--				else
--					vsync <= '1';
--				end if;
--
--				if(to_integer(unsigned(cnt_frame)) = 7) then
--					frame_i <= '0';
--				elsif(to_integer(unsigned(cnt_frame)) = 524) then
--					cnt_frame <= (others => '0');
--				elsif(to_integer(unsigned(cnt_frame)) = 471) then
--					frame_i <= '1';
--				end if;
--
--				if((to_integer(unsigned(cnt_frame)) > 7) and (to_integer(unsigned(cnt_frame)) < 472)) then
--					cnt_yblck <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_yblck)) + 1, 5));
--
--					if(to_integer(unsigned(cnt_yblck)) = 0) then  -- create an y signal that shows when to go to the next row in the frame
--						y_i <= '1';
--					elsif(to_integer(unsigned(cnt_yblck)) = 28) then
--						cnt_yblck <= (others => '0');
--					elsif(to_integer(unsigned(cnt_yblck)) = 16) then
--						y_i <= '0';
--					end if;
--				else
--					cnt_yblck <= (others => '0');
--				end if;
--			end if;
--		end if;
--	end process;
--
--	process(reset, frame_i, clk) -- create vbullet clock (30 Hz)
--	begin
--		if(rising_edge(clk)) then
--			if(reset = '1') then
--				vbullet_i <= '0';
--			elsif(rising_edge(frame_i)) then
--				vbullet_i <= not(vbullet_i);
--			end if;
--		end if;
--	end process;

	frame 	<= row;
	vbullet <= vbullet_i;
	pixel 	<= pixel_i;
	x_c		<= x_i;
	y_c		<= y_i;
end arch;
























