configuration wallcheck_behaviour_cfg of wallcheck is
   for behaviour
      for all: mux_8bits use configuration work.mux_8bits_synthesised_cfg;
      end for;
      for all: tankwalls use configuration work.tankwalls_synthesised_cfg;
      end for;
      for all: mux_1bits use configuration work.mux_1bits_synthesised_cfg;
      end for;
      for all: register1bit use configuration work.register1bit_synthesised_cfg;
      end for;
   end for;
end wallcheck_behaviour_cfg;


