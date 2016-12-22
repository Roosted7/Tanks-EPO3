configuration tb_syn_fsm of tb_pg_fsm is
   for beh_fsm
      for all: pg_fsm use configuration work.cfg_syn_pg_fsm;
      end for;
   end for;
end tb_syn_fsm;


