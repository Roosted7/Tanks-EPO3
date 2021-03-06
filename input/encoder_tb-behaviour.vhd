library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of encoder_tb is
component encoder is
	port(p_l 	  :in    std_logic;
        p_r	   :in    std_logic;
        p_u   	:in    std_logic;
        p_d	   :in    std_logic;
        p_f	   :in    std_logic;
        t_e    :out   std_logic_vector(2 downto 0));
end component;
	
signal p_l,p_r,p_u,p_d,p_f 				: std_logic;
signal input 				: std_logic_vector(4 downto 0);
signal output				: std_logic_vector(2 downto 0);
signal test_clk,start				: std_logic;	
begin
lbl1 : encoder port map(p_l=>p_l,p_r=>p_r,p_u=>p_u,p_d=>p_d,p_f=>p_f,t_e=>output);
p_l <= input(4);
p_r <= input(3);
p_u <= input(2);
p_d <= input(1);
p_f <= input(0);

start <= '0' after 0 ns, '1' after 125 ns;
test_clk <= '1' after 0 ns, '0' after 60 ns when test_clk /= '0' else '1' after 60 ns;

process(test_clk,start)
begin

if(test_clk'event and test_clk='1') then
	if(start='0') then
		input <= "00000";
	else
		input <= std_logic_vector(unsigned(input)+1);
	end if;
end if;
end process;

end behaviour;




















