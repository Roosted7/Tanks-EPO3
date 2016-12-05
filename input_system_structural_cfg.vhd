configuration input_system_structural_cfg of input_system is
   for structural
      for all: encoder use configuration work.encoder_behaviour_cfg;
      end for;
      for all: tf_rise use configuration work.tf_rise_behaviour_cfg;
      end for;
      for all: input_register use configuration work.input_register_behaviour_cfg;
      end for;
      for all: register_logic use configuration work.register_logic_behaviour_cfg;
      end for;
      for all: input_fsm use configuration work.input_fsm_behaviour_cfg;
      end for;
   end for;
end input_system_structural_cfg;


