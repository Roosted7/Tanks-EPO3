library ieee;
use ieee.std_logic_1164.all;

architecture beh_fsm of tb_pg_fsm is

	component pg_fsm is
   	port(		clk  		: in    std_logic;
	        		reset		: in    std_logic;
 	       		update_pos		: in    std_logic_vector(2 downto 0);
			tank_x_reg 		: in 	std_logic_vector(3 downto 0);
			tank_x_in 		: in 	std_logic_vector(3 downto 0);
			tank_y_reg 		: in	std_logic_vector(3 downto 0);
			tank_y_in 		: in 	std_logic_vector(3 downto 0);
			tank_or_reg 		: in 	std_logic_vector(1 downto 0);
			tank_or_in 		: in 	std_logic_vector(1 downto 0);
			tank_y_out 		: out 	std_logic_vector(3 downto 0);
			tank_x_out  		: out 	std_logic_vector(3 downto 0);
			tank_or_out		: out 	std_logic_vector(1 downto 0)
			);
	end component;

	signal clk, reset: std_logic;
	signal tank_x_reg, tank_x_in, tank_x_out, tank_y_reg, 
		tank_y_in, tank_y_out : std_logic_vector (3 downto 0);
	signal tank_or_reg, tank_or_in, 
		tank_or_out : std_logic_vector (1 downto 0);

	signal update_pos : std_logic_vector(2 downto 0);
begin

l0:	pg_fsm port map (clk, reset, update_pos, tank_x_reg, tank_x_in, 
				tank_y_reg, tank_y_in, tank_or_reg, 
				tank_or_in, tank_y_out, tank_x_out, 
				tank_or_out);
	
	clk <= '1' after 0 ns, '0' after 150 ns when clk /= '0' else '1' after
		150 ns;
	reset <= '1' after 0 ns, '0' after 450 ns;
	update_pos <= "000" after 0 ns, 
		      "101" after 850 ns,
		      "000" after 950 ns;
	
	tank_x_reg <= "0001" after 0 ns,
			"0001" after 750 ns,
			"0001" after 1050 ns,
			"0001" after 1650 ns;

	tank_x_in <= "0011" after 0 ns,
			"0011" after 750 ns,
			"0011" after 1050 ns,
			"0011" after 1650 ns;

	tank_y_reg <= "0100" after 0 ns,
			"0100" after 750 ns,
			"0100" after 1050 ns,
			"0100" after 1650 ns;

	tank_y_in <= "1100" after 0 ns,
			"1100" after 750 ns,
			"1100" after 1050 ns,
			"1100" after 1650 ns;

	tank_or_reg <= "00" after 0 ns;
	tank_or_in <= "11" after 0 ns;

end beh_fsm;



















