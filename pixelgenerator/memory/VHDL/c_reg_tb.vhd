configuration c_reg_tb of reg_tb is
   for b_reg_tb
      for all: tank_hit_reg use configuration work.c_tank_hit_reg;
      end for;
      for all: tank_pos_reg use configuration work.c_tank_pos_reg;
      end for;
   end for;
end c_reg_tb;


