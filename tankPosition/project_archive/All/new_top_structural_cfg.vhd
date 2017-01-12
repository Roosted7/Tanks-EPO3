configuration new_top_structural_cfg of new_top is
   for structural
      for all: counter3bit use configuration work.counter3bit_synthesised_cfg;
      end for;
      for all: tank_pos_top_level use configuration work.tank_pos_top_level_synthesised_cfg;
      end for;
   end for;
end new_top_structural_cfg;


