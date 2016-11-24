library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity frame_div is
	port(
		sixtyhertz, reset: in std_logic,
		thirtyhertz: out std_logic);
end frame_div;

architecture arch of frame_div is
	