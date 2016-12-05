configuration input_reg_tb_behaviour_cyn_cfg of input_reg_tb is
   for behaviour
      for all: input_register use configuration work.input_register_synthesised_cfg;
      end for;
   end for;
end input_reg_tb_behaviour_cyn_cfg;


