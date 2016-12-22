library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of reset_freq is

-- tone = "000" lowest frequency 
-- tone = "111" highest frequency 
-- the frequency created by this block is double the actual frequency that's sent to the speaker 

-- frequencies: 

-- f5 = 1378 hz (actually 698) 	with tone = "101"		count +-= 21
-- e5 = 1318 hz (actually 659) 	with tone = "100"		count +-= 23
-- d5 = 1174 hz (actually 587)		with tone = "011"		count +-= 26
-- c5 = 1046 hz (actually 523) 	with tone = "010"		count +-= 29 
-- g4 = 784 hz 	(actually 392) 	with tone = "001"		count +-= 38 


begin

process(tone, count_freq) 

begin

if 	(idle = '1') or 
	((tone = "001") and (count_freq = "0100110")) or  
	((tone = "010") and (count_freq = "0011101")) or  
	((tone = "011") and (count_freq = "0011010")) or  
	((tone = "100") and (count_freq = "0010111")) or  
	((tone = "101") and (count_freq = "0010101")) then 

res_freq <= '1'; 

else 
res_freq <= '0';

end if; 
end process; 

end behaviour;





