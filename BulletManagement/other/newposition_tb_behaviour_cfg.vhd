configuration newposition_tb_behaviour_cfg of newposition_tb is
   for behaviour
      for all: newposition use configuration work.newposition_behaviour_cfg;
      end for;
   end for;
end newposition_tb_behaviour_cfg;


