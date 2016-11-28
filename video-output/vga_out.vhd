library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_out is
	port(
		clk, reset:		in  std_logic,
		rgb: 			in  std_logic_vector(2 downto 0),
		x, y: 			out std_logic_vector(3 downto 0),
		vsync, hsync: 	out std_logic,
		r, g, b:		out std_logic,
		frame, vbullet:	out std_logic);
end vga_out;

architecture arch of vga_out is
--component clk_div
--	port(
--		clk, reset:					in  std_logic;
--		pixel, row, frame, vbullet: 	out std_logic);
--end component;

signal cnt_pixel: 	std_logic_vector(2 downto 0) := (others => '0');
signal cnt_row:		std_logic_vector(4 downto 0) := (others => '0');
signal cnt_frame:	std_logic_vector(8 downto 0) := (others => '0');

signal x, x_old:	std_logic_vector(5 downto 0) := (others => '0');
signal y, y_old:	std_logic_vector(9 downto 0) := (others => '0');

signal pixel: 		std_logic := '1';
signal row:			std_logic := '1';
signal frame_i:		std_logic := '1';
signal vbullet_i:	std_logic := '1';

--signal pixel, row: std_logic;

begin
	process(reset, clk) -- create pixel clock
	begin
		if(reset = '1') then
			cnt_pixel <= (others => '0');
			pixel <= '1';
		elsif(rising_edge(clk)) then
			cnt_pixel <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_pixel)) + 1, 3));
			
			if(to_integer(unsigned(cnt_pixel)) = 4) then -- 6 = 5 - 1; 5 is from clock frequency to the pixel frequency
				pixel <= '1';
				cnt_pixel <= (others => '0');
			elsif(to_integer(unsigned(cnt_pixel)) = 2) then -- 2 = 4 / 2
				pixel <= '0';
			end if;
		end if;
	end process;

	process(reset, pixel) -- create row clock
	begin
		if(reset = '1') then
			cnt_row <= (others => '0');
			row <= '1';
		elsif(rising_edge(pixel)) then
			if(to_integer(unsigned(cnt_row)) = 17) then -- 17 = 36 / 2 - 1; 36 = 29 + hsync
				row <= not(row);
				cnt_row <= (others => '0');
			else
				cnt_row <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_row)) + 1, 5));
			end if;
		end if;
	end process;

	process(reset, row) -- create frame clock (60 Hz)
	begin
		if(reset = '1') then
			cnt_frame <= (others => '0');
			frame_i <= '1';
		elsif(rising_edge(row)) then
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

	process(reset, frame_i, row, pixel) -- full process on the output signals
	begin
		if(rising_edge(frame_i)) then
			if(rising_edge(row)) then
				if(rising_edge(pixel)) then
					-- ye ye
				end if;
			end if;
		end if;
	end process;

	process(reset, row) -- hsync process
	begin
		if(reset = '1') then
			hsync <= '0';
		elsif(rising_edge(row)) then
			if((to_integer(unsigned(cnt_pixel)) > 30) and (to_integer(unsigned(cnt_pixel)) < 35)) then
				hsync <= '0';
			else
				hsync <= '1';
			end if;
		end if;
	end process;

	frame <= frame_i;
	vbullet <= vbullet_i;
	
	r <= rgb(2);
	g <= rgb(1);
	b <= rgb(0);

	--l4: clk_div port map (clk, reset, pixel, row, frame, vbullet);
end arch;