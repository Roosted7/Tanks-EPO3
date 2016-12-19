configuration tb_ext_pxg of tb_pg_pxg is
   for beh_pxg
      for all: pg_pxg use configuration work.cfg_ext_pg_pxg;
      end for;
   end for;
end tb_ext_pxg;


