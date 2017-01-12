library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of new_pos_vec_tb is

component new_pos_vec is
   port(new_pos 			 :in    std_logic_vector(3 downto 0);
        old_pos 			 :in    std_logic_vector(7 downto 0);
        input_direction0	:in    std_logic;
        new_pos_vector   :out   std_logic_vector(7 downto 0));
end component;

signal new_pos : std_logic_vector (3 downto 0);
signal old_pos, new_pos_vector : std_logic_vector( 7 downto 0);
signal input_direction0 : std_logic;


begin

lbl1: new_pos_vec port map(
			new_pos => new_pos,
			old_pos => old_pos,
			input_direction0 => input_direction0,
			new_pos_vector => new_pos_vector
			);

new_pos <= "0000" after 0 ns;
old_pos <= "11111111" after 0 ns;
input_direction0 <= '0' after 0 ns, '1' after 100 ns;
end behaviour;


