configuration cfg_str_pg_tkc of pg_tkc is
   for str_pg_tkc
      for all: pg_pxc use configuration work.cfg_beh_pg_pxc;
      end for;
   end for;
end cfg_str_pg_tkc;


