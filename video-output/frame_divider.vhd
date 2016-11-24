library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity frame_div is
	port(
		frame: in std_logic,
		vbullet: out std_logic);
end frame_div;

architecture arch of frame_div is
begin
	process(frame)
	begin
		if(rising_edge(frame)) then
			vbullet <= not(vbullet);
		end if;
	end process;
end arch;