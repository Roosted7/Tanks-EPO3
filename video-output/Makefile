GHDL = ghdl
GTKWAVE = gtkwave

TARGET = clk_div
TB = clk_div_tb
#TB = $(wildcard *_tb.vhd)

GHDLFLAGS = --vcd=$(TARGET).vcd --stop-time=5us

default:
	$(GHDL) -a $(TARGET).vhd &
	$(GHDL) -a $(TB).vhd &
	$(GHDL) -e $(TB) &
	$(GHDL) -r $(TB) $(GHDLFLAGS)

test:
	$(GTKWAVE) $(TARGET).vcd

clean:
	$(RM) -f work*.cf