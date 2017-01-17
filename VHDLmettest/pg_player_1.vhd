configuration pg_player_1 of pg_top is
   for str_pg_top
      for all: pg_prg use configuration work.player_1;
      end for;
      for all: pg_hrg use configuration work.cfg_beh_pg_hrg;
      end for;
      for all: pg_pxg use configuration work.cfg_beh_pg_pxg;
      end for;
      for all: pg_tkc use configuration work.cfg_str_pg_tkc;
      end for;
      for all: pg_fsm use configuration work.cfg_beh_pg_fsm;
      end for;
   end for;
end pg_player_1;


