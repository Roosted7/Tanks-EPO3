configuration tb_beh_fsm of tb_pg_fsm is
   for beh_fsm
      for all: pg_fsm use configuration work.cfg_beh_pg_fsm;
      end for;
   end for;
end tb_beh_fsm;


