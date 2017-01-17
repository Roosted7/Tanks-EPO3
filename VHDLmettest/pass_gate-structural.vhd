library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of pass_gate is
component not_gate is
   port(input :in    std_logic;
        output:out   std_logic);
end component;
signal s : std_logic;
begin
lbl1 : not_gate port map(
		input => input,
		output => s);
lbl2 : not_gate port map(
		input => s,
		output => output);
end structural;


