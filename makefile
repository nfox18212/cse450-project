CC := iverilog
CFLAGS := -g2012 -Wall -Werror
TARGET := a.vvp
# top refers to top level module, usually the test bench
TOP := tb
SRC := $(wildcard *.sv) # wildcard extends to grab all the .sv files
all: 
	@$(CC) $(CFLAGS) -s $(TOP) $(SRC) -o $(TARGET)

run: all
	@vvp $(TARGET)

clean: 
	@rm -rf $(TARGET)