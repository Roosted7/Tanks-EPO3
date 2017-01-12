configuration calculated_new_pos_structural_cfg of calculated_new_pos is
   for structural
      for all: adder_5bits use configuration work.adder_5bits_behaviour_cfg;
      end for;
      for all: new_pos_vec use configuration work.new_pos_vec_behaviour_cfg;
      end for;
   end for;
end calculated_new_pos_structural_cfg;


