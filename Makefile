.PHONY: all clean

BIN=$(patsubst %.S,%.bin,$(wildcard asm/*.S))

all: $(BIN)

%.o: %.S Makefile
	as -o $@ --fatal-warnings -g $<

%.bin: %.o Makefile
	ld -o $@ --entry=main $<

dump-%.o: asm/%.o Makefile
	objdump --source -M no-aliases $<

dump-%.bin: asm/%.bin Makefile
	objdump --source -M no-aliases $<

gdb-%.bin: asm/%.bin Makefile
	gdb -q -x run.gdb $<

clean:
	rm -f asm/*.o
	rm -f asm/*.bin
