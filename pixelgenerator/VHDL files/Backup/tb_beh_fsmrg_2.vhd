configuration tb_beh_fsmrg_2 of tb_pg_fsmrg is
   for beh_fsmrg
      for all: pg_fsm use configuration work.cfg_beh_pg_fsm;
      end for;
      for all: pg_prg use configuration work.player_2;
      end for;
   end for;
end tb_beh_fsmrg_2;


