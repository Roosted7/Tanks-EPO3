library IEEE;
use IEEE.std_logic_1164.all;

entity reg_11 is
  port( clk	: in std_logic;
	b_clk   : in std_logic;
        reset   : in std_logic;
        d       : in std_logic_vector(10 downto 0);
        q       : out std_logic_vector(10 downto 0));
end reg_11;

architecture reg_11_arch of reg_11 is
 signal old, bclk: std_logic;
begin
  process(clk)
  begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				old <= '0';
				bclk <= '0';
			else
				if(b_clk = '1' and old = '0') then
					bclk <= '1';
				else
					bclk <= '0';
				end if;
				
				old <= b_clk;
			end if;
		end if;
	end process;
				
  process (clk) is
  begin
    if(rising_edge(clk)) then
       if (reset = '1') then
          q <= "00000000000"; 
       else
          if(bclk = '0') then
		q(10) <= d(10);
	  else
		q <= d;
	  end if;				
       end if;
    end if;
  end process;
    
end reg_11_arch;
