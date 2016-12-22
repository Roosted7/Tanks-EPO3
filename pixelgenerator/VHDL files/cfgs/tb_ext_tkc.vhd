configuration tb_ext_tkc of tb_pg_tkc is
   for beh_tkc
      for all: pg_tkc use configuration work.cfg_ext_pg_tkc;
      end for;
   end for;
end tb_ext_tkc;


