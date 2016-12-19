library ieee;
use ieee.std_logic_1164.all;

architecture beh_pg_fsm of pg_fsm is
-- defining the states of the fsm
type fsm_states is (idle, read);
signal state, new_state : fsm_states;

begin
--process describing a state register
process (clk, reset)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then
			state <= idle;
		else
			state <= new_state;
		end if;
	end if;
end process;
-- process describing the combinatorial logic of the fsm
process (tank_x_reg, tank_x_in, tank_y_reg, tank_y_in, tank_or_reg, tank_or_in, update_pos, state)
-- fsm stays in current state untill the frame changes
begin
	new_state <= state;
	case state is
		when idle =>
			tank_x_out <= tank_x_reg;
			tank_y_out <= tank_y_reg;
			tank_or_out <= tank_or_reg;
			-- when frame becomes 1, the next state of 
			--  the fsm is read
			if update_pos = "101" then
				new_state <= read;
			end if;
		when read =>
			-- in this state, the input is sampled
			tank_x_out <= tank_x_in;
			tank_y_out <= tank_y_in;
			tank_or_out <= tank_or_in;
			-- the next clock cycle, the state is idle_high
			new_state <= idle;
	end case;
end process;
			
end beh_pg_fsm;
