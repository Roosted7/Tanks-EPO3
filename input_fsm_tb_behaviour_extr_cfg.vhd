configuration input_fsm_tb_behaviour_extr_cfg of input_fsm_tb is
   for behaviour
      for all: input_fsm use configuration work.input_fsm_extracted_cfg;
      end for;
   end for;
end input_fsm_tb_behaviour_extr_cfg;


