configuration tb_ext_pxc of tb_pg_pxc is
   for beh_pxc
      for all: pg_pxc use configuration work.cfg_ext_pg_pxc;
      end for;
   end for;
end tb_ext_pxc;


