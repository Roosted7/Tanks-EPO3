library IEEE;
use IEEE.std_logic_1164.all;

entity delete_bullet is
  port( l_postmux, feedback, coll   : in std_logic;
        l_postdelete                : out std_logic);
end delete_bullet;

architecture delete_bullet_arch of delete_bullet is

  signal feedback_inv, sel  : std_logic;
  
begin
  --feedback: '0' when death command, '1' when stay alive command.
  feedback_inv <= not(feedback);
  
  --death command either from feedback or bullet_coll block
  sel <= feedback_inv or coll;
  
  --when death command, force existence bit zero, else keep as it was.
  l_postdelete <= '0' when (sel='1') else l_postmux;
  
end delete_bullet_arch;
