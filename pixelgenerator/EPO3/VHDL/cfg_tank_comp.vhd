configuration cfg_tank_comp of tank_comp is
   for str_tank_comp
      for all: pix_comp use configuration work.cfg_pix_comp;
      end for;
   end for;
end cfg_tank_comp;


