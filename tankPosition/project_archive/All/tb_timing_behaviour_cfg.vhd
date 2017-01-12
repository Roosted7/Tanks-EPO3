configuration tb_timing_behaviour_cfg of tb_timing is
   for behaviour
      for all: new_top use configuration work.new_top_synthesised_cfg;
      end for;
   end for;
end tb_timing_behaviour_cfg;


