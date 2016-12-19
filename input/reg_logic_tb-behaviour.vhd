library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of reg_logic_tb is
component register_logic is
	port(enable:in		  std_logic_vector(1 downto 0);
	reg_in:in    std_logic_vector(2 downto 0);
        enc_in:in    std_logic_vector(2 downto 0);
        output:out   std_logic_vector(2 downto 0));
end component;

signal enable : std_logic_vector(1 downto 0);
signal reg_in, enc_in, output : std_logic_vector(2 downto 0);
begin
lbl1: register_logic port map(
			enable => enable, 
			reg_in => reg_in,
			enc_in => enc_in,
			output => output);
reg_in <= "111";
enc_in <= "000";

enable <= "00" after 0 ns, "01" after 100 ns, "10" after 200 ns, "11" after 300 ns;
end behaviour;


