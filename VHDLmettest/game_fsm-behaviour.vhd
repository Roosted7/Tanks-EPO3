library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of game_fsm is

type state_type is (state_start, state_game, state_end); 
signal state, next_state : state_type := state_start; 
signal start, idle_i : std_logic; 

begin 
process(fire_t1, fire_t2, exist_t1, exist_t2, state) is 
	begin 
		case state is 
			when state_start => 
				start <= '1';	
				idle_i <= '1'; 
				if (fire_t1 = '1' and fire_t2 = '1') then
					next_state <= state_game; 
				else 
					next_state <= state_start; 
				end if; 

			when state_game => 
				start <= '0'; 
				idle_i <= '0'; 
				if (exist_t1 = '0' or exist_t2 = '0') then 
					next_state <= state_end;
				else 
					next_state <= state_game; 
				end if; 

			when state_end => 
				start <= '0'; 
				idle_i <= '1'; 
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

process(start, draw_endscreen, draw_startscreen, exist_t1, idle_i, rgb)
begin
if(idle_i = '1') then
	if (start = '0') then 					-- end screen is generated  
		if (draw_endscreen = '0') then 
			if 	(exist_t1 = '1') then 
			-- player 1 wins 
				rgb_out <= "100"; 
			else 	
			-- player 2 wins 
				rgb_out <= "001";
			end if;
		else 
				rgb_out <= "000";
		end if; 
	else 					-- start screen is generated 	
		if (draw_startscreen = '0') then  
			rgb_out <= "010"; 
		else
			rgb_out <= "000";
		end if; 
	end if;
else
	rgb_out <= rgb;
end if;

end process;

idle <= idle_i;

end behaviour;

















