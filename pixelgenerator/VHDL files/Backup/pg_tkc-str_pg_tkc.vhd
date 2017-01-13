library ieee;
use ieee.std_logic_1164.all;

architecture str_pg_tkc of pg_tkc is
	
	-- component pix_comp computes whether or not to sets of 4 
	--  bit x,y coordinates coincide.
	component pg_pxc
		port (  x_tank 		: in std_logic_vector (3 downto 0);
			y_tank		: in std_logic_vector (3 downto 0);
			x_video		: in std_logic_vector (3 downto 0);
			y_video		: in std_logic_vector (3 downto 0);
			intersect	: out std_logic
			);
	end component;

	-- signal intersections(i) indicates whether there is an 
	--  intersection between the ith x,y tank coordinates and 
	--  the video coordinates
	signal intersections : std_logic_vector (5 downto 0);

begin

l0:	pg_pxc port map (x_tank0, y_tank0, x_video, y_video, 
	 intersections(0));
l1:	pg_pxc port map (x_tank1, y_tank1, x_video, y_video, 
	 intersections(1));
l2:	pg_pxc port map (x_tank2, y_tank2, x_video, y_video, 
	 intersections(2));
l3:	pg_pxc port map (x_tank3, y_tank3, x_video, y_video, 
	 intersections(3));
l4:	pg_pxc port map (x_tank4, y_tank4, x_video, y_video, 
	 intersections(4));
l5:	pg_pxc port map (x_tank5, y_tank5, x_video, y_video, 
	 intersections(5));

	-- intersect equals 1 if at least one of the previously
	--  calculated intersection equals 1.
	intersect <= intersections(5) or intersections (4) or
	 intersections(3) or intersections(2) or 
	 intersections(1) or intersections(0);
end str_pg_tkc;





