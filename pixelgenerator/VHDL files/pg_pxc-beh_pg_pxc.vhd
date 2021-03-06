library ieee;
use ieee.std_logic_1164.all;


architecture beh_pg_pxc of pg_pxc is
	-- signal int_x(i) indicates whether the ith tank x 
	--  coordinate bit and ith video x coordinate coincide
	signal int_x, int_y	: std_logic_vector (3 downto 0);

begin
	int_x(3) <= x_tank(3) xnor x_video(3);
	int_x(2) <= x_tank(2) xnor x_video(2);
	int_x(1) <= x_tank(1) xnor x_video(1);
	int_x(0) <= x_tank(0) xnor x_video(0);
	
	int_y(3) <= y_tank(3) xnor y_video(3);
	int_y(2) <= y_tank(2) xnor y_video(2);
	int_y(1) <= y_tank(1) xnor y_video(1);
	int_y(0) <= y_tank(0) xnor y_video(0);

	-- output equals 1 when all intersections are 1
	intersect <= (int_x(3) and int_x(2) and int_x(1) and int_x(0)) 
		and (int_y(3) and int_y(2) and int_y(1) and int_y(0));
end beh_pg_pxc;





