library IEEE;
use IEEE.std_logic_1164.ALL;

entity coll_handler is
   port(t1       :in    std_logic;
        t2       :in    std_logic;
        k1       :in    std_logic;
        k2       :in    std_logic;
        m        :in    std_logic;
        v        :in    std_logic;
	t1_rip	 :in	  std_logic;
	t2_rip	 :in    std_logic;
        red      :out   std_logic;
	green    :out   std_logic;
	blue     :out   std_logic;
        t1_n   	 :out   std_logic;
	t2_n   	 :out   std_logic;
	k1_n   	 :out   std_logic;
	k2_n   	 :out   std_logic);
end coll_handler;





