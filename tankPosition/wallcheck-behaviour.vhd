library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of wallcheck is

component mux_8bits is
   port(new_1  :out   std_logic_vector(7 downto 0);
        old_1  :in    std_logic_vector(7 downto 0);
        old_2  :in    std_logic_vector(7 downto 0);
        control:in    std_logic);
end component mux_8bits;

component tankwalls is
   port(coord :in    std_logic_vector(7 downto 0);
        result:out   std_logic);
end component tankwalls;

component mux_1bits is
   port(new_1  :out   std_logic;
        old_1  :in    std_logic;
        old_2  :in    std_logic;
        control:in    std_logic);
end component mux_1bits;

component register1bit is
   port(D  :in    std_logic;
        Q  :out   std_logic;
        clk:in    std_logic);
end component register1bit;


signal to_wallcheck : std_logic_vector(7 downto 0);
signal result : std_logic;
signal reg1_out, reg2_out : std_logic;
signal res1 : std_logic;
signal result_tank_1, result_tank_2 : std_logic;

signal clk_for_reg_t1, clk_for_reg_t2 : std_logic;

begin

l1: mux_8bits port map (
new_1 => to_wallcheck, 
old_1 => newcoor_2 , --Inverted
old_2 => newcoor_1,
control => count_in(2));

l2: tankwalls port map (
coord => to_wallcheck, 
result => result);

l3: mux_1bits port map (
new_1 => res1,
old_1 => result,
old_2 => reg1_out,
control => count_in(2)
);

clk_for_reg_t1 <= count_in(2) and count_in(1) and count_in(0);

register_tank_1: register1bit port map (
d => result,
q => result_tank_1,
clk => clk_for_reg_t1
);

clk_for_reg_t2 <= (not count_in(2)) and count_in(1) and count_in(0);

register_tank_2: register1bit port map (
d =>result,
q => result_tank_2,
clk => clk_for_reg_t2
);

l6: mux_8bits port map (
new_1 => wc_newcoor_1,
old_1 => newcoor_1,
old_2 => oldcoor_1,
control => result_tank_1
);

l7: mux_8bits port map (
new_1 => wc_newcoor_2,
old_1 => newcoor_2,
old_2 => oldcoor_2,
control => result_tank_2
);


end behaviour;


























