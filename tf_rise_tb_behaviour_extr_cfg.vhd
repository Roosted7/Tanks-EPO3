configuration tf_rise_tb_behaviour_extr_cfg of tf_rise_tb is
   for behaviour
      for all: tf_rise use configuration work.tf_rise_extracted_cfg;
      end for;
   end for;
end tf_rise_tb_behaviour_extr_cfg;


