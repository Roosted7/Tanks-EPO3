library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of fbit is

component memt
   port(d    :in    std_logic;
        q    :out   std_logic;
        reset:in    std_logic;
        bclk :in    std_logic;
        clk  :in    std_logic);
end component;


component delayt
port(	inp	:in std_logic;
	outp	:out std_logic;
	clk	:in std_logic;
	reset	:in std_logic);
end component;

signal bclk_d : std_logic;

begin
mem1: memt port map(			infbi,
			outfbi,
			reset,
			bclk_d,
			clk);

del1: delayt port map(			bclk,
			bclk_d,
			clk,
			reset);

end behaviour;

















