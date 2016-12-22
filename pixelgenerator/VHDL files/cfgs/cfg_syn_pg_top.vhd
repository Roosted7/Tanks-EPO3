configuration cfg_syn_pg_top of pg_top is
   for synthesised
      for all: pg_prg use configuration work.cfg_syn_pg_prg;
      end for;
      for all: pg_hrg use configuration work.cfg_syn_pg_hrg;
      end for;
      for all: pg_pxg use configuration work.cfg_syn_pg_pxg;
      end for;
      for all: pg_tkc use configuration work.cfg_syn_pg_tkc;
      end for;
      for all: pg_fsm use configuration work.cfg_syn_pg_fsm;
      end for;
   end for;
end cfg_syn_pg_top;


