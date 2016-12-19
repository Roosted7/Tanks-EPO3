configuration tb_beh_reg_2 of tb_pg_reg is
   for beh_reg
      for all: pg_hrg use configuration work.cfg_beh_pg_hrg;
      end for;
      for all: pg_prg use configuration work.player_2;
      end for;
   end for;
end tb_beh_reg_2;


