configuration tank_pos_top_level_synthesised_cfg of tank_pos_top_level is
   for synthesised
      for all: new_coord use configuration work.new_coord_synthesised_cfg;
      end for;
      for all: wallcheck use configuration work.wallcheck_synthesised_cfg;
      end for;
      for all: tank_collision use configuration work.tank_collision_synthesised_cfg;
      end for;
   end for;
end tank_pos_top_level_synthesised_cfg;


