configuration reg_logic_tb_behaviour_cfg of reg_logic_tb is
   for behaviour
      for all: register_logic use configuration work.register_logic_behaviour_cfg;
      end for;
   end for;
end reg_logic_tb_behaviour_cfg;


