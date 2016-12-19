library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_out is
	port(
		clk, reset:			in  std_logic;
		rgb: 				in  std_logic_vector(2 downto 0);
		r, g, b:			out std_logic;
		frame, bullet:		out std_logic;
		hsync, vsync: 		out std_logic;
		x, y:				out std_logic_vector(3 downto 0);
		collision:			out std_logic);
end vga_out;

architecture arch of vga_out is
	signal cnt_clk: 		std_logic_vector(2 downto 0);
	signal cnt_cluster:		std_logic_vector(4 downto 0);
	signal cnt_row:			std_logic_vector(9 downto 0);
	signal cnt_yblck:		std_logic_vector(4 downto 0);
	
	signal cnt_x, cnt_y:	std_logic_vector(3 downto 0);

	signal frame_i:			std_logic;
	signal bullet_i:		std_logic;

begin
	process(reset, clk, rgb)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then -- reset
				cnt_clk 	<= (others => '0');
				cnt_cluster <= (others => '0');
				cnt_row 	<= (others => '0');
				cnt_yblck	<= (others => '0');

				cnt_x 		<= (others => '0');
				cnt_y 		<= (others => '0');

				collision	<= '0';

				frame_i		<= '0';
				bullet_i	<= '0';

				hsync		<= '0';
				vsync		<= '0';

				r 			<= '0';
				g 			<= '0';
				b 			<= '0';
			else
				cnt_clk <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_clk)) + 1, 3));

				if(to_integer(unsigned(cnt_clk)) = 0) then -- high when going to the next cluster
					if((to_integer(unsigned(cnt_cluster)) > 2) and (to_integer(unsigned(cnt_cluster)) < 19) and
					to_integer(unsigned(cnt_row)) > 8) and (to_integer(unsigned(cnt_row)) < 473) then
						if(to_integer(unsigned(cnt_x)) = 15) then
							cnt_x <= (others => '0');
						else
							cnt_x <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_x)) + 1, 4));
						end if;

						r <= rgb(2);
						g <= rgb(1);
						b <= rgb(0);
					else
						r <= '0';
						g <= '0';
						b <= '0';
					end if;

					if((to_integer(unsigned(cnt_cluster)) > 22) and (to_integer(unsigned(cnt_cluster)) < 26)) then
						hsync <= '0';
					else
						hsync <= '1';
					end if;

--					if(to_integer(unsigned(cnt_cluster)) = 0 or to_integer(unsigned(cnt_cluster)) = 26) then
--						hsync <= '1';
--					elsif(to_integer(unsigned(cnt_cluster)) = 23) then
--						hsync <= '0';
--					end if;

					cnt_cluster <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_cluster)) + 1, 5));

					if(to_integer(unsigned(cnt_cluster)) = 0) then -- high when going to the next row
						cnt_row <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_row)) + 1, 10));

--						if((to_integer(unsigned(cnt_row)) >= 490) and (to_integer(unsigned(cnt_row)) <= 491)) then
--							vsync <= '0'; -- create vsync signal
--							cnt_y <= (others => '1');
--						else
--							vsync <= '1';
--						end if;

						if(to_integer(unsigned(cnt_row)) = 0 or to_integer(unsigned(cnt_row)) = 492) then
							vsync <= '1';
						elsif(to_integer(unsigned(cnt_row)) = 490) then
							vsync <= '0';
							cnt_y <= (others => '1');
						end if;
		
						if(to_integer(unsigned(cnt_row)) = 8) then
							frame_i <= '0';
						elsif(to_integer(unsigned(cnt_row)) = 524) then
							cnt_row <= (others => '0');
						elsif(to_integer(unsigned(cnt_row)) = 472) then -- rising_edge(frame)
							frame_i <= '1';

							bullet_i <= not(bullet_i); -- create bullet speed signal
						end if;
		
						if((to_integer(unsigned(cnt_row)) > 7) and (to_integer(unsigned(cnt_row)) < 472)) then
							cnt_yblck <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_yblck)) + 1, 5));
		
							if(to_integer(unsigned(cnt_yblck)) = 0) then  -- create a y signal that shows when 
								collision <= '0';						  -- to go to the next cluster row
								if(to_integer(unsigned(cnt_y)) = 15) then
									cnt_y <= (others => '0');
								else
									cnt_y <= std_logic_vector(to_unsigned(to_integer(unsigned(cnt_y)) + 1, 4));
								end if;
							elsif(to_integer(unsigned(cnt_yblck)) = 28) then
								cnt_yblck <= (others => '0');
								collision <= '1';
							end if;
						else
							cnt_yblck <= (others => '0');
						end if;
					elsif(to_integer(unsigned(cnt_cluster)) = 27) then
						cnt_cluster <= (others => '0');
					end if;
				elsif(to_integer(unsigned(cnt_clk)) = 6) then
					cnt_clk <= (others => '0');
				end if;
			end if;
		end if;
	end process;

	frame 	<= frame_i;
	bullet  <= bullet_i;
	x		<= cnt_x;
	y		<= cnt_y;
end arch;