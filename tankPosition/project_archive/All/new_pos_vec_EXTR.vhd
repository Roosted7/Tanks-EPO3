-- Generated by: xvhdl 3.03 10-Aug-2015
-- Date: 15-Dec-2016 9:33:12
-- Path: /home/jtams/Documents/new_pos/test

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY CellsLib;
USE CellsLib.CellsLib_DECL_PACK.all;

-- user directives added from .sls2vhdl


ARCHITECTURE extracted OF New_pos_vec IS


  SIGNAL new_pos_vector_int: STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

  new_pos_vector <= new_pos_vector_int;


  U30: mu111 PORT MAP (old_pos(3), new_pos(3), input_direction0, new_pos_vector_int(3));
  U26: mu111 PORT MAP (new_pos(3), old_pos(7), input_direction0, new_pos_vector_int(7));
  U33: mu111 PORT MAP (old_pos(0), new_pos(0), input_direction0, new_pos_vector_int(0));
  U29: mu111 PORT MAP (new_pos(0), old_pos(4), input_direction0, new_pos_vector_int(4));
  U28: mu111 PORT MAP (new_pos(1), old_pos(5), input_direction0, new_pos_vector_int(5));
  U31: mu111 PORT MAP (old_pos(2), new_pos(2), input_direction0, new_pos_vector_int(2));
  U32: mu111 PORT MAP (old_pos(1), new_pos(1), input_direction0, new_pos_vector_int(1));
  U27: mu111 PORT MAP (new_pos(2), old_pos(6), input_direction0, new_pos_vector_int(6));

END extracted;



