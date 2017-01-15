GHDL = ghdl
GTKWAVE = gtkwave

TARGET = bullet
TB = $(TARGET)_tb

GHDLFLAGS = --vcd=$(TARGET).vcd --stop-time=10000ns

default:
	$(GHDL) -a $(TARGET).vhd
	$(GHDL) -a $(TB).vhd
	$(GHDL) -e $(TB)
	$(GHDL) -r $(TB) $(GHDLFLAGS)

test:
	$(GTKWAVE) $(TARGET).vcd

clean:
	$(RM) -f work*.cf *.o
