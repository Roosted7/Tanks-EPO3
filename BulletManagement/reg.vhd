library IEEE;
use IEEE.std_logic_1164.all;

entity reg_11 is
  port( clk     : in std_logic;
        reset   : in std_logic;
        d       : in std_logic_vector(10 downto 0)
        q       : out std_logic_vector(10 downto 0));
end reg_11;

architecture reg_11_behavioral of reg_11 is
 
begin
  
  process (clk) is
  begin
    if(rising_edge(clk) then
       if (reset = '1') then
          q <= '00000000000';
       else
          q <= d;
       end if;
    end if;
  end process;
    
end reg_11_behavioral;
