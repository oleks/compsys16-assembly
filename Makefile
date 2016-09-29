.PHONY: all clean

SRC=$(patsubst %.S,%.bin,$(wildcard asm/*.S))

all: $(SRC)

%.bin: %.S Makefile
	as -o $*.o --fatal-warnings -g $*.S
	ld -o $*.bin --entry=main $*.o

dump-%.o: asm/%.S Makefile asm/%.o
	objdump --source -M no-aliases asm/$*.o

dump-%.bin: asm/%.S Makefile asm/%.bin
	objdump --source -M no-aliases asm/$*.bin

gdb-%.bin: asm/%.S Makefile asm/%.bin
	gdb -q -x run.gdb asm/$*.bin

clean:
	rm -f asm/*.o
	rm -f asm/*.bin
