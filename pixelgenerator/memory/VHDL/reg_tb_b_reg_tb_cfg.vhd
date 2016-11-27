configuration reg_tb_b_reg_tb_cfg of reg_tb is
   for b_reg_tb
      for all: tank_hit_reg use configuration work.c_tank_hit_reg;
      end for;
      for all: tank_pos_reg use configuration work.tank_pos_reg_extracted_cfg;
      end for;
   end for;
end reg_tb_b_reg_tb_cfg;


