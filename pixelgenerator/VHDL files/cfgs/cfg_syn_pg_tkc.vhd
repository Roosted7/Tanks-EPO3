configuration cfg_syn_pg_tkc of pg_tkc is
   for synthesised
      for all: pg_pxc use configuration work.cfg_syn_pg_pxc;
      end for;
   end for;
end cfg_syn_pg_tkc;


