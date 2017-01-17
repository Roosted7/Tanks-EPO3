library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of test_logic_1 is

component pass_gate is
   port(input :in    std_logic;
        output:out   std_logic);
end component;

signal pass: std_logic;

begin
p_l <= (c_5 and (not c_4) and c_0) or 
	((not c_5) and c_4 and (not c_1) and c_0) or 
	(c_5 and (not c_4) and (not c_2) and c_1) or 
	((not c_5) and c_4 and c_2 and c_0);
p_r <= ((not c_5) and c_4 and (not c_2) and (not c_1) and (not c_0)) or 
	(c_5 and (not c_4) and (not c_2) and (not c_0));
p_u <= ((not c_5) and c_4 and (not c_2) and c_1) or 
	(c_5 and (not c_4) and (not c_1) and c_0) or 
	((not c_5) and c_4 and c_2 and (not c_0));
p_d <= (c_5 and (not c_4) and (not c_1) and (not c_0)) or 
	(c_5 and c_4 and (not c_3) and (not c_2) and (not c_1) and c_0) or 
	((not c_5) and (not c_4) and (not c_2) and c_1);
p_f <= (c_5 and c_4) or 
	(c_4 and (not c_2) and (not c_1)) or 
	(c_4 and c_2 and c_0) or 
	(c_5 and (not c_1) and c_0);
pass <= (c_3 and (not c_2)) or (c_5 and (not c_3) and c_2) or 
	((not c_4) and c_3 and (not c_1)) or 
	((not c_3) and c_2 and c_0) or 
	((not c_5) and c_4 and c_2 and (not c_1)) or 
	((not c_5) and c_2 and c_1 and (not c_0)) or 
	(c_4 and c_2 and (not c_1) and (not c_0)) or 
	(c_5 and c_4 and (not c_2) and c_1 and c_0);


lbl1 : pass_gate port map(input => pass, output => tf);
end behaviour;




















