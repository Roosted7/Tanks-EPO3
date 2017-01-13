configuration tb_syn_tkc of tb_pg_tkc is
   for beh_tkc
      for all: pg_tkc use configuration work.cfg_syn_pg_tkc;
      end for;
   end for;
end tb_syn_tkc;


