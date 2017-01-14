GHDL = ghdl
GTKWAVE = gtkwave

TARGET = bullet
TB = $(TARGET)_tb

GHDLFLAGS = --vcd=$(TARGET).vcd --stop-time=10000ns

default:
	$(GHDL) -a register.vhd
	$(GHDL) -a bclk.vhd
	$(GHDL) -a bullet_control.vhd
	$(GHDL) -a bullet_generator.vhd
	$(GHDL) -a bullet_register.vhd
	$(GHDL) -a bullet_updater.vhd
	$(GHDL) -a $(TARGET).vhd
	$(GHDL) -a $(TB).vhd
	$(GHDL) -e $(TB)
	$(GHDL) -r $(TB) $(GHDLFLAGS)

test:
	$(GTKWAVE) $(TARGET).vcd

clean:
	$(RM) -f work*.cf *.o
