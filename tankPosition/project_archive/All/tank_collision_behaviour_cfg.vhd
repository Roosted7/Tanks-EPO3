configuration tank_collision_behaviour_cfg of tank_collision is
   for behaviour
      for all: fa_5_bit use configuration work.fa_5_bit_behavioural_cfg;
      end for;
      for all: mux_8bits use configuration work.mux_8bits_behaviour_cfg;
      end for;
   end for;
end tank_collision_behaviour_cfg;


