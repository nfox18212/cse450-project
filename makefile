CC := iverilog
CFLAGS := -g2005-sv 
TARGET := a.vvp
# top refers to top level module, usually the test bench
TOP := -s tb
SRC := ksadder.sv testbench.sv

all: 
	@$(CC) $(CFLAGS)  $(SRC) -o $(TARGET)

run: all
	@vvp $(TARGET)

clean: 
	@rm -rf $(TARGET)