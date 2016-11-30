GHDL = ghdl
GTKWAVE = gtkwave

TARGET = vga_out
MODULE = timebase
TB = $(TARGET)_tb

GHDLFLAGS = --vcd=$(TARGET).vcd --stop-time=100ms

default:
	$(GHDL) -a $(MODULE).vhd &
	$(GHDL) -a $(TARGET).vhd &
	$(GHDL) -a $(TB).vhd &
	$(GHDL) -e $(TB) &
	$(GHDL) -r $(TB) $(GHDLFLAGS)

test:
	$(GTKWAVE) $(TARGET).vcd

clean:
	$(RM) -f work*.cf *.o