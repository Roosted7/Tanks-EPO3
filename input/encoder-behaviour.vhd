library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of encoder is
begin
t_e(2) <= ((not p_f) and ((p_l and (not p_r) and p_u and (not p_d)) or ((not p_u) and ((p_l and (not p_r) and p_d) or ((not p_d) and (((not p_l) and (not p_r)) or (p_l and p_r))))))) or (((p_r and (not p_f) and ((p_u and (not p_d)) or ((not p_u) and p_d))) or (((p_f and ((not p_d) or p_d) and ((not p_u) or p_u)) or (p_u and p_d and (not p_f))) and ((not p_r) or p_r))) and ((not p_l) or p_l));
t_e(1) <= (not p_l) and (not p_u) and (not p_f) and ((p_r and (not p_d)) or ((not p_r) and p_d));
t_e(0) <= ((not p_l) and (not p_r) and (not p_f) and ((p_u and (not p_d)) or ((not p_u) and p_d))) or (p_f and ((not p_d) or p_d) and ((not p_u) or p_u) and ((not p_r) or p_r) and ((not p_l) or p_l));
end behaviour;





