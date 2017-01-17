library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of coll_handler is
begin
red <= (k1 and (not m)) or ((not t2) and (not k2) and (not m));
green <= (k2 and not(t2) and (not m)) or ((not t1) and (not t2) and (not k1) and (not m));
blue <= ((not k1) and k2 and (not m)) or ((not t1) and (not k2) and (not m));
t1_n <= (not v) or (not t1) or (not k2) or t2_rip;
t2_n <= (not v) or (not t2) or (not k1) or t1_rip;
k1_n <= (not v) or (not k1) or ((not t2) and (not k2) and (not m));
k2_n <= (not v) or (not k2) or ((not t1) and (not k1) and (not m));
end behaviour;


