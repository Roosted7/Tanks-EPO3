configuration input_syst_tb_behaviour_cfg of input_syst_tb is
   for behaviour
      for all: input_system use configuration work.input_system_behaviour_cfg;
      end for;
   end for;
end input_syst_tb_behaviour_cfg;


