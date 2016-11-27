set vdd = h*~
set vss = l*~
set hit_in = h*~
set clk = (h*82 l*82)*4\
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
      reset

plot \
      hit_in,\
      hit_out,\
      clk,\
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


