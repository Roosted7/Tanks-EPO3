configuration calculated_new_pos_synthesised_cfg of calculated_new_pos is
   for synthesised
      for all: adder_5bits use configuration work.adder_5bits_synthesised_cfg;
      end for;
      for all: new_pos_vec use configuration work.new_pos_vec_synthesised_cfg;
      end for;
   end for;
end calculated_new_pos_synthesised_cfg;


