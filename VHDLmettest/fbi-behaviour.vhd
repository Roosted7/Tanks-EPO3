library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of fbi is

component mem
   port(d    :in    std_logic;
        q    :out   std_logic_vector(2 downto 0);
        reset:in    std_logic;
        bclk :in    std_logic;
        clk  :in    std_logic);
end component;

component s
   port(inp :in    std_logic_vector(2 downto 0);
        outp:out   std_logic);
end component;

component delay
port(	inp	:in std_logic;
	outp	:out std_logic;
	clk	:in std_logic;
	reset	:in std_logic);
end component;

signal inp_f, bclk_d1, bclk_d2 : std_logic;

begin
mem1: mem port map(			inp_f,
			outfbi,
			reset,
			bclk_d2,
			clk);

s1: s port map(			infbi,
			inp_f);

del1: delay port map(			bclk,
			bclk_d1,
			clk,
			reset);

del2: delay port map(			bclk_d1,
			bclk_d2,
			clk,
			reset);

end behaviour;








