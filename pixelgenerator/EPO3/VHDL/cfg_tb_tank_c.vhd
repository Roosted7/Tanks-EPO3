configuration cfg_tb_tank_c of tb_tank_comp is
   for beh_tb_tank_c
      for all: tank_comp use configuration work.cfg_tank_comp;
      end for;
   end for;
end cfg_tb_tank_c;


