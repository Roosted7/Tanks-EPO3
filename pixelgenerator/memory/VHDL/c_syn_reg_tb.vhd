configuration c_syn_reg_tb of reg_tb is
   for b_reg_tb
      for all: tank_hit_reg use configuration work.tank_hit_reg_synthesised_cfg;
      end for;
      for all: tank_pos_reg use configuration work.tank_pos_reg_synthesised_cfg;
      end for;
   end for;
end c_syn_reg_tb;


