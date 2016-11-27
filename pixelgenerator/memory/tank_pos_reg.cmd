set vdd = h*~
set vss = l*~
set hit_in = h*~
set clk = (h*82 l*82)*4\
          h*82 l*~
set reset = h*163 l*~
set tank_x_in_3_0_3 = x*82 h*~
set tank_x_in_3_0_2 = x*82 h*~
set tank_x_in_3_0_1 = h*~
set tank_x_in_3_0_0 = x*82 h*~
set tank_y_in_3_0_3 = x*82 h*~
set tank_y_in_3_0_2 = x*82 l*~
set tank_y_in_3_0_1 = h*~
set tank_y_in_3_0_0 = x*82 l*~
set tank_or_in_1_0_1 = x*82 h*~
set tank_or_in_1_0_0 = x*82 h*~
set update_pos = (h*82 l*82)*4\
                 h*82 l*~
set reset = h*163 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 738

print \
      hit_in,\
      hit_out,\
      clk,\
      reset,\
      tank_x_in_3_0_3,\
      tank_x_in_3_0_2,\
      tank_x_in_3_0_1,\
      tank_x_in_3_0_0,\
      tank_x_out_3_0_3,\
      tank_x_out_3_0_2,\
      tank_x_out_3_0_1,\
      tank_x_out_3_0_0,\
      tank_y_in_3_0_3,\
      tank_y_in_3_0_2,\
      tank_y_in_3_0_1,\
      tank_y_in_3_0_0,\
      tank_y_out_3_0_3,\
      tank_y_out_3_0_2,\
      tank_y_out_3_0_1,\
      tank_y_out_3_0_0,\
      tank_or_in_1_0_1,\
      tank_or_in_1_0_0,\
      tank_or_out_1_0_1,\
      tank_or_out_1_0_0,\
      update_pos,\
      reset

plot \
      hit_in,\
      hit_out,\
      clk,\
      reset,\
      tank_x_in_3_0_3,\
      tank_x_in_3_0_2,\
      tank_x_in_3_0_1,\
      tank_x_in_3_0_0,\
      tank_x_out_3_0_3,\
      tank_x_out_3_0_2,\
      tank_x_out_3_0_1,\
      tank_x_out_3_0_0,\
      tank_y_in_3_0_3,\
      tank_y_in_3_0_2,\
      tank_y_in_3_0_1,\
      tank_y_in_3_0_0,\
      tank_y_out_3_0_3,\
      tank_y_out_3_0_2,\
      tank_y_out_3_0_1,\
      tank_y_out_3_0_0,\
      tank_or_in_1_0_1,\
      tank_or_in_1_0_0,\
      tank_or_out_1_0_1,\
      tank_or_out_1_0_0,\
      update_pos,\
      reset
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


