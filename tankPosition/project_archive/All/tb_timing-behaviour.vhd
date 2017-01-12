library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tb_timing is

component new_top is
   port(input_direction_1	:in    std_logic_vector(2 downto 0);
        input_direction_2	:in    std_logic_vector(2 downto 0);
        old_pos_1			  :in    std_logic_vector(9 downto 0);
        new_pos_1			  :out   std_logic_vector(9 downto 0);
        old_pos_2			  :in    std_logic_vector(10 downto 0);
        new_pos_2			  :out   std_logic_vector(9 downto 0);
        clk      			 :in    std_logic;
		reset 			: in std_logic

);
end component;
signal input_direction_1, input_direction_2 : std_logic_vector(2 downto 0);
signal  old_pos_2 : std_logic_vector(10 downto 0);
signal old_pos_1,new_pos_1, new_pos_2 : std_logic_vector(9 downto 0);

signal clk : std_logic := '0';
signal reset : std_logic;

begin

L1: new_top port map(input_direction_1, input_direction_2, old_pos_1, new_pos_1,old_pos_2, new_pos_2, clk,reset);

clk <= not clk after 82 ns;

old_pos_1 <= "0011000110"; --3,1 naar rechts
old_pos_2 <= "10001000100"; --1,1 naar links

input_direction_1 <= "010"; --beweeg rechts
input_direction_2 <= "000"; --beweeg links
reset <= '1' after 0 ns, '0' after 1000 ns;


end behaviour;










