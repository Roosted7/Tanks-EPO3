library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

architecture behaviour of gen_bullet is 
signal dir_t1 : std_logic_vector(1 downto 0); 
signal x_t1, x_b1, y_t1, y_b1 : std_logic_vector(3 downto 0); 
signal l, l_b1 : std_logic; 
begin

dir_t1(0)<= tank_b1(0); 
dir_t1(1)<= tank_b1(1); 
y_t1(0) 	<= tank_b1(2);
y_t1(1) 	<= tank_b1(3);
y_t1(2)  <= tank_b1(4);
y_t1(3)  <= tank_b1(5);

x_t1(0)  <= tank_b1(6);
x_t1(1)  <= tank_b1(7);
x_t1(2)	 <= tank_b1(8);
x_t1(3)	 <= tank_b1(9);

l 	 <= tank_b1(10); 

process (l, fire_b1, dir_t1, x_t1, y_t1)
begin 
if ((l = '1') and (fire_b1 = "101")) then 
	if  	( (dir_t1 = "00") and not(x_t1 = "0000") ) then 
			x_b1 <= std_logic_vector(to_unsigned(to_integer(unsigned(x_t1)) - 1, 4)); 
			y_b1 <= y_t1; 
			l_b1 <= '1' ;
	elsif ( dir_t1 = "01" and not(y_t1 = "0000") ) then 
			x_b1 <= x_t1; 
			y_b1 <= std_logic_vector(to_unsigned(to_integer(unsigned(y_t1)) + 1, 4));
			l_b1 <= '1' ;

	elsif ( dir_t1 = "10" and not(x_t1 = "1111") ) then 
			x_b1 <= std_logic_vector(to_unsigned(to_integer(unsigned(x_t1)) + 1, 4));
			y_b1 <= y_t1;
			l_b1 <= '1' ;
 
	elsif ( dir_t1 = "11" and not(y_t1 = "1111") ) then
			x_b1 <= x_t1; 
			y_b1 <= std_logic_vector(to_unsigned(to_integer(unsigned(y_t1)) - 1, 4));
			l_b1 <= '1' ;	

	else  
			x_b1 <= x_t1;
			y_b1 <= y_t1; 
			l_b1 <= '0'; 
 
	end if; 
else  
	x_b1 <= x_t1;
	y_b1 <= y_t1; 
	l_b1 <= '0'; 
end if; 
end process; 

gen_b1(0) 	<= tank_b1(0); 
gen_b1(1) 	<= tank_b1(1); 
gen_b1(2) 	<= y_b1(0); 
gen_b1(3) 	<= y_b1(1);
gen_b1(4) 	<= y_b1(2);
gen_b1(5) 	<= y_b1(3); 
gen_b1(6) 	<= x_b1(0);
gen_b1(7) 	<= x_b1(1);
gen_b1(8) 	<= x_b1(2);
gen_b1(9) 	<= x_b1(3);
gen_b1(10) <= l_b1; 


end behaviour;














