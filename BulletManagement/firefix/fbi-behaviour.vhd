library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of fbi is

component mem
   port(d    :in    std_logic;
        q    :out   std_logic;
        reset:in    std_logic;
        bclk :in    std_logic;
        clk  :in    std_logic);
end component;


component delay
port(	inp	:in std_logic;
	outp	:out std_logic;
	clk	:in std_logic;
	reset	:in std_logic);
end component;

component pulse
port(	clk	:in std_logic;
	bulletd	:in std_logic;
	bulletc :in std_logic;
	pulse	:out std_logic);
end component;

component s
port(	inp	:in std_logic_vector(2 downto 0);
	outp	:out std_logic);
end component;

component s_inv
port(	inp	:in std_logic;
	outp	:out std_logic_vector(2 downto 0));
end component;


signal bclk_d : std_logic;
signal pulseb	: std_logic;
signal fin	   : std_logic;
signal fout   : std_logic;

begin
mem1: mem port map(			fin,
			fout,
			reset,
			pulseb,
			clk);

del1: delay port map(			bclk,
			bclk_d,
			clk,
			reset);

pul1: pulse port map(			clk,
			bclk_d,
			bclk,
			pulseb);

s1: s port map(			infbi,
			fin);

s_inv1: s_inv port map(			fout,
			outfbi);
end behaviour;























