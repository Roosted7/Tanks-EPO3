extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
network tank_pos_reg (terminal tank_x_in_3_0_3, tank_x_in_3_0_2, 
                               tank_x_in_3_0_1, tank_x_in_3_0_0, 
                               tank_x_out_3_0_3, tank_x_out_3_0_2, 
                               tank_x_out_3_0_1, tank_x_out_3_0_0, 
                               tank_y_in_3_0_3, tank_y_in_3_0_2, 
                               tank_y_in_3_0_1, tank_y_in_3_0_0, 
                               tank_y_out_3_0_3, tank_y_out_3_0_2, 
                               tank_y_out_3_0_1, tank_y_out_3_0_0, 
                               tank_or_in_1_0_1, tank_or_in_1_0_0, 
                               tank_or_out_1_0_1, tank_or_out_1_0_0, 
                               update_pos, reset, vss, vdd)
{
   {or_in_reg_reg_1_inst} dfr11 (tank_or_in_1_0_1, reset, update_pos, 
                                 tank_or_out_1_0_1, vss, vdd);
   {or_in_reg_reg_0_inst} dfr11 (tank_or_in_1_0_0, reset, update_pos, 
                                 tank_or_out_1_0_0, vss, vdd);
   {x_in_reg_reg_3_inst} dfr11 (tank_x_in_3_0_3, reset, update_pos, 
                                tank_x_out_3_0_3, vss, vdd);
   {x_in_reg_reg_2_inst} dfr11 (tank_x_in_3_0_2, reset, update_pos, 
                                tank_x_out_3_0_2, vss, vdd);
   {x_in_reg_reg_1_inst} dfr11 (tank_x_in_3_0_1, reset, update_pos, 
                                tank_x_out_3_0_1, vss, vdd);
   {x_in_reg_reg_0_inst} dfr11 (tank_x_in_3_0_0, reset, update_pos, 
                                tank_x_out_3_0_0, vss, vdd);
   {y_in_reg_reg_3_inst} dfr11 (tank_y_in_3_0_3, reset, update_pos, 
                                tank_y_out_3_0_3, vss, vdd);
   {y_in_reg_reg_2_inst} dfr11 (tank_y_in_3_0_2, reset, update_pos, 
                                tank_y_out_3_0_2, vss, vdd);
   {y_in_reg_reg_1_inst} dfr11 (tank_y_in_3_0_1, reset, update_pos, 
                                tank_y_out_3_0_1, vss, vdd);
   {y_in_reg_reg_0_inst} dfr11 (tank_y_in_3_0_0, reset, update_pos, 
                                tank_y_out_3_0_0, vss, vdd);
}



