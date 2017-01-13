configuration tb_ext_reg of tb_pg_reg is
   for beh_reg
      for all: pg_hrg use configuration work.cfg_ext_pg_hrg;
      end for;
      for all: pg_prg use configuration work.cfg_ext_pg_prg;
      end for;
   end for;
end tb_ext_reg;


