library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of audio is

component tff 
port( 	t	: in 	std_logic; 
	reset	: in 	std_logic; 
	q	: out 	std_logic); 
end component; 

component reset_freq is
   port(		tone      		:in    	std_logic_vector(2 downto 0);
		idle 		:in 	std_logic; 
        		count_freq		:in    	std_logic_vector(6 downto 0);
        		res_freq  		:out   	std_logic);
end component;

component counter is 
port ( 	f30khz 		:	in	std_logic; 
	countreset		: 	in 	std_logic;
	reset		: 	in	std_logic;	
	count		: 	out	std_logic_vector(6 downto 0)); 
end component; 

component metronome is 
port (	clk_30hz 		: in 	std_logic; 
	clk_2hz 		: out 	std_logic); 
end component; 

component tune is 
port (	clk_2hz : in 		std_logic; 
	note 	: out 	std_logic_vector(2 downto 0);
	idle 	: out 	std_logic); 
end component; 

signal clk_2 			: std_logic; 
signal idle 			: std_logic; 
signal note 			: std_logic_vector(2 downto 0); 
signal count_reset 			: std_logic; 
signal count 			: std_logic_vector(6 downto 0); 
signal q 			: std_logic; 

begin

metronome_block : 			metronome port map (clk_30, clk_2); 
tune_block : 			tune port map (clk_2, note, idle); 

counter_block: 			counter port map (clk_30k, count_reset, reset, count); 
period_reset : 			reset_freq port map( note, idle, count, count_reset); 

freq_gen: 			tff port map (count_reset, reset, q); 

music <= idle nor q ; 

end behaviour;








