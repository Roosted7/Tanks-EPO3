extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
network tank_hit_reg (terminal hit_in, hit_out, clk, reset, vss, vdd)
{
   {hit_reg_reg} dfr11 (hit_in, reset, clk, hit_out, vss, vdd);
}



