library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_system is
component encoder is
   port(p_l 	  :in    std_logic;
        p_r	   :in    std_logic;
        p_u   	:in    std_logic;
        p_d	   :in    std_logic;
        p_f	   :in    std_logic;
        t_e    :out   std_logic_vector(2 downto 0));
end component;

type input_state is (
	idle,
	output,
	standby);

signal t_e_1 : std_logic_vector(2 downto 0);
signal t1_e : std_logic_vector(2 downto 0);
signal new_t1_e : std_logic_vector(2 downto 0);
signal state, new_state : input_state;
signal frame_prev : std_logic;

begin

encoder_1 : encoder port map (p_l => p_l,
				p_r => p_r,
				p_u => p_u,
				p_d => p_d,
				p_f => p_f,
				t_e => t_e_1);
				

process(clk, reset)
begin
if(reset = '0') then
	if(rising_edge(clk)) then
		state <= new_state;
		
		t1_e <= new_t1_e;	

		frame_prev <= frame;
	end if;
else
	state <= idle;
	t1_e <= "000";
end if;
end process;

process(state, t_e_1, frame)
begin
case state is
	when idle =>
		new_t1_e <= "100";
		if(t_e_1 = "100") then
			new_state <= output;
		else
			new_state <= idle;
		end if;
	when output =>
		if(frame = '1' and frame_prev = '0') then
			new_t1_e <= "100";
			new_state <= idle;
		else
			new_t1_e <= t_e_1;
			if(t_e_1 /= "100") then
				new_state <= standby;
			else
				new_state <= output;
			end if;
		end if;
	when standby =>
		if(frame = '1' and frame_prev = '0') then
			new_t1_e <= "100";
			new_state <= idle;
		else
			new_t1_e <= t1_e;
			new_state <= standby;
		end if;
end case;
end process;
		
t_e <= t1_e;
	
end behaviour;





























































































































