library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_fsm is

type input_state is (
	idle,
	output,
	standby);

signal state, new_state : input_state;

begin

process(clk, reset)
begin
if(reset = '0') then
	if(rising_edge(clk)) then
		state <= new_state;
	end if;
else
	state <= idle;
end if;
end process;

process(state, dec_in, tf_rise)
begin
case state is
	when idle =>
		enable <= "00";
		if(dec_in = "100") then
			new_state <= output;
		else
			new_state <= idle;
		end if;
	when output =>
		if(tf_rise = '1') then
			enable <= "00";
			new_state <= idle;
		else
			enable <= "01";
			if(dec_in /= "100") then
				new_state <= standby;
			else
				new_state <= output;
			end if;
		end if;
	when standby =>
		if(tf_rise = '1') then
			enable <= "00";
			new_state <= idle;
		else
			enable <= "10";
			new_state <= standby;
		end if;
end case;
end process;
	
end behaviour;



