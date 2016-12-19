configuration tb_ext_fsmrg_1 of tb_pg_fsmrg is
   for beh_fsmrg
      for all: pg_fsm use configuration work.cfg_ext_pg_fsm;
      end for;
      for all: pg_prg use configuration work.cfg_ext_pg_prg;
      end for;
   end for;
end tb_ext_fsmrg_1;


