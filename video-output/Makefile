GHDL = ghdl
GTKWAVE = gtkwave

TARGET = vga_out
TB = $(TARGET)_tb

GHDLFLAGS = --vcd=$(TARGET).vcd --stop-time=100ms

default:
	$(GHDL) -a $(TARGET).vhd &
	$(GHDL) -a $(TB).vhd &
	$(GHDL) -e $(TB) &
	$(GHDL) -r $(TB) $(GHDLFLAGS)

test:
	$(GTKWAVE) $(TARGET).vcd

clean:
	$(RM) -f work*.cf *.o