configuration tb_ext_top of tb_pg_top is
   for beh_top
      for all: pg_top use configuration work.cfg_ext_pg_top;
      end for;
   end for;
end tb_ext_top;


