library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture beh_pxg of tb_pg_pxg is

	component pg_pxg is
   	port(
		-- Input from the registers
		x_in 	 	:in    std_logic_vector(3 downto 0); 
	        y_in 		:in    std_logic_vector(3 downto 0);
        		theta	     	:in    std_logic_vector(1 downto 0);
		-- Output in individual parts
	        x_head  	:out   std_logic_vector(3 downto 0);
	        y_head       	:out   std_logic_vector(3 downto 0);
        		x_left_leg   	:out   std_logic_vector(3 downto 0);
        		y_left_leg   	:out   std_logic_vector(3 downto 0);
        		x_right_leg  	:out   std_logic_vector(3 downto 0);
        		y_right_leg  	:out   std_logic_vector(3 downto 0);
        		x_left_foot  	:out   std_logic_vector(3 downto 0);
        		y_left_foot  	:out   std_logic_vector(3 downto 0);
        		x_right_foot 	:out   std_logic_vector(3 downto 0);
        		y_right_foot 	:out   std_logic_vector(3 downto 0));
	end component;
	
	signal x_in, y_in, x_head, y_head, x_left_leg,
	 y_left_leg, x_right_leg, y_right_leg, x_left_foot, y_left_foot,
	 x_right_foot, y_right_foot : std_logic_vector (3 downto 0);
	signal theta : std_logic_vector (1 downto 0);
	signal vector : std_logic_vector (9 downto 0);
	signal i : unsigned (9 downto 0);

begin
	x_in <= vector (3 downto 0);
	y_in <= vector (7 downto 4);
	theta <= vector (9 downto 8);

l0:	pg_pxg port map (x_in, y_in, theta, x_head, y_head, x_left_leg, 
	 y_left_leg, x_right_leg, y_right_leg,
	 x_left_foot, y_left_foot, x_right_foot, y_right_foot);

l1:	process
	begin
	
	vector <= "0000000000";

	for i in 0 to 1023 loop
		wait for 100 ns;
		vector <= std_logic_vector (unsigned(vector) + '1');
		
		wait for 100 ns;
	end loop;
	
	wait for 100 ns;
   end process;
end beh_pxg;





