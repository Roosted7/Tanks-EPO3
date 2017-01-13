library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of game_fsm is

type state_type is (state_start, state_game, state_end); 
signal state, next_state : state_type := state_start; 
signal start : std_logic; 
signal rgb_0, rgb_1, rgb_2 : std_logic; 

begin 
process(fire_t1, fire_t2, exist_t1, exist_t2, state) is 
	begin 
		case state is 
			when state_start => 
				start <= '1';	
				idle <= '1'; 
				if (fire_t1 = '1' and fire_t2 = '1') then
					next_state <= state_game; 
				else 
					next_state <= state_start; 
				end if; 

			when state_game => 
				start <= '0'; 
				idle <= '0'; 
				if (exist_t1 = '0' or exist_t2 = '0') then 
					next_state <= state_end;
				else 
					next_state <= state_game; 
				end if; 

			when state_end => 
				start <= '0'; 
				idle <= '1'; 
				next_state <= state_end; 

		end case; 

end process; 
seq_proc: process is 
begin 
	wait until (rising_edge(clk)); 
		if (reset = '1') then 
			state <= state_start; 
		else 
			state <= next_state; 
		end if; 
end process; 

process(start, draw_endscreen, draw_startscreen, exist_t1, idle)
begin
if (start = '0') then 					-- end screen is generated  
	if (draw_endscreen = '0') then 
		if 	(exist_t1 = '1') then 
		-- player 1 wins 
			rgb_0 <= '1';
			rgb_1 <= '0';
			rgb_2 <= '0'; 
		else 	
		-- player 2 wins 
			rgb_0 <= '0';
			rgb_1 <= '0';
			rgb_2 <= '1'; 
		end if;
	else 
			rgb_0 <= '0';
			rgb_1 <= '0';
			rgb_2 <= '0'; 
	end if; 
else 					-- start screen is generated 	
	if (draw_startscreen = '0') then  
		rgb_0 <= '0';
		rgb_1 <= '1';
		rgb_2 <= '0'; 
	else
		rgb_0 <= '0';
		rgb_1 <= '0';
		rgb_2 <= '0'; 
	end if; 
end if;


if (idle = '1') then 					-- idle = '1' -> start/end screen will appear
					-- idle = '0' -> gameplay 
	rgb_out(2) <= rgb_2;
	rgb_out(1) <= rgb_1;
	rgb_out(0) <= rgb_0; 
else 
	rgb_out(2) <= rgb(2);
	rgb_out(1) <= rgb(1);
	rgb_out(0) <= rgb(0); 
end if; 

end process; 

end behaviour;

















