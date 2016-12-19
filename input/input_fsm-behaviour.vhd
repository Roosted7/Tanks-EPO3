library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_fsm is

type input_state is (
	idle,
	output,
	standby_1,
	standby_2);

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

process(state, dec_in, tf_rise, counter)
begin
case state is
	when idle =>
		enable <= "00";
		counter_enable <= '0';
		if(dec_in = "100") then
			new_state <= output;
		else
			new_state <= idle;
		end if;
	when output =>
		enable <= "01";
		counter_enable <= '0';
		if(tf_rise = '1') then
			new_state <= standby_2;
		else
			if(dec_in /= "100") then
				new_state <= standby_1;
			else
				new_state <= output;
			end if;
		end if;
	when standby_1 =>
		enable <= "10";
		counter_enable <= '0';
		if(tf_rise = '1') then
			new_state <= standby_2;
		else
			new_state <= standby_1;
		end if;
	when standby_2 =>
		enable <= "10";
		counter_enable <= '1';
		if(counter = "111") then
			--counter_enable <= '0';
			new_state <= idle;
		else
			--counter_enable <= '1';
			new_state <= standby_2;
		end if;
end case;
end process;
	
end behaviour;
























