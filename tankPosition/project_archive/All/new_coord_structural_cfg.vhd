configuration new_coord_structural_cfg of new_coord is
   for structural
      for all: calculated_new_pos use configuration work.calculated_new_pos_structural_cfg;
      end for;
      for all: combiblok_coord use configuration work.combiblok_coord_behaviour_cfg;
      end for;
      for all: mux_2bits use configuration work.mux_2bits_behaviour_cfg;
      end for;
      for all: mux_8bits use configuration work.mux_8bits_behaviour_cfg;
      end for;
   end for;
end new_coord_structural_cfg;


