library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of new_top is

component tank_pos_top_level is
   port(input_direction_1	:in    std_logic_vector(2 downto 0);
        input_direction_2	:in    std_logic_vector(2 downto 0);
        old_pos_1			  :in    std_logic_vector(10 downto 0);
        new_pos_1			  :out   std_logic_vector(9 downto 0);
        old_pos_2			  :in    std_logic_vector(10 downto 0);
        new_pos_2			  :out   std_logic_vector(9 downto 0);
        count_in      			 :in    std_logic_vector(2 downto 0));
end component;


component counter3bit is
    Port ( CLK : in  STD_LOGIC;
           Count : out  STD_LOGIC_VECTOR (2 downto 0));
end component;


signal count : std_logic_vector(2 downto 0);


begin

lbl0: counter3bit port map (clk, count);

lbl1: tank_pos_top_level port map (input_direction_1 => input_direction_1, 
input_direction_2 => input_direction_2, old_pos_1(9 downto 0) => old_pos_1, old_pos_1(10) => '0',
 new_pos_1 => new_pos_1, old_pos_2 => old_pos_2, new_pos_2 => new_pos_2, count_in => count);


end structural;





