configuration tank_collision_synthesised_cfg of tank_collision is
   for synthesised
      for all: fa_5_bit use configuration work.fa_5_bit_synthesised_cfg;
      end for;
      for all: mux_8bits use configuration work.mux_8bits_synthesised_cfg;
      end for;
   end for;
end tank_collision_synthesised_cfg;


