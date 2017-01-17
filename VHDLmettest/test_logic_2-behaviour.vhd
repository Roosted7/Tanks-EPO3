library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of test_logic_2 is
begin

pass <= ((not c_4) and (not c_3) and (not c_2) and t_e(2) and (not t_e(1)) and (not t_e(0))) or 
	((not c_3) and (not c_2) and (not c_1) and t_e(2) and (not t_e(1)) and (not t_e(0))) or
	((not c_5) and (not c_4) and c_3 and (not c_2) and (not t_e(2)) and t_e(1) and t_e(0)) or 
	((not c_5) and c_4 and (not c_3) and c_2 and t_e(2) and (not t_e(1)) and t_e(0)) or 
	(c_5 and (not c_4) and (not c_3) and c_2 and t_e(2) and (not t_e(1)) and t_e(0)) or 
	((not c_5) and c_4 and c_3 and (not c_2) and t_e(2) and (not t_e(1)) and t_e(0)) or 
	(c_5 and (not c_4) and c_3 and (not c_2) and t_e(2) and (not t_e(1)) and t_e(0)) or 
	(c_5 and c_3 and c_2 and c_1 and t_e(2) and (not t_e(1)) and (not t_e(0))) or 
	(c_4 and c_3 and c_2 and c_1 and t_e(2) and (not t_e(1)) and (not t_e(0))) or 
	(c_3 and c_2 and c_1 and c_0 and t_e(2) and (not t_e(1)) and (not t_e(0))) or 
	((not c_5) and (not c_3) and (not c_2) and (not c_0) and t_e(2) and (not t_e(1)) and (not t_e(0))) or 
	(c_5 and c_4 and (not c_3) and c_2 and (not t_e(2)) and (not t_e(1)) and (not t_e(0))) or 
	(c_5 and c_4 and c_3 and (not c_2) and (not t_e(2)) and (not t_e(1)) and (not t_e(0))) or
	(c_5 and c_4 and c_3 and c_2 and c_0 and t_e(2) and (not t_e(1)) and (not t_e(0))) or
	((not c_5) and (not c_4) and (not c_3) and (not c_1) and (not c_0) and t_e(2) and (not t_e(1)) and (not t_e(0))) or 
	((not c_5) and (not c_4) and c_3 and (not c_1) and (not t_e(2)) and t_e(1) and t_e(0)) or
	((not c_5) and c_4 and c_2 and (not c_1) and t_e(2) and (not t_e(1)) and t_e(0)) or
	(c_5 and (not c_4) and c_2 and (not c_1) and t_e(2) and (not t_e(1)) and t_e(0)) or
	(c_5 and c_4 and (not c_2) and c_1 and (not t_e(2)) and (not t_e(1)) and (not t_e(0))) or
	((not c_5) and (not c_4) and (not c_3) and c_2 and c_0 and (not t_e(2)) and t_e(1) and t_e(0)) or
	((not c_5) and (not c_4) and c_2 and c_1 and (not c_0) and (not t_e(2)) and t_e(1) and t_e(0)) or
	((not c_5) and c_4 and (not c_2) and c_1 and c_0 and t_e(2) and (not t_e(1)) and t_e(0)) or
	(c_5 and c_4 and c_2 and (not c_1) and (not c_0) and (not t_e(2)) and (not t_e(1)) and (not t_e(0)));

end behaviour;







