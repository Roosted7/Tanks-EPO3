configuration new_coord_synthesised_cfg of new_coord is
   for synthesised
      for all: calculated_new_pos use configuration work.calculated_new_pos_synthesised_cfg;
      end for;
      for all: combiblok_coord use configuration work.combiblok_coord_synthesised_cfg;
      end for;
      for all: mux_2bits use configuration work.mux_2bits_synthesised_cfg;
      end for;
      for all: mux_8bits use configuration work.mux_8bits_synthesised_cfg;
      end for;
   end for;
end new_coord_synthesised_cfg;


