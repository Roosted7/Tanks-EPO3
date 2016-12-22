configuration tb_syn_pxc of tb_pg_pxc is
   for beh_pxc
      for all: pg_pxc use configuration work.cfg_syn_pg_pxc;
      end for;
   end for;
end tb_syn_pxc;


